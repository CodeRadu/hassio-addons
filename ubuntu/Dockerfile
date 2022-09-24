ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apt update
RUN apt upgrade -y
RUN apt install wget curl jq -y

EXPOSE 3000

COPY rootfs /

RUN chmod -R a+x /etc/cont-init.d