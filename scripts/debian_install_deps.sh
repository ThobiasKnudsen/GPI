#!/usr/bin/env bash

# ------------------------------------------------------------------
# Script: install_sdl_deps.sh
# Description: Installs common dependencies for building SDL
#              and related libraries, including the Vulkan SDK,
#              on Debian-based systems.
# ------------------------------------------------------------------

set -e  # Exit immediately on error

# Optionally, uncomment to enable debug/verbose output:
# set -x  # Print commands and their arguments as they are executed

### 1) System-wide installs (requires sudo) ###
echo "Updating package lists..."
sudo apt-get update

echo "Installing SDL build dependencies..."
sudo apt-get install -y \
    build-essential \
    cmake \
    git \
    ninja-build \
    libasound2-dev \
    libpulse-dev \
    libx11-dev \
    libxext-dev \
    libxrandr-dev \
    libxcursor-dev \
    libxi-dev \
    libxinerama-dev \
    libxxf86vm-dev \
    libwayland-dev \
    wayland-protocols \
    libwayland-egl-backend-dev \
    libxkbcommon-dev \
    libdrm-dev \
    libgbm-dev \
    libudev-dev \
    libpipewire-0.3-dev \
    libharfbuzz-dev \
    libfreetype6-dev \
    libgl1-mesa-dev \
    libvulkan1 \
    mesa-vulkan-drivers \
    libvulkan-dev \
    vulkan-validationlayers-dev \
    libshaderc-dev \
    libshaderc1

### 2) Download the Vulkan SDK (as normal user, then we sudo only to move stuff) ###
VULKAN_SDK_VERSION="1.4.304.0"  # Replace with the latest version
SDK_ARCHIVE="vulkansdk-linux-x86_64-${VULKAN_SDK_VERSION}.tar.xz"
SDK_URL="https://sdk.lunarg.com/sdk/download/${VULKAN_SDK_VERSION}/linux/${SDK_ARCHIVE}"

echo "Downloading Vulkan SDK version ${VULKAN_SDK_VERSION} ..."
if ! wget "$SDK_URL"; then
    echo "Failed to download Vulkan SDK. Check if the version number is correct."
    echo "You can find the latest version at: https://vulkan.lunarg.com/sdk/latest/linux"
    exit 1
fi

echo "Extracting Vulkan SDK archive..."
tar -xf "$SDK_ARCHIVE" || {
    echo "Failed to extract Vulkan SDK archive."
    exit 1
}

# After extraction, the top-level folder should match $VULKAN_SDK_VERSION.
# Inside that is typically 'x86_64/' with the actual binaries/libraries.
if [ ! -d "${VULKAN_SDK_VERSION}/x86_64" ]; then
    echo "Expected directory structure ${VULKAN_SDK_VERSION}/x86_64 was not found!"
    exit 1
fi

### 3) Move SDK into /opt (requires sudo) ###
sudo mkdir -p "/opt/vulkan-sdk-${VULKAN_SDK_VERSION}"
sudo mv "${VULKAN_SDK_VERSION}/x86_64"/* "/opt/vulkan-sdk-${VULKAN_SDK_VERSION}/" || {
    echo "Failed to move Vulkan SDK to /opt. Check permissions."
    exit 1
}
rm -rf "${VULKAN_SDK_VERSION}"
rm "$SDK_ARCHIVE"

# (Optional) Ensure /opt/vulkan-sdk directory is owned by root
# but typically that is fine so that normal users can read from it.
sudo chown -R root:root "/opt/vulkan-sdk-${VULKAN_SDK_VERSION}"

### 4) Append environment variables to your user’s ~/.zshrc ###
# This is the crucial step to ensure that your normal user picks up the environment
# changes each time you open a new shell.

ZSHRC="${HOME}/.zshrc"

# Check if .zshrc exists, if not, create it
if [ ! -f "$ZSHRC" ]; then
    touch "$ZSHRC"
fi

echo "" >> "$ZSHRC"
echo "# Vulkan SDK environment (added by install_sdl_deps.sh)" >> "$ZSHRC"
echo "export VULKAN_SDK=\"/opt/vulkan-sdk-${VULKAN_SDK_VERSION}\"" >> "$ZSHRC"
echo "export PATH=\"\$VULKAN_SDK/bin:\$PATH\"" >> "$ZSHRC"
echo "export LD_LIBRARY_PATH=\"\$VULKAN_SDK/lib:\$LD_LIBRARY_PATH\"" >> "$ZSHRC"

echo ""
echo "----------------------------------------------------------"
echo "Vulkan SDK has been installed under /opt/vulkan-sdk-${VULKAN_SDK_VERSION}."
echo "Environment variables have been appended to ${ZSHRC}."
echo "Please open a new terminal OR run the command below to load them now:"
echo ""
echo "    source ${ZSHRC}"
echo ""
echo "SDL dependencies and Vulkan SDK installed successfully!"
echo "----------------------------------------------------------"