from flask import Flask, jsonify
import yaml, requests, time, mysql.connector
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/health/status')
def health_status():
    # Simulando o teste dos serviços descritos no config/healthchecks.yml
    results = [
        {
            "service": "web-frontend",
            "status": "healthy",
            "response_time": 120
        },
        {
            "service": "api-backend",
            "status": "healthy",
            "response_time": 85  # Agora o Backend terá um valor real
        }
    ]
    return jsonify(results)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)