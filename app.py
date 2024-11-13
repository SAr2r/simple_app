from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello, World!"

@app.route('/env')
def env():
    return f"Environment Variable: {os.getenv('MY_ENV_VAR', 'Not Set')}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
