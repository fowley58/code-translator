#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VERSION="1.0.1"
cd "$PROJECT_DIR"

if ! command -v pkg-config >/dev/null 2>&1; then
  echo "pkg-config is required. Install it first." >&2
  exit 1
fi

if ! pkg-config --exists raylib >/dev/null 2>&1; then
  echo "raylib dev package is required. Install it with: sudo apt install libraylib-dev libcurl4-openssl-dev pkg-config" >&2
  exit 1
fi

gcc -Wall -Wextra -std=c11 main.c -o "AI-Code-Translator-$VERSION" \
  $(pkg-config --cflags --libs raylib) \
  -lcurl -lpthread

echo "Linux build created: $PROJECT_DIR/AI-Code-Translator-$VERSION"
echo "Version: $VERSION"
echo "Run with: ./AI-Code-Translator-$VERSION"
