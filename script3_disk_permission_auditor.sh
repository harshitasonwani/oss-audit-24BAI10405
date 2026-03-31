#!/bin/bash

# I made this script to check directory permissions and size

# basic system directories
directories=("/etc" "/var/log" "/home" "/tmp")

# apache related folders
apache_dirs=("/etc/apache2" "/var/log/apache2" "/var/www/html")

# function to check directory
check_directory() {
    dir=$1

    echo "-----------------------------"
    echo "Checking directory: $dir"
    echo "-----------------------------"

    # check if directory exists
    if [ -d "$dir" ]
    then
        # show permissions
        echo "Permissions:"
        ls -ld "$dir"

        # show size
        echo "Size:"
        du -sh "$dir" 2>/dev/null
    else
        echo "Directory not found"
    fi

    echo ""
}

echo "Checking system directories"
echo ""

# loop for system directories
for dir in "${directories[@]}"
do
    check_directory "$dir"
done

echo "Checking apache related directories"
echo ""

# loop for apache directories
for dir in "${apache_dirs[@]}"
do
    check_directory "$dir"
done

echo "----- Directory check complete -----"