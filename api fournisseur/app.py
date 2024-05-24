from flask import Flask, jsonify, render_template
from flask_sqlalchemy import SQLAlchemy
import psycopg2
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)

# Configure the SQLAlchemy part of the app instance
app.config['SQLALCHEMY_DATABASE_URI'] = f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Create the SQLAlchemy db instance
db = SQLAlchemy(app)

# Define your models
class Employee(db.Model):
    __tablename__ = 'employe'
    code_employe = db.Column(db.Integer, primary_key=True)
    nom_employe = db.Column(db.String(50))
    prenom_employe = db.Column(db.String(50))
    age = db.Column(db.Integer)
    date_arrivee = db.Column(db.Date)
    date_depart = db.Column(db.Date)

@app.route('/api/employees', methods=['GET'])
def get_employees():
    employees = Employee.query.filter(Employee.date_depart.is_(None)).order_by(Employee.date_arrivee.desc()).all()
    result = [{'nom_employe': emp.nom_employe, 'prenom_employe': emp.prenom_employe, 'age': emp.age, 'date_arrivee': emp.date_arrivee} for emp in employees]
    return jsonify(result)

@app.route('/api/stock', methods=['GET'])
def get_stock():
    conn = psycopg2.connect(
        dbname=os.getenv('DB_NAME'),
        user=os.getenv('DB_USER'),
        password=os.getenv('DB_PASSWORD'),
        host=os.getenv('DB_HOST'),
        port=os.getenv('DB_PORT')
    )
    cur = conn.cursor()
    cur.execute('SELECT code_usine, SUM(quantite) FROM LIVRAISON GROUP BY code_usine')
    rows = cur.fetchall()
    cur.close()
    conn.close()
    stock = [{'code_usine': row[0], 'stock': row[1]} for row in rows]
    return jsonify(stock)

@app.route('/employees')
def employees():
    return render_template('employees.html')

@app.route('/stock')
def stock():
    return render_template('stock.html')

if __name__ == '__main__':
    app.run(debug=True)
