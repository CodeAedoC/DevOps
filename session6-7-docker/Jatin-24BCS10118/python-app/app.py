from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return """
    <!DOCTYPE html>
    <html>
      <head><title>Python Flask Docker Demo</title></head>
      <body style="font-family: Arial, sans-serif; background: #1e1e2f; color: #ffffff; text-align: center; padding: 50px;">
        <h1 style="color: #4ade80;">Hello World from Python Flask Docker App!</h1>
        <p>Student: Jatin (24BCS10118)</p>
        <p>Framework: Flask on Python 3.11</p>
      </body>
    </html>
    """

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
