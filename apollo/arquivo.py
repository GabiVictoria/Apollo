def salvar_usuario(con,nome,email,senha,data_nasc,fk_Lingua_nome_lingua):
    cursor = con.cursor()
    sql = "INSERT INTO Usuario (nome,email,senha,data_nasc,fk_Lingua_nome_lingua) VALUES (%s, %s, %s, %s, %s)"
    cursor.execute(sql, (nome,email,senha,data_nasc,fk_Lingua_nome_lingua))

    con.commit() 
    cursor.close()

def obter_usuario(con):
    cursor = con.cursor()
    sql = "SELECT * FROM Usuario"
    cursor = con.cursor(dictionary=True)
    cursor.execute(sql)

    usuarios = []

    for (registro) in cursor:
        usuarios.append(registro)

    return usuarios