#!/data/data/com.termux/files/usr/bin/bash

# Define colors for output
#!/bin/bash

# define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
GRAY='\033[0;90m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m' # No Color

clear
# banner
echo -e "${CYAN}"
echo -e " _______                          __        "
echo -e " /       \                       /  |       "
echo -e " $$$$$$$  |   ______    ______   _$$ |_      "
echo -e " $$ |__$$ |  /      \  /      \ / $$   |     "
echo -e " $$    $$< /$$$$$$  |/$$$$$$ |$$$$$$/     "
echo -e " $$$$$$$  |$$ |   $$ |$$ |  $$ |  $$ | __   "
echo -e " $$ |   $$ |$$ \_  $$ |$$ \__$$ |  $$ |/  |  "
echo -e " $$ |   $$ |$$    $$/ $$    $$/   $$  $$/ "
echo -e " $$/   $$/  $$$$$$/   $$$$$$/     $$$$/  "
echo -e "${WHITE}"


# Show loading animation
echo -e "${YELLOW}Loading...${GREEN}"
spin='-\|/'
for i in {1..6}; do
    printf "\b${spin:i%${#spin}:1}"
    sleep 1
done

# Prompt user for name
read -p "$(echo -e ${PURPLE}Welcome to the lab! Let\'s set our lab to a more secure tomorrow. Your name please! ${NC})" name

# Print welcome message
printf "\n${GRAY}Perfect, %s!${NC}\n" "$name"
sleep 1
printf "
${BLUE}This script will 
 move some files to your Termux /data folder
 	and update pkgs .${NC}\n
 	"
sleep 2
# Check if folder exists
if [ -d /data/data/com.termux/files/home/TermuxRoot-Script ]; then
    echo -e "${YELLOW}Running script...${NC}"
else
    echo -e "${RED}Error: The folder /data/data/com.termux/files/home/TermuxRoot-Script
    doesn't exist.
    Please extract the zip file to this location and try again.${NC}"
    exit 1
fi

# Move files to Termux /data folder
printf "Moving files...\n"
sleep 1
mv -f TermuxRoot-Script/sources.list TermuxRoot-Script/trusted.gpg /data/data/com.termux/files/usr/etc/apt
printf "${GREEN}sources.list and trusted.gpg moved${NC}\n"
sleep 1
cd TermuxRoot-Script/sources.list.d
printf "Mounting to sources.list.d folder...${NC}\n"
sleep 1
mv -f *.list /data/data/com.termux/files/usr/etc/apt/sources.list.d
printf "${GREEN}Sources.list.d files moved${NC}\n"
sleep 1
cd ../trusted.gpg.d
printf "Mounting to trusted.gpg.d folder...${NC}\n"
sleep 1
mv -f *.gpg /data/data/com.termux/files/usr/etc/apt/trusted.gpg.d
printf "${GREEN}Trusted.gpg.d files moved${NC}\n"
sleep 1

# Print completion message
printf "\n${GREEN}All files moved successfully.${NC}\n"

# Ask user if they want to update packages
read -p "$(echo -e ${CYAN}Do you want to update packages automatically?${NC} [Y/n] )" answer

if [ "$answer" != "${answer#[Yy]}" ]; then
    printf "\n${YELLOW}Updating packages...${NC}\n"
    apt-get update && apt upgrade
    pkg update && pkg upgrade
    printf "\n${GREEN}Package installation complete. Enjoy!${NC}\n"
else
    printf "\n${GREEN}Skipping package updates for now.${NC}\n"
fi

sleep 5

clear

printf "\n${RED}Show your support by liking, sharing, commenting, and subscribing for more updates!${NC}😉\n"

sleep 5

xdg-open https://youtu.be/0E5W5woGDg4?si=Y123pn1rGM1jWCp5

clear

cd

rm /data/data/com.termux/files/home/storage/downloads/TermuxRoot-Script.zip
rm -rf /data/data/com.termux/files/home/TermuxRoot-Script
