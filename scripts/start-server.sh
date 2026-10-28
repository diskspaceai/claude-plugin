#!/bin/sh
# Starts DiskSpace AI's local MCP server: the `diskspace` command that ships inside the
# DiskSpace AI app (signed and notarized by Apple). It speaks MCP over stdio and runs
# entirely on this Mac. Nothing is downloaded by this script.
for server in \
    "/Applications/DiskSpace AI.app/Contents/MacOS/diskspace" \
    "$HOME/Applications/DiskSpace AI.app/Contents/MacOS/diskspace" \
    "/opt/homebrew/bin/diskspace" \
    "/usr/local/bin/diskspace"; do
    if [ -x "$server" ]; then
        exec "$server" mcp
    fi
done
echo "DiskSpace AI isn't installed. Download it from https://diskspaceai.com/download or run: brew install --cask diskspaceai/tap/diskspace-ai" >&2
exit 1
