#!/bin/bash

# Finder scriptets egen placering
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "==========================================="
echo "🤖 Starter Job Application Workspace (Template - Tintin)"
echo "==========================================="

echo "🚀 Starter Ollama Server (Port 11434)..."
cd "$DIR/ollama-server" && docker compose up -d

echo "🚀 Starter OpenCode Server (Port 4096)..."
cd "$DIR/opencode-server" && docker compose up -d

echo "🚀 Starter Job Application Agent (Port 3000 & 3002)..."
cd "$DIR/template" && docker compose up -d --build

echo "==========================================="
echo "✅ Alt kører! Adgang via: http://localhost:3000"
echo "==========================================="
