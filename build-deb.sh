#!/bin/bash

# This script builds the .deb package
# It should be run on a Debian/Ubuntu system

set -e

echo "Building .deb package..."

# Check if we're in the right directory
if [ ! -d "DEBIAN" ]; then
    echo "Error: DEBIAN directory not found. Please run this script from the package root directory."
    exit 1
fi

# Check if dpkg-deb is available
if ! command -v dpkg-deb &> /dev/null; then
    echo "Error: dpkg-deb is not installed. Please install it with:"
    echo "  sudo apt-get update && sudo apt-get install -y dpkg-deb"
    exit 1
fi

# Build the package
PACKAGE_NAME="stacheldrath-agenticai"
VERSION="0.1"
OUTPUT_FILE="${PACKAGE_NAME}_${VERSION}.deb"

echo "Building package: $OUTPUT_FILE"
dpkg-deb --build "$PACKAGE_NAME" "$OUTPUT_FILE"

echo "Package built successfully: $OUTPUT_FILE"
echo ""
echo "To install on a fresh Debian system:"
echo "  sudo dpkg -i $OUTPUT_FILE"
echo "  sudo apt-get install -f  # Install any dependencies"
