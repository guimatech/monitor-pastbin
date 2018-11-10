FROM kalilinux/kali-linux-docker:latest

WORKDIR /app

COPY . /app

RUN chmod +x /app/script.sh

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install curl

CMD ["/bin/bash"]