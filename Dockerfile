FROM alpine:latest

RUN apk update && 
apk upgrade && 
apk add git --no-cache gcc python3 python3-dev linux-headers libffi-dev mus$ python3 -m ensurepip && 
rm -r /usr/lib/python*/ensurepip && 
pip3 install --upgrade pip setuptools && 
if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && 
if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python$ rm -r /root/.cache && 
git clone https://github.com/dend/foggycam && 
cd /foggycam/src/ && 
pip install -r requirements.txt && 
mkdir /config && 
touch /config/config.json && 
ln -s /config/config.json /foggycam/config.json

CMD python3 /foggycam/src/start.py
