# Stacheldrath AgenticAI .deb Package

This package installs curl (if not already installed) and runs the opencode.ai installation script.

## Directory Structure

- `DEBIAN/` - Contains Debian package control files
  - `control` - Package metadata
  - `postinst` - Post-installation script that installs curl and runs the opencode.ai installer

- `home/` - Contains the home directory structure that will be installed

## Building the Package

To build this package, you need a Debian/Ubuntu system with `dpkg-deb` installed:

```bash
# On a Debian/Ubuntu system:
sudo apt-get update
sudo apt-get install -y dpkg-deb

# Then run the build script:
./build-deb.sh
```

## Installing the Package

On a fresh Debian installation:

```bash
# Copy the .deb file to the target system and run:
sudo dpkg -i stacheldrath-agenticai_0.1.deb

# If there are any dependency issues, run:
sudo apt-get install -f
```

## What the Package Does

1. Checks if curl is installed
2. If curl is not installed, installs it using apt/apt-get
3. Runs the opencode.ai installation script: `curl -fsSL https://opencode.ai/install | bash`

## Notes

- The package is designed to work on Debian-based systems
- It handles both apt and apt-get package managers
- The installation script runs with bash and requires internet access
