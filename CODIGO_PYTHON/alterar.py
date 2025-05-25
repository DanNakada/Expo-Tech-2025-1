from conexao_database import conectar

def alterar_dados(id_usuario):
    con = conectar()
    cursor = con.cursor()
    
    print('\nO que deseja alterar?')
    print('1 - Nome')
    print('2 - Email')
    print('3 - Senha')
    print('4 - Pergunta de recuperação')

    opcao = input('Escolha uma opção: ')
    if opcao == '1':
        novo_nome = input('Digite o novo nome: ')
        cursor.execute("UPDATE usuarios SET nome = %s WHERE id_usuario = %s", (novo_nome, id_usuario))
    elif opcao == '2':
        novo_email = input('Digite o novo email: ')
        cursor.execute("UPDATE usuarios SET email = %s WHERE id_usuario = %s", (novo_email, id_usuario))
    elif opcao == '3':
        nova_senha = input('Digite a nova senha: ')
        cursor.execute("UPDATE usuarios SET senha = %s WHERE id_usuario = %s", (nova_senha, id_usuario))
    elif opcao == '4':
        nova_pergunta = input('Digite a nova senha de recuperação: ')
        cursor.execute("Update usuarios SET recuperar_senha = %s WHERE id_usuario = %s", (nova_pergunta, id_usuario))
    else:
        print('Opção inválida!')
        con.close()
        return
    con.commit()
    print('Dados atualizados com sucesso!')
    con.close()
