from flask import Flask, request, jsonify
import mysql.connector
import os

app = Flask(__name__)

db = mysql.connector.connect(
    host=os.environ.get("DB_HOST"),
    user=os.environ.get("DB_USER"),
    password=os.environ.get("DB_PASSWORD"),
    database=os.environ.get("DB_NAME")
)

@app.route("/health")
def health():
    return {"status": "ok"}

@app.route("/api/posts", methods=["GET"])
def get_posts():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM posts")
    return jsonify(cursor.fetchall())

@app.route("/api/posts/<int:id>", methods=["GET"])
def get_post(id):
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM posts WHERE id=%s", (id,))
    return jsonify(cursor.fetchone())

@app.route("/api/posts", methods=["POST"])
def create_post():
    data = request.json
    cursor = db.cursor()
    cursor.execute(
        "INSERT INTO posts (title, content) VALUES (%s,%s)",
        (data["title"], data["content"])
    )
    db.commit()
    return {"message": "Post criado"}

@app.route("/api/posts/<int:id>", methods=["DELETE"])
def delete_post(id):
    cursor = db.cursor()
    cursor.execute("DELETE FROM posts WHERE id=%s", (id,))
    db.commit()
    return {"message": "Post deletado"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)