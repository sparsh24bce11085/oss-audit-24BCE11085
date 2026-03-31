#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | VITyarthi
# Description: Loops through key system directories, reports
#              permissions and disk usage, then checks VLC's
#              specific installation and config directories.
# =============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "============================================================"
echo "         DISK AND PERMISSION AUDITOR — SYSTEM REPORT       "
echo "============================================================"
printf "%-25s %-22s %-10s\n" "Directory" "Perms (Owner:Group)" "Size"
echo "------------------------------------------------------------"

# --- For loop: iterate over each directory in the list ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions, owner and group using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')

        # Get disk usage; suppress permission errors with 2>/dev/null
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        printf "%-25s %-22s %-10s\n" "$DIR" "$PERMS ($OWNER:$GROUP)" "$SIZE"
    else
        printf "%-25s %-22s\n" "$DIR" "[Does not exist]"
    fi
done

echo "------------------------------------------------------------"
echo ""

# --- VLC-Specific Directory Audit ---
echo "  --- VLC-Specific Installation Audit ---"
echo ""

# Check VLC binary location
VLC_BIN=$(which vlc 2>/dev/null)
if [ -n "$VLC_BIN" ]; then
    PERMS=$(ls -l "$VLC_BIN" | awk '{print $1, $3, $4}')
    echo "  [✔] VLC binary         : $VLC_BIN"
    echo "      Permissions        : $PERMS"
else
    echo "  [!] VLC binary not found in PATH."
fi

echo ""

# Check VLC system plugin/data directory (common locations)
for VLC_DIR in /usr/lib/vlc /usr/lib64/vlc /usr/share/vlc; do
    if [ -d "$VLC_DIR" ]; then
        SIZE=$(du -sh "$VLC_DIR" 2>/dev/null | cut -f1)
        PERMS=$(ls -ld "$VLC_DIR" | awk '{print $1, $3, $4}')
        echo "  [✔] VLC system dir     : $VLC_DIR"
        echo "      Permissions        : $PERMS"
        echo "      Size               : $SIZE"
    fi
done

echo ""

# Check VLC user config directory (stores preferences and playlists)
VLC_CONFIG="$HOME/.config/vlc"
if [ -d "$VLC_CONFIG" ]; then
    SIZE=$(du -sh "$VLC_CONFIG" 2>/dev/null | cut -f1)
    PERMS=$(ls -ld "$VLC_CONFIG" | awk '{print $1, $3, $4}')
    echo "  [✔] VLC user config    : $VLC_CONFIG"
    echo "      Permissions        : $PERMS"
    echo "      Size               : $SIZE"
    echo "      (Stores your VLC preferences, hotkeys, and playlists)"
else
    echo "  [!] VLC config dir not found at $VLC_CONFIG"
    echo "      (It is created automatically when VLC is first launched)"
fi

echo ""
echo "============================================================"
