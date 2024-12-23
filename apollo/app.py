from flask import Flask, render_template, request
from apollo.conexao import conexao_fechar, conexao_abrir
from apollo.arquivo import *

con = conexao_abrir("localhost", "root", "1234", "apollo_bd")
app = Flask(__name__)



@app.route("/cadastro", methods = ['POST'])
def cadastrar():
    nome = request.form['nome'].strip()
    email = request.form['email'].strip()
    senha = request.form['senha'].strip()
    data_nasc = request.form['data_nasc'].strip()
    fk_Lingua_nome_lingua = request.form['fk_Lingua_nome_lingua'].strip()
    salvar_usuario(con, nome,email,senha,data_nasc,fk_Lingua_nome_lingua)
    return render_template("login.html")

@app.route("/", methods = ['POST'])
def entrar():
    #puxando do forms 
    email = request.form['email'].strip()
    senha = request.form['senha'].strip()
    #pegando do arquivo
    usuarios = obter_usuario(con)
    contem = False 

    #percorrendo a lista e comparando
    for usuario in usuarios: 
        if (email == usuario['email']) and (senha == usuario['senha']):
            contem = True
              
    if contem: 
        return render_template ("home.html")
    else: 
        erro = "Email ou senha incorretos!"
        return render_template ("login.html", erro=erro)
    
@app.route('/salvar_historia', methods=['POST'])
def salvar_historia():
    texto_formatado = request.form['area1']
    print(texto_formatado)
    descricao = request.form['descricao'].strip()
    texto = request.form['area1'].strip()
    data_criacao = request.form['data_criacao'].strip()
    status = request.form['status'].strip()
    titulo = request.form['titulo'].strip()
    salvar_texto(con,descricao,texto, data_criacao,status,titulo)
    return render_template("home.html")

@app.route('/home', methods=['GET'])
def obter_historias():
    historias = obter_textos(con)  # Função para buscar as histórias do banco de dados
    return render_template('home.html', historias=historias)

@app.route('/')
def login():
    return render_template('login.html')


@app.route('/cadastro')
def cadastro():
    return render_template('cadastro.html')


@app.route('/criar_historia')
def criar_historia():
    return render_template('historia.html')