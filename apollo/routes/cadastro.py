from flask import Blueprint, render_template, request

cadastro_route = Blueprint('cadastro', __name__)

@cadastro_route.route('/', methods=['POST'])
def inserir_usuario():
    """ inserir os dados do usuario"""
    
    
    return render_template('home.html')