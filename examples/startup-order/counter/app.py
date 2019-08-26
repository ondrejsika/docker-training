import sys
import time
from redis import Redis

redis = Redis('redis', socket_connect_timeout=0.1)

for _ in range(20):
    try:
        sys.stdout.write('%s\n' % redis.incr('counter'))
    except Exception as e:
        sys.stdout.write('%s\n' % e)
    sys.stdout.flush()
    time.sleep(0.5)