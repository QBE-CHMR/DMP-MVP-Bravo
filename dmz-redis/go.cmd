docker build --progress=plain --no-cache -t dmz-redis-1 .
docker run --rm --name dmz-redis-1 -p 6379:6379 dmz-redis-1