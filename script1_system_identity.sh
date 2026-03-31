#!/bin/bash
# =============================================================
# Script 1: System Identity Report
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | VITyarthi
# Description: Displays a welcome screen with system info and
#              confirms the OS and VLC license details.
# =============================================================

# --- Student & Software Variables ---
STUDENT_NAME="[Your Name]"         # Replace with your name
ROLL_NUMBER="[Your Roll Number]"   # Replace with your roll number
SOFTWARE_CHOICE="VLC Media Player" # Chosen open-source software

# --- Gather System Information using command substitution ---
KERNEL=$(uname -r)                                                            # Linux kernel version
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')  # Distro name
USER_NAME=$(whoami)                                                           # Currently logged-in user
HOME_DIR=$HOME                                                                # Home directory of current user
UPTIME=$(uptime -p)                                                           # Human-readable system uptime
CURRENT_DATE=$(date '+%A, %d %B %Y')                                         # Formatted current date
CURRENT_TIME=$(date '+%H:%M:%S')                                             # Current time

# --- Get VLC version if installed ---
if command -v vlc &>/dev/null; then
    VLC_VERSION=$(vlc --version 2>&1 | head -1)   # e.g. VLC media player 3.0.18
else
    VLC_VERSION="VLC not found"
fi

# --- Display the System Identity Report ---
echo "============================================================"
echo "        OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT         "
echo "============================================================"
echo ""
echo "  Student    : $STUDENT_NAME ($ROLL_NUMBER)"
echo "  Software   : $SOFTWARE_CHOICE"
echo "------------------------------------------------------------"
echo "  Distro     : $DISTRO"
echo "  Kernel     : $KERNEL"
echo "  User       : $USER_NAME"
echo "  Home Dir   : $HOME_DIR"
echo "  Uptime     : $UPTIME"
echo "  Date       : $CURRENT_DATE"
echo "  Time       : $CURRENT_TIME"
echo "  VLC        : $VLC_VERSION"
echo "------------------------------------------------------------"

# --- License message for VLC and the OS ---
echo "  OS License   : The Linux kernel is licensed under GPL v2."
echo "                 You have the freedom to run, study, modify,"
echo "                 and distribute this software freely."
echo ""
echo "  VLC License  : VLC media player is licensed under the"
echo "                 GNU General Public License v2 (GPL v2)."
echo "                 Its core libraries (libVLC) use LGPL v2.1,"
echo "                 allowing them to be used in proprietary apps."
echo "                 VLC was created by students at Ecole Centrale"
echo "                 Paris in 1996 to stream video across campus."
echo "============================================================"
echo ""
