# 使用docker打包镜像
docker build -t todo-list .

# 创建容器
docker run -d -p 8090:80 --name web-server todo-list
