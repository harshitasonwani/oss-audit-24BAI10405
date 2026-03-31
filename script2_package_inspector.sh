#!/bin/bash

# this script checks installed packages and shows basic info

# checking which package manager is available
if command -v dpkg >/dev/null
then
    package_manager="dpkg"
elif command -v rpm >/dev/null
then
    package_manager="rpm"
else
    package_manager="unknown"
fi

# function to check package
check_package() {
    package_name=$1

    echo "-----------------------------"
    echo "Checking: $package_name"
    echo "-----------------------------"

    if [ "$package_manager" = "dpkg" ]
    then
        # for ubuntu/debian
        if dpkg -l | grep -q "$package_name"
        then
            echo "Status: Installed"
        else
            echo "Status: Not Installed"
        fi

    elif [ "$package_manager" = "rpm" ]
    then
        # for centos/rhel
        if rpm -q "$package_name" >/dev/null
        then
            echo "Status: Installed"
        else
            echo "Status: Not Installed"
        fi
    else
        echo "Package manager not found"
    fi
}

# simple explanation for each package
print_info() {
    package_name=$1

    echo "Info:"

    case $package_name in
        apache2)
            echo "Apache is an open source web server."
            ;;
        mysql)
            echo "MySQL is used to manage databases."
            ;;
        git)
            echo "Git is used for version control."
            ;;
        python3)
            echo "Python is a popular programming language."
            ;;
        *)
            echo "This is an open source tool."
            ;;
    esac

    echo ""
}

echo "===== Package Checker ====="
echo ""

# list of packages
packages=("apache2" "mysql" "git" "python3")

# loop through packages
for package_name in "${packages[@]}"
do
    check_package "$package_name"
    print_info "$package_name"
done

echo "----- Done checking -----"