FROM ubuntu:16.04

RUN apt-get update -y \
    && apt-get upgrade
RUN apt-get install git gcc python3 python3-dev linux-headers libffi-dev -y
RUN python3 -m ensurepip
RUN rm -r /usr/lib/python*/ensurepip
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
