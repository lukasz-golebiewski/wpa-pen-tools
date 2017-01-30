FROM kalilinux/kali-linux-docker

RUN apt update
RUN apt install -y aircrack-ng pciutils rfkill collectd-core
RUN apt install -y firmware-iwlwifi
RUN apt update
RUN apt install -y man nmap
RUN apt install -y tshark

WORKDIR /mnt
CMD /bin/bash
