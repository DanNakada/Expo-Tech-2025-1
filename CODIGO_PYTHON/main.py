from cadastrar_usuario import criar_usuario, login, senha_recuperacao
from menu_principal import menu_principal

def menu_inicial():
    while True:
        print('BEM VINDO AO CONTROLAÊ')
        print('\n1. Login')
        print('2. Cadastrar')
        print('3. Recuperar senha')
        print('4. Sair')

        opcao = input('Escolha uma opção: ')
        if opcao == '1':
            while True:
                email = input('Email: ')
                senha = input('Senha: ')
                id_usuario = login(email, senha)
                if id_usuario:
                    print('Login realizado com sucesso!')
                    menu_principal(id_usuario)
                    break
                else:
                    print('Email ou senha incorretos. Tente novamente!\n')
                    continuar = input('Deseja tentar novamente? (s/n): ')
                    if continuar.upper() != 'S':
                        break
        elif opcao == '2':
            nome = input('Nome: ')
            email = input('Email: ')
            senha = input('Senha: ')
            recuperar_senha = input('Senha de recuperação (ex: nome do animal): ')
            criar_usuario(nome, email, senha, recuperar_senha)
            print('Cadastro realizado com sucesso!')

        elif opcao == '3':
            email = input('Digite seu e-mail: ')
            recuperar_senha = input('Digite a senha de recuperação: ')
            senha_recuperacao()

        elif opcao == '4':
            print('Até mais! Volte sempre.')
            break
    
        else:
            print('Opção inválida! Tente novamente.')

if __name__ == '__main__':
    menu_inicial()
