FROM debian:buster

RUN apt-get update && apt-get install -y redis-server && apt-get install -y php-redis

# Changing the bind address from 127.0.0.1 to 0.0.0.0. This is necessary because the container will be running in a different network than the host and 0.0.0.0 allow any network in the host.
RUN sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf

# This is setting the max memory to 256mb and the max memory policy to allkeys-lfu.
RUN echo "maxmemory 256mb">> /etc/redis/redis.conf && echo "maxmemory-policy allkeys-lfu" >> /etc/redis/redis.conf

# The command to start the redis server, and protected mode (no) Allowing the redis server to be accessed from any network.
CMD ["redis-server", "--protected-mode", "no"]