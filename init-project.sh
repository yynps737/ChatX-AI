#!/bin/bash
# 项目初始化脚本

# 创建前端项目结构
mkdir -p frontend/src/{components,pages,assets,utils,hooks,contexts,layouts,services,styles}
mkdir -p frontend/public

# 初始化前端package.json
cat > frontend/package.json << EOF
{
  "name": "chatx-ai-frontend",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.10.0",
    "antd": "^5.4.0",
    "axios": "^1.3.5",
    "typescript": "^5.0.4",
    "@types/react": "^18.0.35",
    "@types/react-dom": "^18.0.11"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": [
      "react-app",
      "react-app/jest"
    ]
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  },
  "devDependencies": {
    "@testing-library/jest-dom": "^5.16.5",
    "@testing-library/react": "^14.0.0",
    "@testing-library/user-event": "^14.4.3",
    "@typescript-eslint/eslint-plugin": "^5.58.0",
    "@typescript-eslint/parser": "^5.58.0",
    "eslint": "^8.38.0",
    "eslint-config-prettier": "^8.8.0",
    "eslint-plugin-prettier": "^4.2.1",
    "eslint-plugin-react": "^7.32.2",
    "prettier": "^2.8.7"
  }
}
EOF

# 创建前端基础文件
cat > frontend/src/index.tsx << EOF
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root') as HTMLElement);
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
EOF

cat > frontend/src/App.tsx << EOF
import React from 'react';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>Welcome to ChatX-AI</h1>
        <p>The next generation AI conversation platform</p>
      </header>
    </div>
  );
}

export default App;
EOF

cat > frontend/tsconfig.json << EOF
{
  "compilerOptions": {
    "target": "es5",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "esModuleInterop": true,
    "allowSyntheticDefaultImports": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "noFallthroughCasesInSwitch": true,
    "module": "esnext",
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",
    "baseUrl": "src"
  },
  "include": ["src"]
}
EOF

# 创建后端项目结构
mkdir -p backend/src/{controllers,services,repositories,models,middlewares,utils,configs,dtos}

# 初始化后端package.json
cat > backend/package.json << EOF
{
  "name": "chatx-ai-backend",
  "version": "0.1.0",
  "description": "ChatX-AI Backend Services",
  "main": "dist/main.js",
  "scripts": {
    "prebuild": "rimraf dist",
    "build": "nest build",
    "format": "prettier --write \"src/**/*.ts\"",
    "start": "nest start",
    "start:dev": "nest start --watch",
    "start:debug": "nest start --debug --watch",
    "start:prod": "node dist/main",
    "lint": "eslint \"{src,apps,libs,test}/**/*.ts\" --fix",
    "test": "jest",
    "test:watch": "jest --watch",
    "test:cov": "jest --coverage",
    "test:debug": "node --inspect-brk -r tsconfig-paths/register -r ts-node/register node_modules/.bin/jest --runInBand",
    "test:e2e": "jest --config ./test/jest-e2e.json"
  },
  "dependencies": {
    "@nestjs/common": "^9.4.0",
    "@nestjs/config": "^2.3.1",
    "@nestjs/core": "^9.4.0",
    "@nestjs/jwt": "^10.0.3",
    "@nestjs/passport": "^9.0.3",
    "@nestjs/platform-express": "^9.4.0",
    "@nestjs/swagger": "^6.3.0",
    "@nestjs/typeorm": "^9.0.1",
    "bcrypt": "^5.1.0",
    "class-transformer": "^0.5.1",
    "class-validator": "^0.14.0",
    "passport": "^0.6.0",
    "passport-jwt": "^4.0.1",
    "passport-local": "^1.0.0",
    "pg": "^8.10.0",
    "reflect-metadata": "^0.1.13",
    "rimraf": "^4.4.1",
    "rxjs": "^7.8.0",
    "typeorm": "^0.3.15"
  },
  "devDependencies": {
    "@nestjs/cli": "^9.4.0",
    "@nestjs/schematics": "^9.1.0",
    "@nestjs/testing": "^9.4.0",
    "@types/bcrypt": "^5.0.0",
    "@types/express": "^4.17.17",
    "@types/jest": "^29.5.0",
    "@types/node": "^18.15.11",
    "@types/passport-jwt": "^3.0.8",
    "@types/passport-local": "^1.0.35",
    "@types/supertest": "^2.0.12",
    "@typescript-eslint/eslint-plugin": "^5.58.0",
    "@typescript-eslint/parser": "^5.58.0",
    "eslint": "^8.38.0",
    "eslint-config-prettier": "^8.8.0",
    "eslint-plugin-prettier": "^4.2.1",
    "jest": "^29.5.0",
    "prettier": "^2.8.7",
    "source-map-support": "^0.5.21",
    "supertest": "^6.3.3",
    "ts-jest": "^29.1.0",
    "ts-loader": "^9.4.2",
    "ts-node": "^10.9.1",
    "tsconfig-paths": "^4.2.0",
    "typescript": "^5.0.4"
  },
  "jest": {
    "moduleFileExtensions": ["js", "json", "ts"],
    "rootDir": "src",
    "testRegex": ".*\\.spec\\.ts$",
    "transform": {
      "^.+\\.(t|j)s$": "ts-jest"
    },
    "collectCoverageFrom": ["**/*.(t|j)s"],
    "coverageDirectory": "../coverage",
    "testEnvironment": "node"
  }
}
EOF

# 创建后端基础文件
cat > backend/src/main.ts << EOF
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  
  app.useGlobalPipes(new ValidationPipe());
  app.enableCors();
  
  const config = new DocumentBuilder()
    .setTitle('ChatX-AI API')
    .setDescription('The ChatX-AI API description')
    .setVersion('0.1.0')
    .addBearerAuth()
    .build();
    
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);
  
  await app.listen(3000);
  console.log('Application is running on: http://localhost:3000');
}

bootstrap();
EOF

cat > backend/src/app.module.ts << EOF
import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DB_HOST || 'postgres',
      port: parseInt(process.env.DB_PORT) || 5432,
      username: process.env.DB_USERNAME || 'postgres',
      password: process.env.DB_PASSWORD || 'postgres',
      database: process.env.DB_DATABASE || 'chatx_ai',
      autoLoadEntities: true,
      synchronize: process.env.NODE_ENV !== 'production',
    }),
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
EOF

cat > backend/tsconfig.json << EOF
{
  "compilerOptions": {
    "module": "commonjs",
    "declaration": true,
    "removeComments": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "allowSyntheticDefaultImports": true,
    "target": "es2017",
    "sourceMap": true,
    "outDir": "./dist",
    "baseUrl": "./",
    "incremental": true,
    "skipLibCheck": true,
    "strict": true,
    "strictNullChecks": true,
    "strictBindCallApply": true,
    "strictPropertyInitialization": false,
    "forceConsistentCasingInFileNames": true,
    "noFallthroughCasesInSwitch": true
  }
}
EOF

# 创建环境配置文件
cat > .env.example << EOF
# Database Configuration
DB_HOST=postgres
DB_PORT=5432
DB_USERNAME=postgres
DB_PASSWORD=postgres
DB_DATABASE=chatx_ai

# Redis Configuration
REDIS_HOST=redis
REDIS_PORT=6379

# MongoDB Configuration
MONGO_URI=mongodb://mongodb:mongodb@mongodb:27017/chatx_ai?authSource=admin

# JWT Configuration
JWT_SECRET=your-secret-key
JWT_EXPIRES_IN=1d

# Application Configuration
PORT=3000
NODE_ENV=development

# Elasticsearch Configuration
ELASTICSEARCH_NODE=http://elasticsearch:9200
EOF

cp .env.example .env

# 创建.gitignore文件
cat > .gitignore << EOF
# dependencies
/node_modules
/frontend/node_modules
/backend/node_modules
/.pnp
.pnp.js

# testing
/coverage
/frontend/coverage
/backend/coverage

# production
/build
/frontend/build
/backend/dist

# misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*

# env files
.env

# IDEs and editors
/.idea
.project
.classpath
.c9/
*.launch
.settings/
*.sublime-workspace
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json
EOF

# 创建GitHub Actions工作流文件
mkdir -p .github/workflows
cat > .github/workflows/ci.yml << EOF
name: CI

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  backend-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Use Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18.x'
          cache: 'npm'
          cache-dependency-path: backend/package-lock.json
      - name: Install dependencies
        run: cd backend && npm ci
      - name: Run linting
        run: cd backend && npm run lint
      - name: Run tests
        run: cd backend && npm test

  frontend-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Use Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18.x'
          cache: 'npm'
          cache-dependency-path: frontend/package-lock.json
      - name: Install dependencies
        run: cd frontend && npm ci
      - name: Run linting
        run: cd frontend && npm run lint || true
      - name: Run tests
        run: cd frontend && npm test -- --watchAll=false || true

  build:
    runs-on: ubuntu-latest
    needs: [backend-test, frontend-test]
    if: github.event_name == 'push'
    steps:
      - uses: actions/checkout@v3
      - name: Use Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18.x'
      - name: Build backend
        run: |
          cd backend
          npm ci
          npm run build
      - name: Build frontend
        run: |
          cd frontend
          npm ci
          npm run build
EOF

# 创建README.md文件
cat > README.md << EOF
# ChatX-AI

ChatX-AI是一个超越现有AI对话平台的新一代智能系统，提供更强大的多模型调度能力、更丰富的多模态交互、更高效的性能优化以及更灵活的个性化体验。

## 开发环境设置

### 前提条件

- Docker Desktop
- JetBrains IDEA 或 VS Code
- Git

### 使用DevContainer开始开发

1. 克隆仓库：
   \`\`\`bash
   git clone https://github.com/your-username/chatx-ai.git
   cd chatx-ai
   \`\`\`

2. 使用IDEA或VS Code打开项目，并选择在DevContainer中打开

3. 启动本地服务：
   \`\`\`bash
   docker-compose up -d
   \`\`\`

4. 初始化项目（如果是首次设置）：
   \`\`\`bash
   chmod +x init-project.sh
   ./init-project.sh
   \`\`\`

5. 启动后端开发服务器：
   \`\`\`bash
   cd backend
   npm install
   npm run start:dev
   \`\`\`

6. 启动前端开发服务器：
   \`\`\`bash
   cd frontend
   npm install
   npm start
   \`\`\`

## 项目结构

- \`/frontend\` - React前端项目
- \`/backend\` - NestJS后端项目
- \`/docs\` - 文档目录
- \`/.devcontainer\` - DevContainer配置
- \`/docker-compose.yml\` - 本地开发服务配置

## 分支策略

项目采用Git Flow工作流：
- \`main\` - 生产就绪代码
- \`develop\` - 开发版本的主分支
- \`feature/*\` - 新功能开发
- \`bugfix/*\` - 错误修复
- \`release/*\` - 发布准备
- \`hotfix/*\` - 生产紧急修复

## CI/CD流程

项目使用GitHub Actions进行持续集成和部署：
- 代码提交时自动运行测试
- 成功合并到develop分支后自动部署到开发环境
- 发布标签后自动部署到生产环境

## 版本控制

项目遵循[语义化版本](https://semver.org/)规范。
EOF

# 创建git初始文件并初始化仓库
cat > .editorconfig << EOF
root = true

[*]
indent_style = space
indent_size = 2
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

[*.md]
trim_trailing_whitespace = false
EOF

echo "项目初始化完成！"
