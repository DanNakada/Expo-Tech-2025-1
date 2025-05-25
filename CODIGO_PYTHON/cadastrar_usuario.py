from conexao_database import conectar

def criar_usuario(nome, email, senha, recuperar_senha):
    con = conectar()
    cursor = con.cursor()
    cursor.execute("insert into usuarios (nome, email, senha, recuperar_senha) values (%s, %s, %s, %s)", (nome, email, senha, recuperar_senha))
    con.commit()
    con.close()

def login(email, senha):
    con = conectar()
    cursor = con.cursor()
    cursor.execute('select id_usuario from usuarios where email = %s and senha = %s', (email, senha))
    resultado = cursor.fetchone()
    con.close()
    return resultado[0] if resultado else None

def senha_recuperacao(email, recuperar_senha):
    con = conectar()
    cursor = con.cursor()
    cursor.execute('select id_usuario from usuarios where email = %s and recuperar_senha = %s', (email, recuperar_senha))
    usuario = cursor.fetchone()
    if usuario:
        nova_senha = input('Senha de recuperação correta! Digite a nova senha: ')
        cursor.execute('update usuarios set senha = %s where email = %s', (nova_senha, email))
        con.commit()
        print('Senha atualizada com sucesso!')
    else:
        print('E-mail ou senha de recuperação incorretos.')
    con.close()
