# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

from flask import Flask, session, render_template, request, url_for
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'mydb'
app.config['MYSQL_HOST'] = 'localhost'
mysql = MySQL(app)



@app.route("/shop")
def shopb():
    return "Template default"

@app.route("/shop/category/<category>")
def shopc():
    return "Template für Kategorie z.B. CDs"

@app.route("/shop/item/<id>")
def shopi():
    return "Template für einzelnen Artikel"

@app.route("/shop/warenkorb/")
def shopw():
    return "Template für Wahrenkorb"

@app.route("/shop/login/")
def shop():
    return render_template('login.html')

@app.route('/loggedIn', methods=['GET', 'POST'])
def logingin():
    if request.method == 'POST':
        cursor = mysql.connection.cursor()
        sql = '''SELECT password FROM mydb.kunde WHERE username = "''' \
                 + request.form['username'] + '"'
        cursor.execute(sql)
        result = cursor.fetchone()
        password = result[0]
        if password == request.form['password']:
            print("loggin correct")
            return render_template('S1.html')
        else:
            print("nope")
            return render_template('login.html')
            
            
def buy(itemID):
    pass


if __name__ == "__main__":
    app.run(debug=True)
