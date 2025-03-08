FROM node:18

# 安装基本工具
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install git curl wget nano sudo postgresql-client redis-tools \
    # MongoDB官方仓库设置
    && wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add - \
    && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/debian $(. /etc/os-release && echo "$VERSION_CODENAME")/mongodb-org/6.0 main" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list \
    && apt-get update \
    && apt-get install -y mongodb-org-shell mongodb-mongosh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /workspace

# 安装全局 npm 包
RUN npm install -g @nestjs/cli typescript ts-node nodemon npm-check-updates

# 确保默认用户有合适的权限
RUN USER=node && \
    GROUP=node && \
    usermod -aG sudo $USER && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER && \
    chmod 0440 /etc/sudoers.d/$USER && \
    mkdir -p /home/$USER/.vscode-server/extensions /home/$USER/.vscode-server-insiders/extensions && \
    chown -R $USER:$GROUP /home/$USER && \
    chown -R $USER:$GROUP /workspace

# 设置默认用户
USER node
