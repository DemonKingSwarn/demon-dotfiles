#!/bin/sh
[ -z "$1" ] && file_name=$(date "+%Y_%m_%d") || file_name=$1

year=$(echo $file_name | awk -F _ '{print $1}')
month=$(echo $file_name | awk -F _ '{print $2}')
day=$(echo $file_name | awk -F _ '{print $3}')

rootdir="$HOME/Files/Org/secret_notes"
notedir="$rootdir/$year/$month"

[ -d "$notedir" ] || mkdir "$notedir"

nano "$notedir/$file_name.org"
