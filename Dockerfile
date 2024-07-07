# 使用Node.js 17作为构建阶段的基础镜像
FROM node:17 as build
LABEL authors="mohuani"


# 设置工作目录
WORKDIR /app

# 复制package.json和package-lock.json（如果存在）
COPY package*.json ./

# 安装项目依赖
RUN npm install

# 复制项目文件到工作目录
COPY . .

# 构建生产环境的静态文件
RUN npm run build:prod

# 设置环境变量（可选，根据您的需求调整）
ENV NODE_ENV production

# 指定构建输出目录
CMD ["echo", "Build completed. Use the 'dist' directory for deployment."]