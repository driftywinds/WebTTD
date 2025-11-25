FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy game files
COPY openttd.html openttd.js openttd.wasm openttd.data index.html nginx.conf ./

# Copy required directories
COPY ai/ ./ai/
COPY baseset/ ./baseset/
COPY game/ ./game/
COPY lang/ ./lang/

# Create directories for mounted volumes
RUN mkdir -p saves custom

# Expose port 8000
EXPOSE 8000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD python3 -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/')" || exit 1

# Run the HTTP server from app directory
CMD ["python3", "-m", "http.server", "8000", "--bind", "0.0.0.0"]
