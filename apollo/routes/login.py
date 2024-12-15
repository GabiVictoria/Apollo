from flask import Blueprint, render_template, request

login_route = Blueprint('login', __name__)

@login_route.route('/', methods=['POST'])
def inserir_usuario():
    # """ inserir os dados do usuario"""
    
    # data = request.json
    
    # novo_usuario = {
    #     "id": len(CLIENTES) + 1,
    #     "nome": data['nome'],
    #     "email": data['email'],
    # }
    
    # CLIENTES.append(novo_usuario)
    
    return render_template('home.html')