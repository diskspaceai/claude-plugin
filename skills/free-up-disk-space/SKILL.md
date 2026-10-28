---
name: free-up-disk-space
description: Free up disk space on the user's Mac safely with DiskSpace AI. Use when the user says their Mac or disk is full, asks what's taking up space, can't install a macOS update, wants to clean caches, Xcode DerivedData, simulators, Docker, node_modules or AI models, or asks whether a folder is safe to delete.
---

# Free up disk space with DiskSpace AI

Use the `diskspace-ai` MCP tools. They run on the user's Mac; nothing leaves it.

## Steps

1. **Analyze.** Call `analyze_disk`. Note the free space, then group the findings by safety:
   - **safe**: recreates itself (caches, build output, dependencies of idle projects). Deleted right away when cleaned.
   - **review**: worth a look (Docker, simulators, AI models, old installers). Set aside 7 days when cleaned.
   - **keep**: the user's data. Never propose cleaning it.
2. **Summarize briefly.** Lead with how much can be freed with no risk, then the 3–5 biggest items with their size and one line on what each is. Mention review items separately, as a question.
3. **Explain when asked or when something big is unclassified.** Use `explain_folder` for an unknown path and `folder_contents` to see inside one. Never call an unknown folder safe on your own.
4. **Plan.** Call `plan_cleanup` (add review items with `include` only if the user asked for them). Show the user exactly what will be deleted, what will be set aside and the total.
5. **Ask.** Wait for an explicit yes to that plan. A general "clean my Mac" earlier in the conversation is not approval of a specific plan.
6. **Clean.** Call `clean` with the ids from the plan and `confirm: true`. Report what was freed and what was set aside.
7. **Undo.** Remind the user that anything set aside can be restored for 7 days with `undo_last_cleanup`, and do it if they ask.

## Rules

- Never call `clean` without showing a plan and getting a clear yes.
- Don't delete things with your own shell commands (`rm -rf`, `docker system prune`…): `clean` already uses each tool's own command and keeps the 7-day undo.
- If a tool says an app is open (Xcode, Docker, a browser), tell the user to quit it and plan again.
- If cleaning needs DiskSpace AI Pro, say so plainly: analysis is free; cleaning is a one-time purchase (free during the beta, until December 31, 2026).

## If the tools aren't available

The MCP server is the `diskspace` command inside the DiskSpace AI app. If the `diskspace-ai` tools are missing or fail to start, tell the user to install the app from https://diskspaceai.com/download (or `brew install --cask diskspaceai/tap/diskspace-ai`), open it once, and start a new session.
