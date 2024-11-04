FROM alpine:3.20 AS builder

COPY rootfs/ /

# install make and GCC
RUN apk update
RUN apk add build-base

# extract and build Redis
COPY redis-stable.tar.gz /
RUN tar -xvf redis-stable.tar.gz
RUN cd /redis-stable && \
    ls -l && \
    make CFLAGS="-static" EXEEXT="-static" LDFLAGS="-static -I/usr/local/include/"

FROM scratch

COPY --from=builder /redis-stable/redis.conf /etc/redis/redis.conf
COPY --from=builder /redis-stable/src/redis-server /bin/redis-server

EXPOSE 6379

ENTRYPOINT ["/bin/redis-server"]