#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title search_tabs
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "search word" }

on run argv
  set searchWord to ( item 1 of argv )

  tell application "Google Chrome"
    repeat with w in windows
      if given name of w equals "General" or given name of w equals "Dev"
        set i to 1
          repeat with t in tabs of w
            if URL of t contains searchWord or title of t contains searchWord then
              set active tab index of w to i
              set index of w to 1
              activate
              return
            end if
            set i to i + 1
          end repeat
        end if
      end repeat
    end tell
  log searchWord & " was not found"
end run
