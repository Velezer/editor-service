FROM codercom/code-server:latest

USER root

RUN apt-get update && \
    apt-get install -y \
    git \
    curl \
    build-essential \
    bash \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

# Create stable workspace
RUN mkdir -p /home/coder/workspace && \
    chown -R coder:coder /home/coder

USER coder

WORKDIR /home/coder/workspace

EXPOSE 8080

CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]
