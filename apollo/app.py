from flask import Flask, url_for, render_template

app = Flask(__name__)

@app.route('/')
def login():
    return render_template('index.html')

@app.route('/cadastro')
def cadastro():
    return "tudo certo? bem vindo ao apollo"