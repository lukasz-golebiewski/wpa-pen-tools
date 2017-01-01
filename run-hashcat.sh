#/bin/bash
docker build -t hashcat docker/hashcat
nvidia-docker run -P --rm -it -v `pwd`/mnt:/mnt --name wifi-hashcat hashcat bash
