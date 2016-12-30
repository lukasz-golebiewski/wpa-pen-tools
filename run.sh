#/bin/bash
docker build -t kali .
docker run -P -it --net="host" --privileged -v `pwd`/mnt:/mnt --name wifi-kali kali bash
