import time
from redis import Redis

redis = Redis('redis', socket_connect_timeout=0.1)

for _ in range(20):
    try:
        print(redis.incr('counter'))
    except Exception as e:
        print(e)
    time.sleep(0.5)