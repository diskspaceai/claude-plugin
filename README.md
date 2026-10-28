# DiskSpace AI for Claude

Free up space on your Mac without guessing. This plugin connects Claude to [DiskSpace AI](https://diskspaceai.com), a native Mac app that knows 60+ kinds of folders (Xcode DerivedData, simulators, Docker, npm, pnpm and uv caches, AI models…), tells you what each one is and cleans only what recreates itself.

## What you need

- A Mac with macOS 15 or later.
- The DiskSpace AI app, signed and notarized by Apple: download it from [diskspaceai.com/download](https://diskspaceai.com/download) or run `brew install --cask diskspaceai/tap/diskspace-ai`.

The plugin's MCP server is the `diskspace` command inside the app. It runs locally, so it works in Claude Code and in Cowork sessions on your Mac (not in web chat).

## Install

In Claude Code:

```
/plugin install diskspace-ai --marketplace diskspaceai/claude-plugin
```

## Use it

Ask Claude "what's taking up space on my Mac?" or run `/diskspace-ai:free-space`. Claude analyzes the disk, explains what each big folder is, shows a cleanup plan and waits for your OK. Items that recreate themselves are deleted with their own tool's command; anything else is set aside for 7 days and can be restored by asking Claude to undo the last cleanup.

Analysis is free. Cleaning is part of DiskSpace AI Pro, a one-time purchase, free for everyone during the beta until December 31, 2026.

## What the plugin runs

- `scripts/start-server.sh` looks for the `diskspace` command in `/Applications/DiskSpace AI.app`, `~/Applications/DiskSpace AI.app`, `/opt/homebrew/bin` or `/usr/local/bin`, and starts it with `diskspace mcp` (MCP over stdio). It downloads nothing.
- The skill tells Claude to always show a plan and get your explicit approval before cleaning.

## Privacy Policy

The plugin itself collects and stores nothing. The DiskSpace AI server runs on your Mac: it reads folder names and sizes to analyze the disk and only deletes what you approve. What it returns to Claude (folder names, paths and sizes, never the contents of your files) is sent to Anthropic as part of your conversation, under Anthropic's terms. DiskSpace AI itself only connects to the internet to check for updates and, if you buy Pro, to validate your license key with Lemon Squeezy, its payment provider; it has no analytics and sells or shares nothing else. Cleanup history and set-aside files stay on your Mac (`~/Library/Application Support/DiskSpaceAI`) and set-aside files are deleted after 7 days. Full policy: [diskspaceai.com/privacy](https://diskspaceai.com/privacy). Contact: support@diskspaceai.com.

## Support

[github.com/diskspaceai/diskspace-ai/issues](https://github.com/diskspaceai/diskspace-ai/issues) · support@diskspaceai.com

## License

The plugin's files are MIT licensed (see `LICENSE`). DiskSpace AI is a separate, proprietary app.
