FROM ubuntu:16.04

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  apt-get install -y ffmpeg && \
  apt-get install -y python-pip python-dev && \
  pip install --upgrade pip && \
  rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip setuptools
RUN ln -sf /usr/bin/python3 /usr/bin/python
RUN rm -r /root/.cache
RUN git clone https://github.com/dend/foggycam
RUN cd /foggycam/src/ \
    && pip install -r requirements.txt
RUN mkdir /config
RUN touch /config/config.json
RUN ln -s /config/config.json /foggycam/config.json

CMD python3 /foggycam/src/start.py
