#!/bin/bash

# voters-speak GitHub Deployment Package Creator
# This script creates a deployment package for the voters-speak site

set -e

echo "=========================================="
echo "voters-speak Deployment Package Creator"
echo "=========================================="
echo ""

# Configuration
PACKAGE_NAME="voters-speak-github-deployment.zip"
TEMP_DIR="deployment-temp"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Clean up any existing temp directory
if [ -d "$TEMP_DIR" ]; then
    echo "Cleaning up existing temporary directory..."
    rm -rf "$TEMP_DIR"
fi

# Create temporary directory
echo "Creating deployment package..."
mkdir -p "$TEMP_DIR"

# Copy files to temp directory (excluding .git and temp files)
echo "Copying repository files..."
rsync -av --exclude='.git' --exclude='deployment-temp' --exclude='*.zip' \
    --exclude='node_modules' --exclude='*.log' --exclude='*.tmp' \
    ./ "$TEMP_DIR/"

# Create zip package
echo "Creating zip archive..."
cd "$TEMP_DIR"
zip -r "../$PACKAGE_NAME" . > /dev/null 2>&1

# Return to original directory
cd ..

# Clean up temp directory
echo "Cleaning up..."
rm -rf "$TEMP_DIR"

# Display results
echo ""
echo "=========================================="
echo "Deployment package created successfully!"
echo "Package: $PACKAGE_NAME"
echo "Location: $(pwd)/$PACKAGE_NAME"
echo "Size: $(du -h $PACKAGE_NAME | cut -f1)"
echo "=========================================="
echo ""
echo "To extract: unzip $PACKAGE_NAME"
