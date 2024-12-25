#!/data/data/com.termux/files/usr/bin/bash

# Define colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
GRAY='\033[0;90m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m' # No Color

# Clear the screen
clear

# Draw the banner in a container
banner_top="┌──────────────────────────────────────────────────────────────────────────┐"
banner_bottom="└──────────────────────────────────────────────────────────────────────────┘"
banner_content=(
    " ████████╗███████╗██████╗ ███╗   ██╗██╗   ██╗███╗   ███╗ ██████╗ ██████╗  ██████╗ ████████╗ "
    " ╚══██╔══╝██╔════╝██╔══██╗████╗  ██║██║   ██║████╗ ████║██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝ "
    "    ██║   █████╗  ██████╔╝██╔██╗ ██║██║   ██║██╔████╔██║██║  ██║██████╔╝██║   ██║   ██║    "
    "    ██║   ██╔══╝  ██╔═══╝ ██║╚██╗██║██║   ██║██║╚██╔╝██║██║  ██║██╔═══╝ ██║   ██║   ██║    "
    "    ██║   ███████╗██║     ██║ ╚████║╚██████╔╝██║ ╚═╝ ██║██████╔╝██║     ╚██████╔╝   ██║    "
    "    ╚═╝   ╚══════╝╚═╝     ╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚═════╝ ╚═╝      ╚═════╝    ╚═╝    "
)

# Print the banner container
echo -e "${CYAN}${banner_top}${NC}"
for line in "${banner_content[@]}"; do
    printf " ${CYAN}│${NC} %-72s ${CYAN}│${NC}\n" "$line"
done
printf " ${CYAN}│${NC}%70s${CYAN} By: Sci Frozen ${CYAN}│${NC}\n" ""
echo -e "${CYAN}${banner_bottom}${NC}"

# Loading animation
echo -ne "${YELLOW}Initializing environment..."
for i in {1..10}; do
    echo -ne "${CYAN}█"
    sleep 0.2
done
echo -e "${GREEN} DONE!${NC}"
sleep 1

# Ask for user name
echo -e "${PURPLE}Welcome to Termux-Root, your hub for secure scripts and innovation.${NC}"
read -p "$(echo -e ${GREEN}Please enter your name:${NC} ) " name
echo -e "${GRAY}Hello, ${YELLOW}$name${GRAY}! Preparing your secure setup...${NC}"
sleep 2

# Check and validate folder existence
if [ ! -d /data/data/com.termux/files/home/TermuxRoot-Script ]; then
    echo -e "${RED}Error:${NC} Required folder not found. Ensure TermuxRoot-Script is correctly placed and try again."
    exit 1
fi

# File operations
echo -e "${BLUE}Moving necessary files...${NC}"
sleep 1
mv -f TermuxRoot-Script/sources.list TermuxRoot-Script/trusted.gpg /data/data/com.termux/files/usr/etc/apt
echo -e "${GREEN}✓ Moved sources.list and trusted.gpg.${NC}"

cd TermuxRoot-Script/sources.list.d
echo -e "${BLUE}Updating sources.list.d...${NC}"
mv -f *.list /data/data/com.termux/files/usr/etc/apt/sources.list.d
echo -e "${GREEN}✓ Sources.list.d files moved.${NC}"

cd ../trusted.gpg.d
echo -e "${BLUE}Updating trusted.gpg.d...${NC}"
mv -f *.gpg /data/data/com.termux/files/usr/etc/apt/trusted.gpg.d
echo -e "${GREEN}✓ Trusted.gpg.d files moved.${NC}"

# Prompt for package update
read -p "$(echo -e ${CYAN}Would you like to update all packages now? [Y/n]:${NC} ) " update_choice

if [[ "$update_choice" =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Updating packages, please wait...${NC}"
    apt-get update && apt-get upgrade -y
    pkg update && pkg upgrade -y
    echo -e "${GREEN}✓ Packages updated successfully.${NC}"
else
    echo -e "${GRAY}Skipping updates as per your choice.${NC}"
fi

# Direct user to YouTube channel
echo -e "${GREEN}Setup complete, $name! Show your support by subscribing to our YouTube channel.${NC}"
echo -e "${BLUE}Opening YouTube now...${NC}"
sleep 2

xdg-open "https://youtube.com/@scifrozen-yt?si=FXFPDDJIGJa59W95"

echo -e "${PURPLE}Thank you for using Termux-Root. Goodbye!${NC}"
sleep 2
clear

# Cleanup and exit
echo -e "${PURPLE}Cleaning up temporary files...${NC}"
rm -f /data/data/com.termux/files/home/storage/downloads/TermuxRoot-Script.zip
rm -rf /data/data/com.termux/files/home/TermuxRoot-Script
sleep 1
