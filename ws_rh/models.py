from app import db

class Employe(db.Model):
    __tablename__ = 'employe'
    code_employe = db.Column(db.Integer, primary_key=True)
    nom_employe = db.Column(db.String(50), nullable=False)
    prenom_employe = db.Column(db.String(50), nullable=False)
    age = db.Column(db.Integer)
    date_arrivee = db.Column(db.Date)
    date_depart = db.Column(db.Date)


