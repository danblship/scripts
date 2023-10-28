#!/bin/bash
echo '                                                 '
echo '    ____      _    __   ______            __     '
echo '   / __ \____| |  / /  /_  __/___  ____  / /____ '
echo '  / /_/ / __ \ | / /    / / / __ \/ __ \/ / ___/ '
echo ' / ____/ /_/ / |/ /    / / / /_/ / /_/ / (__  )  '
echo '/_/    \____/|___/    /_/  \____/\____/_/____/   '
echo '                                                 '
echo '                                                 '
echo ""
echo "1. Ping host over dan.exe tunnel"
echo "2. Nmap target ip/range"
echo "3. Nmap LLMNR request"
echo "4. Test SMB with Crackmapexec"
echo "5. Test user priviledges with Crackmapexec"
echo "6. Tail dan.exe logs"
echo "7. Tail olympus logs"
echo "8. Cat olympus logs and grep for string"

read MENUSELECTION

case "$MENUSELECTION" in
    1)
        echo""
        echo "enter target IP address:"
        read PINGIP
        ping -I vpn_1 $PINGIP
    ;;
    2)
        echo""
        echo "enter target IP address/block:"
        read NMAPIP
        sudo docker exec pentera_mitm_1 nmap -sS $NMAPIP
    ;;
    3)
        echo""
        echo "enter hostname to query:"
        read LLMNRHOST
        echo ""
        echo "availible interfaces:"
        ip -br l | awk '$1 !~ "lo|vir|wl" { print $1}' |  grep -v veth
        echo""
        echo "enter interface name:"
        read INTERFACE
        sudo docker exec pentera_mitm_1 nmap  --script llmnr-resolve --script-args "llmnr-resolve.hostname=$LLMNRHOST" -e $INTERFACE
    ;;
	4)
	    echo""
		echo "enter target IP address/block:"
		read SMBIP
		sudo docker exec pentera_cme_1 crackmapexec smb $SMBIP
	;;
    5)
        echo "enter username:"
        read USERNAME
        echo""
        echo "enter password:"
        read PASSWORD
        echo "enter target host IP"
        read CRACKMAPHOST
        sudo docker exec pentera_cme_1 crackmapexec smb $CRACKMAPHOST -u $USERNAME -p "$PASSWORD"
    ;;
    6)
        sudo tail -f /var/log/pentera/dan_exe.log.debug
    ;;
    7)
        sudo tail -f /var/log/pentera/olympus_python.log.debug
    ;;
    8)
        echo "string to grep for:"
        read STRING
        sudo cat /var/log/pentera/olympus_python.log.debug | grep --color -a -i $STRING
    ;;
esac
