import os
from flask import Flask, render_template

app = Flask("application", static_folder='static', template_folder="templates")

@app.route("/")
def myUdacity():
    return render_template("home.html", content="Say oh yeah!")

if __name__ == '__main__':
    app.run(
        host=os.getenv('FLASK_IP', '0.0.0.0'),
        port=os.getenv('FLASK_PORT', 5000),
        debug=bool(os.getenv('FLASK_DEBUG', True))
    )