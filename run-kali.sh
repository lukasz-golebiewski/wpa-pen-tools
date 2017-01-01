#/bin/bash
docker build -t kali docker/kali
docker run -P --rm -it --net="host" --privileged -v `pwd`/mnt:/mnt --name wifi-kali kali bash
