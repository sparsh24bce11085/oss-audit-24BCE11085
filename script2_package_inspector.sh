#!/bin/bash
# =============================================================
# Script 2: FOSS Package Inspector
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | VITyarthi
# Description: Checks if VLC is installed, displays version
#              and license info, and prints a philosophy note
#              about the package using a case statement.
# =============================================================

# --- Define the package to inspect ---
PACKAGE="vlc"   # Our chosen software for this audit

echo "============================================================"
echo "         FOSS PACKAGE INSPECTOR — $PACKAGE                 "
echo "============================================================"
echo ""

# --- Check if the package is installed using if-then-else ---
if command -v dpkg &>/dev/null; then
    # Debian/Ubuntu-based: use dpkg to check installation
    if dpkg -l "$PACKAGE" &>/dev/null; then
        echo "  [✔] $PACKAGE is INSTALLED on this system."
        echo ""
        echo "  --- Package Details ---"
        dpkg -s "$PACKAGE" | grep -E 'Version|Status|Maintainer|Homepage'
    else
        echo "  [✘] $PACKAGE is NOT installed."
        echo "  To install, run: sudo apt install vlc"
        exit 1
    fi

elif command -v rpm &>/dev/null; then
    # RPM-based (Fedora/CentOS/RHEL): use rpm -qi
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "  [✔] $PACKAGE is INSTALLED on this system."
        echo ""
        echo "  --- Package Details ---"
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary|URL'
    else
        echo "  [✘] $PACKAGE is NOT installed."
        echo "  To install, run: sudo dnf install vlc"
        exit 1
    fi

else
    # Fallback: check the vlc binary directly
    if command -v vlc &>/dev/null; then
        echo "  [✔] VLC is INSTALLED (detected via binary)."
    else
        echo "  VLC not found. Install it from videolan.org"
        exit 1
    fi
fi

echo ""
echo "  --- Installed Version ---"
vlc --version 2>&1 | head -1   # Print VLC version line only

echo ""
echo "  --- VLC Executable Location ---"
which vlc                       # Show where VLC binary lives on the system

echo ""
echo "  --- Open Source Philosophy Note ---"

# --- Case statement: print philosophy note based on package name ---
case $PACKAGE in
    vlc)
        echo "  VLC: In 1996, students at Ecole Centrale Paris needed"
        echo "  a way to stream video over their university network."
        echo "  No existing tool was free enough to adapt — so they"
        echo "  built VLC from scratch and released it under GPL."
        echo "  Today it plays virtually every format on every platform,"
        echo "  built entirely by volunteers around the world."
        ;;
    git)
        echo "  Git: Born in 2005 when Linus lost access to BitKeeper."
        echo "  Built in 10 days — open source at its finest."
        ;;
    python3 | python)
        echo "  Python: A language shaped entirely by its community."
        echo "  PSF License ensures it stays free and accessible."
        ;;
    firefox)
        echo "  Firefox: A nonprofit browser defending the open web"
        echo "  against browser monopolies."
        ;;
    httpd | apache2)
        echo "  Apache: The open web server powering ~30% of websites."
        ;;
    *)
        echo "  $PACKAGE: An open-source tool that the world depends on."
        ;;
esac

echo ""
echo "============================================================"
