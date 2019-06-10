FROM ubuntu:16.04

RUN apk update
RUN apk upgrade
RUN apk add git --no-cache gcc python3 python3-dev linux-headers libffi-dev mus$ python3 -m ensurepip
RUN rm -r /usr/lib/python*/ensurepip
RUN pip3 install --upgrade pip setuptools
    && if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi
    && [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python$ rm -r /root/.cache
RUN git clone https://github.com/dend/foggycam
RUN cd /foggycam/src/
    && pip install -r requirements.txt
    && mkdir /config
RUN touch /config/config.json
RUN ln -s /config/config.json /foggycam/config.json

CMD python3 /foggycam/src/start.py
