#!/bin/bash

WEB_ROOT="/var/www"
REPO_DIR="repos/Innoverse-Patcher"
IMAGE_NAME="innoverse-patcher"

cd "$WEB_ROOT" || { echo "Failed to navigate to $WEB_ROOT"; exit 1; }

cd "$REPO_DIR" || { echo "Failed to navigate to $REPO_DIR"; exit 1; }

if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker and try again."
    exit 1
fi

echo "Building Docker image: $IMAGE_NAME..."
docker build . -t "$IMAGE_NAME"

if [ $? -ne 0 ]; then
    echo "Failed to build Docker image."
    exit 1
fi

echo "Compiling the code inside the Docker container..."
docker run -it --rm -v .:/app -w /app "$IMAGE_NAME"

if [ $? -eq 0 ]; then
    echo "Compilation successful!"
else
    echo "Compilation failed."
    exit 1
fi
