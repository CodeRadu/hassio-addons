FROM ubuntu

RUN apt update
RUN apt upgrade -y
RUN apt install curl -y

RUN curl -fsSL https://code-server.dev/install.sh | sh

COPY run.sh /
COPY code-server.yaml /
RUN chmod +x /run.sh

CMD [ "/run.sh" ]