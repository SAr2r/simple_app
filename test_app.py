import unittest
from app import app

class AppTestCase(unittest.TestCase):
    def setUp(self):
        self.client = app.test_client()

    def test_hello(self):
        response = self.client.get('/')
        self.assertEqual(response.data.decode(), "Hello, World!")
        self.assertEqual(response.status_code, 200)

    def test_env(self):
        response = self.client.get('/env')
        self.assertIn("Environment Variable:", response.data.decode())
        self.assertEqual(response.status_code, 200)

if __name__ == '__main__':
    unittest.main()
