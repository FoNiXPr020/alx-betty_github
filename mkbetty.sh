#!/bin/bash
# FoNiX - ALX Advanced Betty : https://github.com/FoNiXPr020/alx-betty_github
# Create a default main with clean betty style to your destination directory .

if [ "$0" = "mkbetty" ]; then
  shift
fi

if [ $# -lt 1 ]; then
  echo "Usage: mkbetty <filename>"
  exit 1
fi

file_name="$1"

if ! [[ "$file_name" == *.c ]]; then
  file_name="${file_name}.c"
fi

destination_dir="$HOME/Github"
destination_file="$HOME/Github/template.c"

if [ ! -d "$destination_dir" ]; then
	echo -e "Sorry template not found.."
	exit 1
fi

cp "$destination_file" "$file_name"

echo "Choose an editor to open the file:"
echo "1. vi"
echo "2. vim"
echo ""
echo "0. exit"

read -p "Enter your choice (0|1|2): " choice

case "$choice" in
  1)
    vi "$file_name"
    ;;
  2)
    vim "$file_name"
    ;;
  0)
    echo "Exiting..."
    exit 0
    ;;
  *)
    echo "Invalid. Opening with default editor (vi)..."
    vi "$file_name"
    ;;
esac