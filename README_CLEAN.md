# OpenTTD Web Build - Cleaned Version

## 🧹 Cleanup Summary

This directory contains only the essential files needed to run OpenTTD in a web browser.

### ✅ Files Kept (Total: ~16MB)

**Core Web Files:**
- `openttd.html` (12KB) - Main game HTML file
- `openttd.js` (244KB) - JavaScript runtime  
- `openttd.wasm` (11MB) - WebAssembly binary
- `openttd.data` (2.4MB) - Game data files
- `index.html` (8KB) - User-friendly wrapper

**Game Assets:**
- `baseset/` (1.5MB) - Required game assets (fonts, graphics, sounds)
- `lang/english.lng` (152KB) - English language file only
- `ai/` (68KB) - AI scripts (16 files)
- `game/` (56KB) - Game scripts (13 files)

### 🗑️ Files Removed

**Build Artifacts (~50MB saved):**
- `CMakeFiles/` - CMake build system files
- `CMakeCache.txt` - CMake configuration cache
- `compile_commands.json` - Compilation database
- `Makefile` - Build makefiles
- `src/` - Source code directory
- `bin/` - Binary directory
- `generated/` - Generated source files
- `media/` - Media build files
- `regression/` - Test files
- `Testing/` - Test results
- Various CMake, CTest, and CPack configuration files

**Language Files (~10MB saved):**
- 64 non-English language files removed
- Kept only `english.lng` for minimal download size

## 🚀 How to Run

1. **Start web server:**
   ```bash
   python3 -m http.server 8000
   ```

2. **Open in browser:**
   - User-friendly: `http://localhost:8000/index.html`
   - Direct access: `http://localhost:8000/openttd.html`

## 📦 Deployment Ready

This cleaned build is optimized for web deployment:
- **Minimal size:** Only 16MB (down from ~65MB)
- **Self-contained:** All dependencies included
- **No build artifacts:** Clean for production
- **English-only:** Faster loading for most users

## 🎮 Full Functionality

Despite the cleanup, all game features remain available:
- Complete transport simulation
- AI opponents
- Save/load functionality
- All vehicle types
- Map generation
- Scenario editor

The cleanup only removed development files and non-English languages, keeping all core game functionality intact.