# My Blog
http://blog.auska.win

## Usage

```
docker create --name=cloud-torrent \
-v <path to downloads>:/mnt \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 3099:3099 \
auska/cloud-torrent
```

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Versions

+ **0.8.25:** Rebase to alpine linux 3.8.