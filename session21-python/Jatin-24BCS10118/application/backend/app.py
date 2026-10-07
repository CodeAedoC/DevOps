import os
from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

ENVIRONMENT = os.getenv("ENVIRONMENT", "production")
APP_VERSION = os.getenv("APP_VERSION", "1.0.0")

@app.route("/healthz", methods=["GET"])
def health():
    return jsonify({"status": "healthy", "service": "backend-api"}), 200

@app.route("/ready", methods=["GET"])
def readiness():
    return jsonify({"status": "ready"}), 200

@app.route("/api/v1/info", methods=["GET"])
def info():
    return jsonify({
        "project": "DevOps Hero Capstone",
        "student": "Jatin",
        "enrollment": "24BCS10118",
        "environment": ENVIRONMENT,
        "version": APP_VERSION,
        "message": "Production microservice running in Kubernetes cluster!"
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
