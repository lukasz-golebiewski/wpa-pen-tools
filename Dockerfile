FROM kalilinux/kali-linux-docker

RUN apt update
RUN apt install -y aircrack-ng pciutils rfkill collectd-core
RUN apt install -y firmware-iwlwifi

CMD /bin/bash
