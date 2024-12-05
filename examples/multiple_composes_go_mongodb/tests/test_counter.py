import unittest
import requests


class TestBackend(unittest.TestCase):
    def test_response_code(self):
        response = requests.get('http://backend')
        self.assertEqual(200, response.status_code)

    def test_api_response_code(self):
        response = requests.get('http://backend')
        self.assertEqual(200, response.status_code)

class TestFrontend(unittest.TestCase):
    def test_response_code(self):
        response = requests.get('http://frontend:3000')
        self.assertEqual(200, response.status_code)
