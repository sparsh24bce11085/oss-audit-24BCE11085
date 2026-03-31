#!/bin/bash
# =============================================================
# Script 1: System Identity Report
# Author: Sparsh Patil | Roll: 24BCE11085
# Course: Open Source Software | VITyarthi
# Description: Displays a welcome screen with system info and
#              confirms the OS and VLC license details.
# =============================================================

STUDENT_NAME="Sparsh Patil"       
ROLL_NUMBER="24BCE11085"  
SOFTWARE_CHOICE="VLC Media Player"

KERNEL=$(uname -r)                                                            
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')  
USER_NAME=$(whoami)                                                          
HOME_DIR=$HOME                                                               
UPTIME=$(uptime -p)                                                           
CURRENT_DATE=$(date '+%A, %d %B %Y')                                        
CURRENT_TIME=$(date '+%H:%M:%S')

if command -v vlc &>/dev/null; then
    VLC_VERSION=$(vlc --version 2>&1 | head -1)  
else
    VLC_VERSION="VLC not found"
fi

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
