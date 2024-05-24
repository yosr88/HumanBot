from app import db

class Delivery(db.Model):
    __tablename__ = 'LIVRAISON'
    code_livraison = db.Column(db.Integer, primary_key=True)
    date_livraison = db.Column(db.Date, nullable=False)
    quantite = db.Column(db.Integer, nullable=False)
    code_usine = db.Column(db.Integer, db.ForeignKey('USINE.code_usine'))
    code_employe = db.Column(db.Integer, db.ForeignKey('EMPLOYE.code_employe'))
    code_fournisseur = db.Column(db.Integer, db.ForeignKey('FOURNISSEUR.code_fournisseur'))
