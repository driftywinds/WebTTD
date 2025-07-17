# OpenTTD Web Build

🚂 **OpenTTD in Your Browser** - The classic transport simulation game, now running as a WebAssembly application!

![OpenTTD](https://img.shields.io/badge/OpenTTD-WebAssembly-blue)
![Status](https://img.shields.io/badge/Status-Working-green)
![Size](https://img.shields.io/badge/Size-16MB-orange)

## 🎮 What is This?

This is a fully functional web version of OpenTTD (Open Transport Tycoon Deluxe) compiled to WebAssembly. Play the complete transport simulation game directly in your browser without any downloads or installations!

### ✨ Features

- 🌍 **Full Game Experience** - Complete OpenTTD gameplay
- 🤖 **AI Opponents** - Compete against computer players  
- 💾 **Save/Load Games** - Persistent saves in browser storage
- 🗺️ **Map Generation** - Create custom worlds
- 🚂 **All Transport Types** - Trains, trucks, ships, and aircraft
- 🏗️ **Scenario Editor** - Build custom scenarios
- 🌐 **No Installation** - Runs entirely in your browser

## 🚀 Quick Start

### Option 1: Simple Setup
1. **Start a web server:**
   ```bash
   python3 -m http.server 8000
   ```

2. **Open your browser:**
   - Go to: `http://localhost:8000/index.html`
   - Or direct: `http://localhost:8000/openttd.html`

3. **Start Playing!**
   - Click "Generate World" to create a new game
   - Build roads, railways, and transport networks
   - Make money by connecting cities and industries

### Option 2: Alternative Servers
```bash
# Using Node.js
npx http-server -p 8000 -c-1 --cors

# Using PHP
php -S localhost:8000

# Using Ruby
ruby -run -ehttpd . -p8000
```

## 🎯 Getting Started Guide

### First Time Playing
1. **Generate a World:**
   - Click "Generate World" from the main menu
   - Adjust settings if desired (map size, terrain, etc.)
   - Click "Generate"

2. **Basic Gameplay:**
   - **Build Roads:** Use the road tool to connect cities
   - **Build Stations:** Place bus/truck stops near towns
   - **Buy Vehicles:** Purchase buses or trucks
   - **Create Routes:** Set up vehicle orders to transport passengers/cargo
   - **Expand:** Build railways, airports, and ship routes as you grow

3. **Game Controls:**
   - **Mouse:** Click and drag to pan the map
   - **Scroll Wheel:** Zoom in/out
   - **Right Click:** Context menu
   - **Space:** Pause/unpause
   - **ESC:** Close dialogs

## 📁 File Structure

```
build/
├── openttd.html      # Main game interface
├── openttd.js        # JavaScript runtime (244KB)
├── openttd.wasm      # WebAssembly binary (11MB)
├── openttd.data      # Game assets (2.4MB)
├── index.html        # User-friendly wrapper
├── baseset/          # Graphics, fonts, sounds (1.5MB)
├── lang/             # Language files (English only)
├── ai/               # AI player scripts
└── game/             # Game scripts
```

## 🌐 Browser Requirements

### Supported Browsers
- ✅ **Chrome 69+** (Recommended)
- ✅ **Firefox 65+**  
- ✅ **Safari 14+**
- ✅ **Edge 79+**

### System Requirements
- **JavaScript:** Must be enabled
- **WebAssembly:** Required (all modern browsers)
- **RAM:** 1GB+ recommended
- **Storage:** ~16MB download + save games

## 💾 Save Games

### How Saves Work
- **Automatic:** Game autosaves periodically
- **Manual:** Use in-game save/load menus
- **Storage:** Saves stored in browser's IndexedDB
- **Persistence:** Saves persist between sessions

### ⚠️ Important Notes
- **Browser Storage:** Clearing browser data will delete saves
- **Private Mode:** Saves may not persist in incognito/private browsing
- **Backup:** No automatic backup - save important games manually

## 🔧 Troubleshooting

### Common Issues

#### Game Won't Load
```bash
# Check browser console (F12) for errors
# Ensure server is running
# Try different browser
# Clear browser cache (Ctrl+Shift+R)
```

#### Performance Issues
- Close other browser tabs
- Reduce game graphics settings (if available)
- Use smaller map sizes
- Try Chrome for best performance

#### Save Games Lost
- Check if browser storage was cleared
- Avoid private/incognito mode
- Export important saves regularly

#### Network Errors
```bash
# Ensure files are served over HTTP (not file://)
# Check for CORS issues if serving from different domain
# Verify all files present with: python3 verify.py
```

## 🎮 Gameplay Tips

### For New Players
1. **Start Small:** Begin with bus routes between nearby cities
2. **Watch Money:** Keep an eye on your finances
3. **Research:** Industries need specific cargo types
4. **Timing:** Some industries appear only in certain years
5. **Competition:** AI players will compete for routes

### Advanced Strategies
- **Feeder Systems:** Use small vehicles to feed main lines
- **Cargo Chains:** Connect raw materials to processing industries
- **Signal Systems:** Learn railway signaling for complex networks
- **Station Design:** Efficient station layouts improve throughput

## 🔗 Useful Links

- **Official OpenTTD:** https://www.openttd.org/
- **OpenTTD Wiki:** https://wiki.openttd.org/
- **Game Manual:** https://wiki.openttd.org/en/Manual/Main%20Page
- **Community:** https://www.tt-forums.net/

## 📊 Technical Details

### Build Information
- **Compiler:** Emscripten 4.0.11
- **Source:** OpenTTD master branch
- **Build Type:** Release (optimized)
- **Languages:** English only (for size optimization)

### Performance
- **Size:** 16MB total download
- **Memory:** Dynamic allocation up to browser limits
- **CPU:** ~70-80% of native performance
- **Graphics:** Software rendering via SDL2

## 🐛 Known Limitations

### Missing Features
- ❌ **NewGRF Support** - Custom graphics/gameplay modifications
- ❌ **Music** - Background music disabled
- ❌ **Advanced Sound** - Limited audio implementation
- ❌ **Full Multiplayer** - WebSocket servers only

### Web-Specific Issues
- **Mobile Support:** Limited touch interface
- **File Access:** No direct file system access
- **Mods:** Cannot load external modifications
- **Performance:** Slower than native version

## 🤝 Contributing

Found a bug or want to improve something? This build was created using the standard OpenTTD source code. For game-related issues, visit the [OpenTTD GitHub](https://github.com/OpenTTD/OpenTTD).

## 📄 License

OpenTTD is licensed under the GNU General Public License v2.0. See the original OpenTTD repository for full license details.

---

**Happy Building! 🚂🏗️**

*Build your transport empire, one track at a time!*