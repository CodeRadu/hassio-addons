ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apt update
RUN apt upgrade -y
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
  apt install -y nodejs
RUN apt install openjdk-17-jre openssh-server git nano -y

WORKDIR /mcpanel

RUN git clone https://github.com/CodeRadu/mc-panel.git /mcpanel
RUN npm i

RUN adduser -q --no-create-home --disabled-password server

COPY rootfs /