FROM node:18

# 避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 安装基本工具和依赖
RUN apt-get update && \
    apt-get install -y curl wget gnupg git nano sudo postgresql-client redis-tools \
    # 添加MongoDB仓库密钥和源
    && wget -qO - https://pgp.mongodb.com/server-6.0.asc | apt-key add - \
    && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/debian bullseye/mongodb-org/6.0 main" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list \
    && apt-get update \
    && apt-get install -y mongodb-org-shell mongodb-mongosh \
    # 清理
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
