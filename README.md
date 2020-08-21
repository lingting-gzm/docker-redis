### 集群示例
#### docker-compose.yml
```yaml
version: '3'

services:
  rc1:
    tty: true
    image: reids:t
    hostname: rc1
    container_name: rc1
    networks:
      rc:
        ipv4_address: 202.21.0.101
    environment:
      TZ: Asia/Shanghai
    volumes:
      - /etc/localtime:/etc/localtime
    ports:
      - 29001:6379
  rc2:
    tty: true
    image: reids:t
    hostname: rc2
    container_name: rc2
    networks:
      rc:
        ipv4_address: 202.21.0.102
    environment:
      TZ: Asia/Shanghai
    volumes:
      - /etc/localtime:/etc/localtime
    ports:
      - 29002:6379
  rc3:
    tty: true
    image: reids:t
    hostname: rc3
    container_name: rc3
    networks:
      rc:
        ipv4_address: 202.21.0.103
    environment:
      TZ: Asia/Shanghai
    volumes:
      - /etc/localtime:/etc/localtime
    ports:
      - 29003:6379

networks:
  rc:
    ipam:
      config:
        - subnet: 202.21.0.0/16
```
#### 启动成功后进入任意容器执行命令
```shell
redis-cli --cluster create  202.21.0.101:6379 202.21.0.102:6379 202.21.0.103:6379 --cluster-replicas 0
```