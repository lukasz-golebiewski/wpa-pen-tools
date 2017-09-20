FROM nvidia/cuda

# Pyrit
RUN apt-get update
RUN apt-get install -y python-dev python-pip libpq-dev
RUN pip2 install psycopg2 scapy==2.3.2
RUN apt-get install -y libssl-dev zlib1g-dev libpcap0.8-dev
RUN mkdir ~/.pyrit
RUN echo "use_CUDA = true" > ~/.pyrit/config
ADD Pyrit /opt/Pyrit
WORKDIR /opt/Pyrit
RUN python setup.py build
RUN python setup.py install

WORKDIR /opt/Pyrit/modules/cpyrit_cuda
RUN python setup.py build
RUN python setup.py install
RUN pip2 install SQLAlchemy

WORKDIR /mnt
CMD /bin/bash
