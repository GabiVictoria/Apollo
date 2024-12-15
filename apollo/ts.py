from apollo.conexao import conexao_fechar, conexao_abrir

def obter_usuario(con):
    cursor = con.cursor()
    sql = "SELECT * FROM Usuário"
    # Criando o cursor com a opção de retorno como dicionário   
    cursor = con.cursor(dictionary=True)
    cursor.execute(sql)

    usuarios = []

    for (registro) in cursor:
        usuarios.append(registro)
        print(registro)
    return usuarios

def main():
    con = conexao_abrir("localhost", "root", "1234", "apollo_bd")

    obter_usuario(con)

    conexao_fechar(con)

main()