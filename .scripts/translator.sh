#!/bin/sh
source_string=$(cat ~/.scripts/data/translator/languages.txt | dmenu -i -p 'Translate from:')
[ -z "$source_string" ] && exit

target_string=$(cat ~/.scripts/data/translator/languages.txt | dmenu -i -p 'Translate to:')
[ -z "$target_string" ] && exit

query=$(dmenu -p "Translate text:") 
[ -z "$query" ] && exit
[ "$query" == "cc" ] && query=$(xclip -selection c -o)

source_lang=$(jq ".$source_string" ~/.scripts/data/translator/languages.json)
target_lang=$(jq ".$target_string" ~/.scripts/data/translator/languages.json)

curl -X POST -F "source=$source_lang" -F "q=$query" -F "target=$target_lang" https://translate.astian.org/translate | jq .translatedText | sed "s/\"//g" | xclip -selection clipboard
