#/bin/bash
docker build -t pyrit .
nvidia-docker run -P --rm -it -v `pwd`/mnt:/mnt --name wifi-pyrit pyrit bash
