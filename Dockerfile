FROM redis:6.0

ADD redis.conf /etc/redis.conf

CMD ["redis-server","/etc/redis.conf"]