FROM ubuntu:20.04

RUN apt update && DEBIAN_FRONTEND="noninteractive" TZ="America/Sao_Paulo" apt -y install tzdata
RUN apt update && apt upgrade -y && apt autoremove -y && apt autoclean -y

RUN apt install -y python3.9 python3-pip python3-dev
RUN python3.9 -m pip install -U pip && python3.9 -m pip install -U setuptools && \
    python3.9 -m pip install -U wheel && python3.9 -m pip install --upgrade requests

RUN apt update && apt upgrade -y && apt autoremove -y && apt autoclean -y

COPY random_information/requirements.txt /var/www/docs/install/requirements.txt
RUN python3.9 -m pip install -r /var/www/docs/install/requirements.txt

WORKDIR /var/www

EXPOSE 8000
