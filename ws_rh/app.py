from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config.from_object('config.Config')
db = SQLAlchemy(app)

from models import Employe

@app.route('/employe')
def index():
    employees = Employe.query.filter_by(date_depart=None).order_by(Employe.date_arrivee.desc()).all()
    return render_template('index.html', employees=employees)

if __name__ == '__main__':
    with app.app_context():
        db.create_all()  # Crée les tables si elles n'existent pas
    app.run(debug=True)
