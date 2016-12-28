#/bin/bash
docker build -t kali .
docker run -it --net="host" --privileged --name wifi-kali kali bash
