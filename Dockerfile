FROM kalilinux/kali-linux-docker

RUN apt update
RUN apt install -y aircrack-ng pciutils rfkill collectd-core
RUN apt install -y firmware-iwlwifi

# Pyrit
RUN apt install -y python-pip libpq-dev
RUN pip install psycopg2 scapy
RUN apt install -y libssl-dev zlib1g-dev libpcap0.8-dev
ADD Pyrit /opt/Pyrit
WORKDIR /opt/Pyrit
RUN python setup.py build
RUN python setup.py install
RUN pip install SQLAlchemy

WORKDIR /mnt
CMD /bin/bash
