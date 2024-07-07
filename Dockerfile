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


# 暴露应用可能使用的端口（根据您的应用需要进行调整）
EXPOSE 9528

# 启动应用
CMD ["npm", "run dev"]