# ChatX-AI

ChatX-AI是一个超越现有AI对话平台的新一代智能系统，提供更强大的多模型调度能力、更丰富的多模态交互、更高效的性能优化以及更灵活的个性化体验。

## 开发环境设置

### 前提条件

- Docker Desktop
- JetBrains IDEA 或 VS Code
- Git

### 使用DevContainer开始开发

1. 克隆仓库：
   ```bash
   git clone https://github.com/your-username/chatx-ai.git
   cd chatx-ai
   ```

2. 使用IDEA或VS Code打开项目，并选择在DevContainer中打开

3. 启动本地服务：
   ```bash
   docker-compose up -d
   ```

4. 初始化项目（如果是首次设置）：
   ```bash
   chmod +x init-project.sh
   ./init-project.sh
   ```

5. 启动后端开发服务器：
   ```bash
   cd backend
   npm install
   npm run start:dev
   ```

6. 启动前端开发服务器：
   ```bash
   cd frontend
   npm install
   npm start
   ```

## 项目结构

- `/frontend` - React前端项目
- `/backend` - NestJS后端项目
- `/docs` - 文档目录
- `/.devcontainer` - DevContainer配置
- `/docker-compose.yml` - 本地开发服务配置

## 分支策略

项目采用Git Flow工作流：
- `main` - 生产就绪代码
- `develop` - 开发版本的主分支
- `feature/*` - 新功能开发
- `bugfix/*` - 错误修复
- `release/*` - 发布准备
- `hotfix/*` - 生产紧急修复

## CI/CD流程

项目使用GitHub Actions进行持续集成和部署：
- 代码提交时自动运行测试
- 成功合并到develop分支后自动部署到开发环境
- 发布标签后自动部署到生产环境

## 版本控制

项目遵循[语义化版本](https://semver.org/)规范。
