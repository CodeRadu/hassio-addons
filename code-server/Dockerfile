FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive

LABEL org.opencontainers.image.source https://github.com/coderadu/hassio-addons

RUN apt update
RUN apt upgrade -y
RUN apt install curl nano git zsh jq -y

RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY run.sh /
COPY code-server.yaml /
COPY .zshrc /root
RUN chmod +x /run.sh

RUN chmod a+rwx /root

COPY rootfs /

EXPOSE 8080
EXPOSE 3000

CMD [ "/run.sh" ]