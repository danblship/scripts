#!/usr/bin/env bash
echo '██╗░░░░░██╗░░░░░███╗░░░███╗███╗░░██╗██████╗░░█████╗░'
echo '██║░░░░░██║░░░░░████╗░████║████╗░██║██╔══██╗██╔══██╗'
echo '██║░░░░░██║░░░░░██╔████╔██║██╔██╗██║██████╔╝╚═╝███╔╝'
echo '██║░░░░░██║░░░░░██║╚██╔╝██║██║╚████║██╔══██╗░░░╚══╝░'
echo '███████╗███████╗██║░╚═╝░██║██║░╚███║██║░░██║░░░██╗░░'
echo '╚══════╝╚══════╝╚═╝░░░░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝░░░╚═╝░░'
echo ""
read -e -p "Enter Attack interface name (i.e. enp0s1): " INTERFACE
echo ""
read -e -p "Enter hostname to resolve: " HOSTNAME
echo ""
docker exec pentera_mitm_1 nmap  --script llmnr-resolve --script-args "llmnr-resolve.hostname=$HOSTNAME" -e $INTERFACE