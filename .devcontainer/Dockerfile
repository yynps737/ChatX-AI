FROM ubuntu:22.04

# 避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 安装Node.js和基本工具
RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    nano \
    sudo \
    postgresql-client \
    redis-tools \
    gnupg \
    ca-certificates \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    # 安装MongoDB工具
    && wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/mongodb-6.gpg \
    && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list \
    && apt-get update \
    && apt-get install -y mongodb-org-tools mongodb-org-shell \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /workspace

# 安装全局 npm 包
RUN npm install -g @nestjs/cli typescript ts-node nodemon npm-check-updates

# 创建非root用户
RUN useradd -m -s /bin/bash -G sudo devuser \
    && echo "devuser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/devuser \
    && chmod 0440 /etc/sudoers.d/devuser \
    && mkdir -p /home/devuser/.vscode-server/extensions /home/devuser/.vscode-server-insiders/extensions \
    && chown -R devuser:devuser /home/devuser \
    && chown -R devuser:devuser /workspace

# 设置默认用户
USER devuser
