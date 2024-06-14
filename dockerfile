# 设置 Node.js 版本
ARG NODE_VERSION=18.18.0

# 基础镜像
FROM node:${NODE_VERSION}-alpine as base
EXPOSE 3000
ENV PROJECT_ENV production
WORKDIR /usr/app/src

# 生产环境镜像
FROM base as prod
ADD . /usr/app/src
RUN npm install && npm run build && npm install -g http-server
CMD ["http-server", "./public", "-p", "3000"]

# 开发环境镜像
FROM base as dev
ADD . /usr/app/src
RUN npm install
CMD ["npm", "run", "dev"]
