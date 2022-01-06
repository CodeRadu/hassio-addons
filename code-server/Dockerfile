FROM ubuntu

RUN apt update
RUN apt upgrade -y
RUN apt install curl -y

RUN curl -fsSL https://code-server.dev/install.sh | sh

COPY code-server.yaml /root/.config/code-server/config.yaml

CMD [ "code-server" ]