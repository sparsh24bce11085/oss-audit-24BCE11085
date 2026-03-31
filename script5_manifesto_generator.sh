#!/bin/bash
# =============================================================
# Script 5: Open Source Manifesto Generator
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | VITyarthi
# Description: Asks the user 3 interactive questions, composes
#              a personalised open-source philosophy statement
#              about VLC, and saves it to a .txt file.
# =============================================================

# --- Alias concept demonstration (shown as a comment) ---
# In a live shell session you could define:
#   alias vlcver='vlc --version 2>&1 | head -1'
# Aliases give short names to longer commands. In scripts,
# we use variables and functions instead, as aliases are not
# always inherited by subshells.

# --- Welcome banner ---
echo "============================================================"
echo "       OPEN SOURCE MANIFESTO GENERATOR — VITyarthi         "
echo "============================================================"
echo ""
echo "  You chose VLC — a media player born in a university dorm,"
echo "  built by students, and given freely to the entire world."
echo ""
echo "  Answer three questions to generate your manifesto."
echo "------------------------------------------------------------"
echo ""

# --- Interactively collect answers using read -p ---
read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""

read -p "  2. In one word, what does 'freedom' mean to you?  " FREEDOM
echo ""

read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

# --- Validate: ensure no answer was left blank ---
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "  [!] Please answer all three questions. Re-run the script."
    exit 1
fi

# --- Get current date and generate personalised output filename ---
DATE=$(date '+%d %B %Y')              # e.g. 25 March 2026
OUTPUT="manifesto_$(whoami).txt"      # Unique to the logged-in user

echo "------------------------------------------------------------"
echo "  Generating your VLC open-source manifesto..."
echo ""

# --- Clear any previous version of the file ---
> "$OUTPUT"

# --- Write manifesto header using >> (append to file) ---
echo "============================================================"  >> "$OUTPUT"
echo "        MY OPEN SOURCE MANIFESTO — VLC EDITION             "  >> "$OUTPUT"
echo "  Generated on : $DATE                                      "  >> "$OUTPUT"
echo "  Author       : $(whoami)                                  "  >> "$OUTPUT"
echo "============================================================"  >> "$OUTPUT"
echo ""                                                              >> "$OUTPUT"

# --- Compose personalised paragraph using string concatenation ---
echo "  I chose VLC as the subject of my open-source audit"         >> "$OUTPUT"
echo "  because its story is one of the purest in open source:"     >> "$OUTPUT"
echo "  students with a problem, no money, and a willingness"       >> "$OUTPUT"
echo "  to build something and give it away."                       >> "$OUTPUT"
echo ""                                                              >> "$OUTPUT"
echo "  Every day, I use $TOOL — a tool that exists because"        >> "$OUTPUT"
echo "  someone made the same choice those Paris students made"     >> "$OUTPUT"
echo "  in 1996: to build in the open and share without condition." >> "$OUTPUT"
echo "  To me, freedom means $FREEDOM. VLC embodies that through"   >> "$OUTPUT"
echo "  its GPL v2 license — anyone can study the code, improve"    >> "$OUTPUT"
echo "  it, and pass those improvements back to the world."         >> "$OUTPUT"
echo ""                                                              >> "$OUTPUT"
echo "  Inspired by this, I would build $BUILD and release it"      >> "$OUTPUT"
echo "  as open source — because the best software is not the"      >> "$OUTPUT"
echo "  software that makes the most money, but the software"       >> "$OUTPUT"
echo "  that helps the most people."                                >> "$OUTPUT"
echo ""                                                              >> "$OUTPUT"
echo "  Open source is not just a license. It is a choice:"         >> "$OUTPUT"
echo "  to build for people, not profit."                           >> "$OUTPUT"
echo ""                                                              >> "$OUTPUT"
echo "  — $(whoami), $DATE"                                          >> "$OUTPUT"
echo "============================================================"  >> "$OUTPUT"

# --- Display the saved manifesto on screen ---
echo "  [✔] Manifesto saved to: $OUTPUT"
echo ""
cat "$OUTPUT"
echo ""
echo "============================================================"
