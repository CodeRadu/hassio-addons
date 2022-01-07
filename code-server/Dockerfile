FROM ubuntu

RUN apt update
RUN apt upgrade -y
RUN apt install curl nano git zsh -y

RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY run.sh /
COPY code-server.yaml /
COPY .zshrc /root
RUN chmod +x /run.sh

CMD [ "/run.sh" ]