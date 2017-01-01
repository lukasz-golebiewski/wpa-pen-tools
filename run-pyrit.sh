#/bin/bash
docker build -t pyrit .
docker run -P --rm -it -v `pwd`/mnt:/mnt --name wifi-pyrit pyrit bash
