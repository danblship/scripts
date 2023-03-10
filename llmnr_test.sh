#!/bin/bash
echo '██╗░░░░░██╗░░░░░███╗░░░███╗███╗░░██╗██████╗░░█████╗░'
echo '██║░░░░░██║░░░░░████╗░████║████╗░██║██╔══██╗██╔══██╗'
echo '██║░░░░░██║░░░░░██╔████╔██║██╔██╗██║██████╔╝╚═╝███╔╝'
echo '██║░░░░░██║░░░░░██║╚██╔╝██║██║╚████║██╔══██╗░░░╚══╝░'
echo '███████╗███████╗██║░╚═╝░██║██║░╚███║██║░░██║░░░██╗░░'
echo '╚══════╝╚══════╝╚═╝░░░░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝░░░╚═╝░░'
echo ""
echo "Enter Attack interface name (i.e. ens1):"
read INTERFACE
echo ""
echo "Enter hostname to resolve:"
read HOSTNAME
echo ""
docker exec pentera_mitm_1 nmap  --script llmnr-resolve --script-args "llmnr-resolve.hostname=$HOSTNAME" -e $INTERFACE
