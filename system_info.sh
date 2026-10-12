#!/bin/bash

# ==========================================
# LINUX SYSTEM INFORMATION TOOL
# ==========================================

basic_info() {
    echo
    echo "========== BASIC SYSTEM INFORMATION =========="
    echo "Username         : $(whoami)"
    echo "Hostname         : $(hostname)"
    echo "Operating System : $(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2)"
    echo "Kernel Version   : $(uname -r)"
    echo "Architecture     : $(uname -m)"
    echo "System Uptime    : $(uptime -p)"
    echo "Current Date     : $(date)"
}

cpu_info() {
    echo
    echo "========== CPU INFORMATION =========="
    echo "CPU Model        : $(lscpu | grep 'Model name' | cut -d ':' -f2 | xargs)"
    echo "CPU Cores        : $(nproc)"
}

memory_info() {
    echo
    echo "========== MEMORY INFORMATION =========="
    free -h
}

disk_info() {
    echo
    echo "========== DISK INFORMATION =========="
    df -h /
}

network_info() {
    echo
    echo "========== NETWORK INFORMATION =========="
    echo "IP Address       : $(hostname -I | awk '{print $1}')"
    echo
    ip -br addr
}

all_info() {
    basic_info
    cpu_info
    memory_info
    disk_info
    network_info
}

while true
do
    clear

    echo "=========================================="
    echo "      LINUX SYSTEM INFORMATION TOOL"
    echo "=========================================="
    echo
    echo "1. Basic System Information"
    echo "2. CPU Information"
    echo "3. Memory Information"
    echo "4. Disk Information"
    echo "5. Network Information"
    echo "6. Show All Information"
    echo "7. Exit"
    echo
    read -p "Enter your choice: " choice

    case $choice in
        1)
            basic_info
            ;;
        2)
            cpu_info
            ;;
        3)
            memory_info
            ;;
        4)
            disk_info
            ;;
        5)
            network_info
            ;;
        6)
            all_info
            ;;
        7)
            echo
            echo "Thank you for using System Information Tool."
            exit 0
            ;;
        *)
            echo
            echo "Invalid choice! Please choose 1-7."
            ;;
    esac

    echo
    read -p "Press Enter to continue..."
done
