from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
from config import Config 

app = Flask(__name__)
app.config.from_object(Config)
db = SQLAlchemy(app)

class Employee(db.Model):
    __tablename__ = 'EMPLOYE'
    code_employe = db.Column(db.Integer, primary_key=True)
    nom_employe = db.Column(db.String(50), nullable=False)
    prenom_employe = db.Column(db.String(50), nullable=False)
    age = db.Column(db.Integer, nullable=False)
    date_arrivee = db.Column(db.Date, nullable=False)
    date_depart = db.Column(db.Date)

@app.route('/')
def index():
    employees = Employee.query.filter_by(date_depart=None).order_by(Employee.date_arrivee.desc()).all()
    return render_template('index.html', employees=employees)

if __name__ == '__main__':
    app.run(debug=True)
