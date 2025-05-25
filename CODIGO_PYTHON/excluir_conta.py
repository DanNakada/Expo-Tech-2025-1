from conexao_database import conectar

def excluir_conta_usuario(id_usuario):
    con = conectar()
    cursor = con.cursor()
    confirmacao = input('\nTem certeza que deseja excluir sua conta? todos os dados serão apagados! (s/n:)')
    if confirmacao.upper() != 'S':
        print('Operação cancelada.')
        return
    cursor.execute("DELETE FROM gastos WHERE id_usuario = %s", (id_usuario,))
    cursor.execute("DELETE FROM salarios WHERE id_usuario = %s", (id_usuario,))
    cursor.execute("DELETE FROM metas WHERE id_usuario = %s", (id_usuario,))
    cursor.execute("DELETE FROM usuarios WHERE id_usuario = %s", (id_usuario,))
    con.commit()
    con.close()
    print('\nConta e todos os dados excluídos com sucesso.')
