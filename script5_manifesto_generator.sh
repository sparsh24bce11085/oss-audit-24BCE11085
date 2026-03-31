#!/bin/bash
# =============================================================
# Script 5: Open Source Manifesto Generator
# Author: Sparsh Patil | Roll: 24BCE11085
# Course: Open Source Software | VITyarthi
# Description: Asks the user 3 interactive questions, composes
#              a personalised open-source philosophy statement
#              about VLC, and saves it to a .txt file.
# =============================================================
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

read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""

read -p "  2. In one word, what does 'freedom' mean to you?  " FREEDOM
echo ""

read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "  [!] Please answer all three questions. Re-run the script."
    exit 1
fi

DATE=$(date '+%d %B %Y')              
OUTPUT="manifesto_$(whoami).txt"      

echo "------------------------------------------------------------"
echo "  Generating your VLC open-source manifesto..."
echo ""

> "$OUTPUT"

echo "============================================================"  >> "$OUTPUT"
echo "        MY OPEN SOURCE MANIFESTO — VLC EDITION             "  >> "$OUTPUT"
echo "  Generated on : $DATE                                      "  >> "$OUTPUT"
echo "  Author       : $(whoami)                                  "  >> "$OUTPUT"
echo "============================================================"  >> "$OUTPUT"
echo ""                                                              >> "$OUTPUT"

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

echo "  [✔] Manifesto saved to: $OUTPUT"
echo ""
cat "$OUTPUT"
echo ""
echo "============================================================"
