#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' 

show_banner() {
    clear
    echo -e "${CYAN}"
    echo "   __  __ ___ ____  _____    _    ____ ___ ____ "
    echo "  |  \/  |_ _/ ___||  ___|  / \  |  _ \_ _|  _ \ "
    echo "  | |\/| || |\___ \| |_    / _ \ | | | | || | | |"
    echo "  | |  | || | ___) |  _|  / ___ \| |_| | || |_| |"
    echo "  |_|  |_|___|____/|_|   /_/   \_\____/___|____/ "
    echo -e "${NC}"
    echo -e "${YELLOW}>> MobSecKit - Security Toolkit${NC}"
    echo "---------------------------------------------"
}

# check target 
check_target() {
    echo -e "${BLUE}[*] Checking connectivity...${NC}"
    if ping -c 1 "$TARGET" &> /dev/null; then
        echo -e "${GREEN}[+] Target $TARGET is ONLINE!${NC}"
    else
        echo -e "${RED}[-] Target $TARGET is DOWN or Invalid.${NC}"
        exit 1
    fi
}

check_port() {
    local host=$1
    local port=$2
    
    (echo >/dev/tcp/$host/$port) >/dev/null 2>&1 && 
    echo -e "${GREEN}[+] Port $port is OPEN${NC}"
}

run_scan() {
    echo -e "${CYAN}[?] Enter Target IP or Domain (e.g. google.com):${NC} "
    read TARGET
    
    if [[ -z "$TARGET" ]]; then
        echo -e "${RED}Error: Target cannot be empty!${NC}"
        return
    fi

    echo ""
    check_target
    
    echo -e "${YELLOW}[*] Scanning common ports...${NC}"
    
    PORTS=(21 22 23 80 443 8080 3306)
    
    for port in "${PORTS[@]}"; do
        check_port "$TARGET" "$port"
    done
    
    echo ""
    echo -e "${GREEN}[+] Scan Completed.${NC}"
}

# main menu
while true; do
    show_banner
    echo -e "1. Run Network Scan"
    echo -e "2. Check Public IP"
    echo -e "3. Exit"
    echo "---------------------------------------------"
    echo -ne "${YELLOW}[MobSecKit] > ${NC}"
    read choice

    case $choice in
        1) run_scan ;;
        2) 
           PUBLIC_IP=$(curl -s ifconfig.me)
           echo -e "${GREEN}[+] Your IP: $PUBLIC_IP${NC}" 
           ;;
        3) echo -e "${RED}Exiting...${NC}"; exit ;;
        *) echo -e "${RED}Invalid Option${NC}" ;;
    esac
    echo -e "${YELLOW}Press Enter...${NC}"
    read
done