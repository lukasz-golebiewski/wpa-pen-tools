FROM nvidia/cuda

RUN apt update
RUN apt install -y p7zip-full

ADD https://hashcat.net/files/hashcat-3.20.7z /opt/hashcat.7z
RUN mkdir /opt/hashcat
RUN 7z x -o/opt /opt/hashcat.7z
RUN ln -s /opt/hashcat-3.20/hashcat64.bin /usr/bin/hashcat

WORKDIR /mnt
CMD /bin/bash
