# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

from flask import Flask, session

app = Flask(__name__)

@app.route("/shop")
def shop():
    return "Template default"

@app.route("/shop/category/<category>")
def shop():
    return "Template für Kategorie z.B. CDs"

@app.route("/shop/item/<id>")
def shop():
    return "Template für einzelnen Artikel"

@app.route("/shop/warenkorb/")
def shop():
    return "Template für Wahrenkorb"


def login():
    pass

def buy(itemID):
    pass


if __name__ == "__main__":
    app.run(debug=True)
