# 我的博客
http://blog.auska.win

## 创建镜像

```
docker create --name=cloud-torrent \
-v <path to downloads>:/downloads \
-v <path to config>:/config \
-v <path to watch>:/watch \
-e PGID=<gid> -e PUID=<uid> \
-e PORT=<3099> -e AUTH=<admin:admin> \
-e TZ=<timezone> \
-p 3099:3099 \
auska/docker-cloud-torrent
```

## 参数解释

* `-v /config` - 配置文件目录
* `-v /downloads` - 下载文件目录
* `-v /watch` - 监视种子目录
* `-e PGID` 用户的GroupID，留空为root
* `-e PUID` 用户的UserID，留空为root
* `-e PORT` 网页UI端口
* `-e AUTH` 登录账户密码
* `-e TZ` 时区 默认 Asia/Shanghai

## 版本介绍

latest ： 最新镜像。