from cadastrar_salario import adicionar_salario
from cadastrar_gasto import adicionar_gasto
from cadastrar_meta import adicionar_meta
from alterar import alterar_dados
from saldo_atualizado import calcular_saldo
from extrato_usuario import ver_extrato
from excluir_conta import excluir_conta_usuario

def menu_principal(id_usuario):
    while True:
        print('\n--- MENU PRINCIPAL ---')
        print('1 - Cadastrar Salário')
        print('2 - Cadastrar Gasto')
        print('3 - Cadastrar Meta')
        print('4 - Alterar dados de usuário')
        print('5 - Ver saldo atual')
        print('6 - Ver extrato')
        print('7 - Excluir minha conta')
        print('8 - Sair')

        opcao = input('Escolha uma opção: ')
        if opcao == '1':
            adicionar_salario(id_usuario)
        elif opcao == '2':
            adicionar_gasto(id_usuario)
        elif opcao == '3':
            adicionar_meta(id_usuario)
        elif opcao == '4':
            alterar_dados(id_usuario)
        elif opcao == '5':
            calcular_saldo(id_usuario)
        elif opcao == '6':
            ver_extrato(id_usuario)
        elif opcao == '7':
            excluir_conta_usuario(id_usuario)
            break
        elif opcao == '8':
            print('Saindo do menu principal...')
            break
        else:
            print('Opção Inválida! Tente novamente.')
