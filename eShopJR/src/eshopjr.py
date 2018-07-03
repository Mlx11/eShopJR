# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

from flask import Flask, session
from flask.ext.mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'mydb'
app.config['MYSQL_HOST'] = 'localhost'
mysql = MySQL(app)



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


@app.route('/loginin/', methods=['GET', 'POST'])
def logingin():
    if request.method == 'POST':
        cursor = mysql.connection.cursor()
        sql = '''SELECT password FROM mydb.kunde WHERE; 
                 WHERE username = "''' \
                 + request.form['username'] + '"'
        cursor.execute(sql)
        result = cursor.fetchone()
        password = result[0]
        if password == request.form['password']:
            print("loggin correct")
        else:
            print("nope")
            
            
def buy(itemID):
    pass


if __name__ == "__main__":
    buy(1)
    app.run(debug=True)
