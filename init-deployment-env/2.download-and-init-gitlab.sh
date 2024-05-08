mkdir -p ~/data/gitlab/config ~/data/gitlab/logs ~/data/gitlab/data

docker pull gitlab/gitlab-ce

docker run -d -p 443:443 -p 80:80 -p 222:22 --name gitlab --restart always -v \
    ~/data/gitlab/config:/etc/gitlab -v \
    ~/data/gitlab/logs:/var/log/gitlab -v \
    ~/data/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce