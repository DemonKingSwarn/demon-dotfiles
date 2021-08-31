#!/bin/sh
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'
while IFS= read -r i; do

        printf "${YELLOW}Processing repo: $i ${NC}\n"

        cd "$i/.."
        git add .
        git commit -m "autocommit"
        git push

        printf "${BLUE}Processed repo: $i ${NC}\n"

done <$HOME/dotfiles/.scripts/autocommit.sh
