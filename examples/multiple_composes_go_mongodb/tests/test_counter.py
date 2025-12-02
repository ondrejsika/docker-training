import unittest
import requests


class TestBackend(unittest.TestCase):
    def test_response_code(self):
        response = requests.get('http://backend:8000')
        self.assertEqual(200, response.status_code)

    def test_api_response_code(self):
        response = requests.get('http://backend:8000/api/counter')
        self.assertEqual(200, response.status_code)

    def test_readyz_response_code(self):
        response = requests.get('http://backend:8000/readyz')
        self.assertEqual(200, response.status_code)
        response = requests.get('http://backend:8000/api/readyz')
        self.assertEqual(200, response.status_code)

    def test_livez_response_code(self):
        response = requests.get('http://backend:8000/livez')
        self.assertEqual(200, response.status_code)
        response = requests.get('http://backend:8000/api/livez')
        self.assertEqual(200, response.status_code)

class TestFrontend(unittest.TestCase):
    def test_response_code(self):
        response = requests.get('http://frontend:3000')
        self.assertEqual(200, response.status_code)

    def test_livez_response_code(self):
        response = requests.get('http://frontend:3000/api/livez')
        self.assertEqual(200, response.status_code)
