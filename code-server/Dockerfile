FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive

LABEL org.opencontainers.image.source https://github.com/coderadu/hassio-addons

RUN apt update
RUN apt upgrade -y
RUN apt install curl nano git zsh openssh-server sudo jq -y

RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY run.sh /
COPY code-server.yaml /
COPY .zshrc /root
RUN chmod +x /run.sh

# Add user
RUN useradd user
RUN usermod -a -G sudo user
RUN usermod -a -G ssh user
RUN mkdir /var/run/sshd
RUN mkdir /home/user
RUN chown user /home/user
COPY .zshrc /home/user
RUN chsh user -s /usr/bin/zsh
RUN chmod a+rwx /root

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN su user -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh)"
RUN su user -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

EXPOSE 8080
EXPOSE 3000
EXPOSE 22

CMD [ "/run.sh" ]