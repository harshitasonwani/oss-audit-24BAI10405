#!/bin/bash
# =============================================================
# Script 1: System Identity Report
# Author: [Your Name] | Registration: 24BAI10405
# Course: Open Source Software | VIT
# Description: Displays a welcome screen with Linux system info
#              relevant to the Apache HTTP Server OSS audit.
# =============================================================

# --- Student & Project Variables ---
STUDENT_NAME="Harshita"          # Replace with your full name
REG_NUMBER="24BAI10405"
SOFTWARE_CHOICE="Apache HTTP Server"
SOFTWARE_LICENSE="Apache License 2.0"

# --- Gather System Information using command substitution ---
KERNEL=$(uname -r)                          # Linux kernel version
DISTRO=$(cat /etc/*release 2>/dev/null | grep -m1 "PRETTY_NAME" | cut -d= -f2 | tr -d '"')
# Fallback if PRETTY_NAME not found
[ -z "$DISTRO" ] && DISTRO=$(uname -o)

USER_NAME=$(whoami)                         # Current logged-in user
HOME_DIR=$HOME                              # Home directory of current user
UPTIME=$(uptime -p 2>/dev/null || uptime)  # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y')       # e.g. Monday, 01 January 2025
CURRENT_TIME=$(date '+%H:%M:%S')           # e.g. 14:30:00
HOSTNAME=$(hostname)                        # Machine hostname

# --- Check if Apache is installed (cross-distro) ---
# Ubuntu/Debian use 'apache2', CentOS/RHEL use 'httpd'
if command -v apache2 &>/dev/null; then
    APACHE_VERSION=$(apache2 -v 2>/dev/null | grep "Server version" | awk '{print $3}')
elif command -v httpd &>/dev/null; then
    APACHE_VERSION=$(httpd -v 2>/dev/null | grep "Server version" | awk '{print $3}')
else
    APACHE_VERSION="Not installed"
fi

# --- Display the Identity Report ---
echo "=============================================================="
echo "        OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT"
echo "=============================================================="
echo ""
echo "  Student   : $STUDENT_NAME"
echo "  Reg No    : $REG_NUMBER"
echo "  Software  : $SOFTWARE_CHOICE"
echo ""
echo "--------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "--------------------------------------------------------------"
echo "  Hostname        : $HOSTNAME"
echo "  Distribution    : $DISTRO"
echo "  Kernel Version  : $KERNEL"
echo "  Logged-in User  : $USER_NAME"
echo "  Home Directory  : $HOME_DIR"
echo "  System Uptime   : $UPTIME"
echo "  Date            : $CURRENT_DATE"
echo "  Time            : $CURRENT_TIME"
echo ""
echo "--------------------------------------------------------------"
echo "  OPEN SOURCE SOFTWARE DETAILS"
echo "--------------------------------------------------------------"
echo "  Software        : $SOFTWARE_CHOICE"
echo "  License         : $SOFTWARE_LICENSE"
echo "  Apache Version  : $APACHE_VERSION"
echo ""
echo "  License Note:"
echo "  The Apache License 2.0 is a permissive free software license."
echo "  It allows anyone to use, modify, and distribute the software"
echo "  for any purpose, including commercial use, without requiring"
echo "  derivative works to be open-sourced (unlike the GPL)."
echo ""
echo "=============================================================="
echo "  Learning Linux step by step is really helpful."
echo "=============================================================="
