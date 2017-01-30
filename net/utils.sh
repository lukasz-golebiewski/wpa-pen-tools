#!/bin/bash

# port scanning
nmap -sS -O -p 0-10000 192.168.1.5
nmap -sS -O -p 0-10000 192.168.1.0/24

# packet inspection
tshark -f "tcp port 80" # -i eth0

thsark "src host 192.168.1.8"
