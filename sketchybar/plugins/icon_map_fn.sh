#!/bin/bash

function icon_map() {
  case "$1" in
  "Activity Monitor")
    icon_result=":activity_monitor:"
    ;;
  "Alacritty")
    icon_result=":alacritty:"
    ;;
  "Alfred")
    icon_result=":alfred:"
    ;;
  "Android Studio")
    icon_result=":android_studio:"
    ;;
  "App Store")
    icon_result=":app_store:"
    ;;
  "Arc")
    icon_result=":arc:"
    ;;
  "Atom")
    icon_result=":atom:"
    ;;
  "Bambu Studio")
    icon_result=":bambu_studio:"
    ;;
  "Bazecor")
    icon_result=":bazecor:"
    ;;
  "Bitwarden")
    icon_result=":bit_warden:"
    ;;
  "Brave Browser")
    icon_result=":brave_browser:"
    ;;
  "Calendar")
    icon_result=":calendar:"
    ;;
  "Code")
    icon_result=":code:"
    ;;
  "Color Picker")
    icon_result=":color_picker:"
    ;;
  "Cypress")
    icon_result=":cypress:"
    ;;
  "Default")
    icon_result=":default:"
    ;;
  "CleanMyMac X")
    icon_result=":desktop:"
    ;;
  "Discord")
    icon_result=":discord:"
    ;;
  "Docker" | "Docker Desktop")
    icon_result=":docker:"
    ;;
  "Emacs")
    icon_result=":emacs:"
    ;;
  "FaceTime")
    icon_result=":face_time:"
    ;;
  "Figma")
    icon_result=":figma:"
    ;;
  "Final Cut Pro")
    icon_result=":final_cut_pro:"
    ;;
  "Finder")
    icon_result=":finder:"
    ;;
  "Firefox")
    icon_result=":firefox:"
    ;;
  "Firefox Developer Edition" | "Firefox Nightly")
    icon_result=":firefox_developer_edition:"
    ;;
  "Font Book")
    icon_result=":book:"
    ;;
  "Fusion")
    icon_result=":fusion:"
    ;;
  "System Preferences" | "System Settings")
    icon_result=":gear:"
    ;;
  "Ghostty")
    icon_result=":ghostty:"
    ;;
  "GitHub Desktop")
    icon_result=":git_hub:"
    ;;
  "GoLand")
    icon_result=":goland:"
    ;;
  "Chromium" | "Google Chrome" | "Google Chrome Canary")
    icon_result=":google_chrome:"
    ;;
  "Grammarly Editor")
    icon_result=":grammarly:"
    ;;
  "IntelliJ IDEA")
    icon_result=":idea:"
    ;;
  "iTerm")
    icon_result=":iterm:"
    ;;
  "Jellyfin Media Player")
    icon_result=":jellyfin:"
    ;;
  "Keynote")
    icon_result=":keynote:"
    ;;
  "kitty")
    icon_result=":kitty:"
    ;;
  "Mail")
    icon_result=":mail:"
    ;;
  "Maps" | "Google Maps")
    icon_result=":maps:"
    ;;
  "Matlab")
    icon_result=":matlab:"
    ;;
  "Messages")
    icon_result=":messages:"
    ;;
  "Messenger")
    icon_result=":messenger:"
    ;;
  "Microsoft Edge")
    icon_result=":microsoft_edge:"
    ;;
  "Microsoft Excel")
    icon_result=":microsoft_excel:"
    ;;
  "Microsoft PowerPoint")
    icon_result=":microsoft_power_point:"
    ;;
  "Microsoft Teams" | "Microsoft Teams (work or school)")
    icon_result=":microsoft_teams:"
    ;;
  "Microsoft Word")
    icon_result=":microsoft_word:"
    ;;
  "Music")
    icon_result=":music:"
    ;;
  "NordVPN")
    icon_result=":nord_vpn:"
    ;;
  "Notability")
    icon_result=":notability:"
    ;;
  "Notes")
    icon_result=":notes:"
    ;;
  "Notion")
    icon_result=":notion:"
    ;;
  "Numbers")
    icon_result=":numbers:"
    ;;
  "Obsidian")
    icon_result=":obsidian:"
    ;;
  "OBS")
    icon_result=":obsstudio:"
    ;;
  "Microsoft Outlook")
    icon_result=":microsoft_outlook:"
    ;;
  "Pages")
    icon_result=":pages:"
    ;;
  "Parallels Desktop")
    icon_result=":parallels:"
    ;;
  "Parsec")
    icon_result=":parsec:"
    ;;
  "Preview")
    icon_result=":pdf_old:"
    ;;
  "Pi-hole Remote")
    icon_result=":pihole:"
    ;;
  "Plex HTPC")
    icon_result=":plex:"
    ;;
  "Podcasts")
    icon_result=":podcasts:"
    ;;
  "Postman")
    icon_result=":postman:"
    ;;
  "PyCharm")
    icon_result=":pycharm:"
    ;;
  "Raycast")
    icon_result=":raycast:"
    ;;
  "Reeder")
    icon_result=":reeder5:"
    ;;
  "Reminders")
    icon_result=":reminders:"
    ;;
  "Rider" | "JetBrains Rider")
    icon_result=":rider:"
    ;;
  "Safari")
    icon_result=":safari:"
    ;;
  "Skype")
    icon_result=":skype:"
    ;;
  "Slack")
    icon_result=":slack:"
    ;;
  "Spotify")
    icon_result=":spotify:"
    ;;
  "Spotlight")
    icon_result=":spotlight:"
    ;;
  "Steam")
    icon_result=":steam:"
    ;;
  "Sublime Text")
    icon_result=":sublime_text:"
    ;;
  "Telegram")
    icon_result=":telegram:"
    ;;
  "Terminal")
    icon_result=":terminal:"
    ;;
  "Microsoft To Do" | "Things")
    icon_result=":things:"
    ;;
  "Todoist")
    icon_result=":todoist:"
    ;;
  "Trello")
    icon_result=":trello:"
    ;;
  "Tweetbot" | "Twitter")
    icon_result=":twitter:"
    ;;
  "Neovide" | "MacVim" | "Vim" | "VimR")
    icon_result=":vim:"
    ;;
  "VLC" | "Elmedia Player")
    icon_result=":vlc:"
    ;;
  "VMware Fusion")
    icon_result=":vmware_fusion:"
    ;;
  "VSCodium")
    icon_result=":vscodium:"
    ;;
  "Warp")
    icon_result=":warp:"
    ;;
  "Weather")
    icon_result=":weather:"
    ;;
  "WebStorm")
    icon_result=":web_storm:"
    ;;
  "Windows App")
    icon_result=":windows_app:"
    ;;
  "WezTerm")
    icon_result=":wezterm:"
    ;;
  "WhatsApp" | "‎WhatsApp")
    icon_result=":whats_app:"
    ;;
  "Xcode")
    icon_result=":xcode:"
    ;;
  "Zed")
    icon_result=":zed:"
    ;;
  "zoom.us")
    icon_result=":zoom:"
    ;;
  "Zotero")
    icon_result=":zotero:"
    ;;
  *)
    icon_result=":default:"
    ;;
  esac
}
icon_map "$1"
echo "$icon_result"
