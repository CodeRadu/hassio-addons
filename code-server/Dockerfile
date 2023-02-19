ARG BUILD_FROM
FROM ${BUILD_FROM}
ARG DEBIAN_FRONTEND=noninteractive

LABEL org.opencontainers.image.source https://github.com/coderadu/hassio-addons

RUN apt update
RUN apt upgrade -y
RUN apt install curl nano git zsh jq vim xz-utils -y

RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY code-server.yaml /
COPY .zshrc /root

RUN chmod a+rw /root

COPY ./rootfs/bin /bin
COPY ./rootfs/etc /etc

EXPOSE 8080
EXPOSE 3000