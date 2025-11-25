# Multi-stage build: Download WebTTD files then serve with nginx
FROM alpine:latest AS downloader

# Install git and other tools
RUN apk add --no-cache git

# Clone the WebTTD repository
WORKDIR /tmp
RUN git clone https://github.com/sigy/WebTTD.git webttd

# Verify the build directory exists and has files
RUN if [ ! -d "/tmp/webttd/build" ]; then \
        echo "ERROR: build/ directory not found in repository!"; \
        echo "Checking repository structure..."; \
        ls -la /tmp/webttd/; \
        exit 1; \
    fi && \
    echo "✓ build/ directory found" && \
    ls -la /tmp/webttd/build/

# Verify essential game files
RUN for file in openttd.html openttd.js openttd.wasm openttd.data; do \
        if [ ! -f "/tmp/webttd/build/$file" ]; then \
            echo "ERROR: Essential file $file not found!"; \
            exit 1; \
        fi; \
    done && \
    echo "✓ All essential game files verified"

# Stage 2: Create the final nginx image
FROM nginx:alpine

# Copy the downloaded build files
COPY --from=downloader /tmp/webttd/build/ /usr/share/nginx/html/

# Create a custom nginx configuration
RUN cat > /etc/nginx/conf.d/default.conf <<'EOF'
server {
    listen 80;
    server_name localhost;
    root /usr/share/nginx/html;
    index index.html;

    # Enable gzip compression
    gzip on;
    gzip_vary on;
    gzip_min_length 1024;
    gzip_types text/plain text/css text/xml text/javascript 
               application/javascript application/xml+rss 
               application/json application/wasm;

    # MIME types for WebAssembly and game files
    types {
        application/wasm wasm;
        application/javascript js;
        text/html html;
        text/css css;
        application/octet-stream data;
    }

    location / {
        try_files $uri $uri/ =404;
        add_header Cache-Control "public, max-age=3600";
        add_header Access-Control-Allow-Origin "*";
        add_header Access-Control-Allow-Methods "GET, OPTIONS";
    }

    location ~* \.wasm$ {
        add_header Content-Type application/wasm;
        add_header Cache-Control "public, max-age=3600";
        add_header Access-Control-Allow-Origin "*";
    }

    location ~* \.data$ {
        add_header Content-Type application/octet-stream;
        add_header Cache-Control "public, max-age=3600";
    }

    location = /favicon.ico {
        log_not_found off;
        access_log off;
    }
}
EOF

# Verify files were copied correctly
RUN ls -lah /usr/share/nginx/html/ && \
    if [ ! -f /usr/share/nginx/html/openttd.wasm ]; then \
        echo "ERROR: Game files not properly copied!"; \
        exit 1; \
    fi && \
    echo "✓ WebTTD ready to serve!"

# Expose port 80
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
