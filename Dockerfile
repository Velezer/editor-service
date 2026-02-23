FROM codercom/code-server:latest

USER root

RUN apt-get update && \
    apt-get install -y git curl build-essential && \
    curl https://sh.rustup.rs -sSf | sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

USER coder

WORKDIR /home/coder/project

EXPOSE 8080

CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "password"]
