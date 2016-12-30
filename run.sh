#/bin/bash
docker build -t kali .
docker run -P -it --net="host" --privileged -v `pwd`/home:/home --name wifi-kali kali bash
