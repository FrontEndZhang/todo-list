# 多阶段构建

# 第一阶段，node环境, build
FROM node:lts-alpine3.19 AS builder

WORKDIR /todoList

COPY ./ /todoList/

RUN npm i

RUN npm run build-only

# 第二阶段, nginx环境，把打包的后的文件放在ngnix里面
FROM nginx:alpine3.18-otel

COPY --from=builder /todoList/dist/ /todoList/dist/
COPY --from=builder /todoList/deployment/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

