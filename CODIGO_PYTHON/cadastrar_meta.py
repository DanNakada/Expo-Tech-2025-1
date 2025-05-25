from conexao_database import conectar
from datetime import datetime

def adicionar_meta(id_usuario):
    con = conectar()
    cursor = con.cursor()

    objetivo = input('Digite o objetivo da meta: ')
    data_str = input('Digite a data limite (formato: DD/MM/AAAA): ')
    try:
        data_limite = datetime.strptime(data_str, "%d/%m/%Y").date()
    except ValueError:
        print('Data inválida. Use o formato DD/MM/AAAA.')
        return
    print('Status da meta:')
    print('1 - Não')
    print('2 - Em andamento')
    print('3 - Sim')
    opcao = input('Escolha uma opcao (1 / 2 / 3): ')
    if opcao == '1':
        atingida = 'Não'
    elif opcao == '2':
        atingida = 'Em andamento'
    elif opcao == '3':
        atingida = 'Sim'
    else:
        print('Opção Inválida.')
        return
    
    cursor.execute("insert into metas(id_usuario, objetivo_meta, data_limite, atingida) values (%s, %s, %s, %s)", (id_usuario, objetivo, data_limite, atingida))
    con.commit()
    print('Meta cadastrada com sucesso!')
    cursor.close()
    con.close()
