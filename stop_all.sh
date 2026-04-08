#!/bin/bash

# Finder scriptets egen placering
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "==============================================="
echo "🧹 Stopper Job Application Workspace (Cleanup)"
echo "==============================================="

# Tjekker hvilken agent-mappe der findes (mgn eller template)
if [ -d "$DIR/mgn" ]; then
    AGENT_DIR="mgn"
elif [ -d "$DIR/template" ]; then
    AGENT_DIR="template"
fi

echo "🛑 Stopper Job Application Agent ($AGENT_DIR)..."
if [ -n "$AGENT_DIR" ]; then
    cd "$DIR/$AGENT_DIR" && docker compose down
fi

echo "🛑 Stopper OpenCode Server..."
cd "$DIR/opencode-server" && docker compose down

echo "🛑 Stopper Ollama Server..."
cd "$DIR/ollama-server" && docker compose down

echo "==============================================="
echo "✅ Alle containere er stoppet og fjernet."
echo "==============================================="
