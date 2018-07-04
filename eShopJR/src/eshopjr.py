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
    a = getArticles()
    return render_template("S1.html", articles=a)

@app.route("/shop/category/<category>")
def shopc():
    return "Template für Kategorie z.B. CDs"

@app.route("/shop/item/<id>")
def shopi(id):
    cursor = mysql.connection.cursor()
    sql = '''SELECT Name, Interpret FROM mydb.cd Where idCD = "''' \
                + id + '"'     
    cursor.execute(sql)
    result = cursor.fetchone()
    name = str(result[0]) + " bei " + str(result[1])
    return render_template('Produktbeschreibung.html', name=name, idd=id)

@app.route("/shop/warenkorb/")
def shopw():
    #session['warenkorb'] = [[1, 'Kühe machen mühe'],[2, "Hallo Muh"]]
    return render_template("warenkorb.html", articles=session['warenkorb'])

@app.route("/shop/login/")
def shop():
    return render_template('login.html')


@app.route('/loggedIn', methods=['GET', 'POST'])
def logingin():
    if request.method == 'POST':
        name = request.form['username']
        cursor = mysql.connection.cursor()
        sql = '''SELECT password FROM mydb.kunde WHERE username = "''' \
                 + name + '"'
        cursor.execute(sql)
        result = cursor.fetchone()
        password = result[0]
        if password == request.form['password']:
            print("loggin correct")
            session['username'] = name
            session['warenkorb'] = []
            a = getArticles()
            return render_template('S1.html', articles=a)
        else:
            print("nope")
            return render_template('login.html')
            
@app.route('/shop/buy/<id>')           
def buy(id):
    try:
        cursor = mysql.connection.cursor()
        sql = '''SELECT Name FROM mydb.cd Where idCD = "''' \
                    + id + '"'     
        cursor.execute(sql)
        result = cursor.fetchone()
        name = result[0]
        w = session['warenkorb']
        w.append([id, name])
        session['warenkorb'] = w
        return render_template("warenkorb.html", articles=session['warenkorb'])
    except:
        return "<h1>You must be logged in to buy</h1><a href='/shop/login'>login</a>"
    
    
def getArticles():
    cursor = mysql.connection.cursor()
    sql = 'SELECT * FROM mydb.cd;'
    cursor.execute(sql)        
    result = cursor.fetchall()
    print(result)
    return result[:4]
    
if __name__ == "__main__":
    app.secret_key = 'super secret key'
    app.run(debug=True)
