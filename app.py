from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text

app = Flask(__name__)
app.config.from_object('config.Config')
db = SQLAlchemy(app)

@app.route('/stock')
def stock():
    query = text("""
    SELECT code_usine, SUM(quantite) AS total_pieces
    FROM LIVRAISON
    GROUP BY code_usine
    """)
    result = db.session.execute(query).fetchall()
    return render_template('stock.html', stock=result)

if __name__ == '__main__':
    app.run(debug=True)
