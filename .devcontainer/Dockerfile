FROM node:18

# 安装基本工具
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install git curl wget nano sudo postgresql-client redis-tools mongodb-clients

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