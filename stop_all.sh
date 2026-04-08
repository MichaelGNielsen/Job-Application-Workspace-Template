#!/bin/bash

# Finder scriptets egen placering
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "==============================================="
echo "🧹 Stopper Job Application Workspace (Template)"
echo "==============================================="

echo "🛑 Stopper Job Application Agent (Template)..."
cd "$DIR/template" && docker compose down

echo "🛑 Stopper OpenCode Server..."
cd "$DIR/opencode-server" && docker compose down

echo "🛑 Stopper Ollama Server..."
cd "$DIR/ollama-server" && docker compose down

echo "==============================================="
echo "✅ Alle containere er stoppet og fjernet."
echo "==============================================="
