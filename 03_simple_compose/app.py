import os
from flask import Flask
from redis import Redis

app = Flask(__name__)
redis = Redis('redis')
hostname = os.environ['HOSTNAME']

@app.route('/')
def index():
    counter = redis.incr('counter')
    return '%s %d\n' % (hostname, counter)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port='80')
