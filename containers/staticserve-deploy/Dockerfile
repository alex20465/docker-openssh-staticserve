FROM debian

RUN apt-get update -y

RUN apt-get install -y openssh-client

ENV SSH_PRIVATE_KEY=
ENV SSH_USERNAME=staticserve
ENV SSH_HOSTNAME=
ENV SSH_PORT=2222
ENV SOURCE_DIR=
ENV REMOTE_DIR=/pages

RUN mkdir -p ~/.ssh
RUN chmod 700 ~/.ssh

ADD ./app /app

WORKDIR /app

ENTRYPOINT [ "/app/entrypoint.sh" ]