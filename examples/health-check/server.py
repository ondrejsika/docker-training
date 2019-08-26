import time
from flask import Flask
app = Flask(__name__)

start = time.time()

@app.route("/")
def hello():
    if start + 10 > time.time():
        return 'yes'
    return 'no'

app.run('0.0.0.0', 80)

