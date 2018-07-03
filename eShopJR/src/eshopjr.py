# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

from flask import Flask

app = Flask(__name__)

@app.route("/shop")
def shop():
    return "Template"

if __name__ == "__main__":
    app.run(debug=True)
