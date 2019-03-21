import sys
import requests

response = requests.get('http://127.0.0.1')
if response.text == 'yes':
    sys.exit(0)
sys.exit(1)

