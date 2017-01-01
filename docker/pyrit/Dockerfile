FROM nvidia/cuda

# Pyrit
RUN apt update
RUN apt install -y python-dev python-pip libpq-dev
RUN pip install psycopg2 scapy
RUN apt install -y libssl-dev zlib1g-dev libpcap0.8-dev
RUN mkdir ~/.pyrit
RUN echo "use_CUDA = true" > ~/.pyrit/config
ADD Pyrit /opt/Pyrit
WORKDIR /opt/Pyrit
RUN python setup.py build
RUN python setup.py install

WORKDIR /opt/Pyrit/modules/cpyrit_cuda
RUN python setup.py build
RUN python setup.py install
RUN pip install SQLAlchemy

WORKDIR /mnt
CMD /bin/bash