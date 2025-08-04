from flask import Flask, render_template, request, redirect
from app.db import get_connection, init_db

app = Flask(__name__)
init_db()

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        nome = request.form["nome"]
        tipo = request.form["tipo"]
        nivel = request.form["nivel"]

        conn = get_connection()
        cur = conn.cursor()
        cur.execute("INSERT INTO pokemon (nome, tipo, nivel) VALUES (%s, %s, %s);", (nome, tipo, nivel))
        conn.commit()
        cur.close()
        conn.close()

        return redirect("/pokemons")

    return render_template("index.html")

@app.route("/pokemon")
def listar():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT nome, tipo, nivel FROM pokemon;")
    pokemons = cur.fetchall()
    cur.close()
    conn.close()

    return render_template("pokemons.html", pokemons=pokemons)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
