#!/bin/bash
# Image optimization script for Handrail Tech Services
# Converts JPG/PNG images to WebP for better performance

echo "🖼️  Optimizing images for web performance..."

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null && ! command -v magick &> /dev/null; then
    echo "⚠️  ImageMagick not found. Installing via Homebrew..."
    brew install imagemagick
fi

# Navigate to images directory
cd src/images

# Convert JPG images to WebP
for img in *.jpg; do
    if [ -f "$img" ]; then
        filename="${img%.*}"
        echo "Converting $img to WebP..."
        convert "$img" -quality 85 -define webp:lossless=false "${filename}.webp"
    fi
done

echo "✅ Image optimization complete!"
echo "💡 Update your HTML to use WebP images with JPG fallbacks"
