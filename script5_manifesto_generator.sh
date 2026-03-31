#!/bin/bash

# I made this script to take user input and create a simple manifesto file

# output file name
file_name="my_manifesto.txt"

echo "Open Source Manifesto Generator"
echo ""

# taking input from user
read -p "Enter a tool you use: " tool
read -p "What does freedom mean to you? " freedom
read -p "What would you like to build? " idea

# if user leaves input empty, give default values
[ -z "$tool" ] && tool="Linux"
[ -z "$freedom" ] && freedom="sharing"
[ -z "$idea" ] && idea="a helpful tool"

# writing data into file
echo "----- My Open Source Manifesto -----" > "$file_name"
echo "User: $(whoami)" >> "$file_name"
echo "Date: $(date)" >> "$file_name"
echo "" >> "$file_name"

echo "I use $tool in my daily work." >> "$file_name"
echo "For me, freedom means $freedom." >> "$file_name"
echo "I would like to build $idea and share it with others." >> "$file_name"

echo ""
echo "File created: $file_name"
echo ""

# display file content
cat "$file_name"

echo ""
echo "----- Done -----"