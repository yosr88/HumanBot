from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
from config import Config
from sqlalchemy import text

app = Flask(__name__)
app.config.from_object(Config)
db = SQLAlchemy(app)

class Delivery(db.Model):
    __tablename__ = 'LIVRAISON'
    code_livraison = db.Column(db.Integer, primary_key=True)
    date_livraison = db.Column(db.Date, nullable=False)
    quantite = db.Column(db.Integer, nullable=False)
    code_usine = db.Column(db.Integer, nullable=False)

@app.route('/')
def index():
    deliveries = db.session.execute(
        text("SELECT * FROM LIVRAISON WHERE date_livraison >= CURRENT_DATE - INTERVAL '10 days'")
    ).fetchall()
    return render_template('index.html', deliveries=deliveries)

if __name__ == '__main__':
    app.run(debug=True)
