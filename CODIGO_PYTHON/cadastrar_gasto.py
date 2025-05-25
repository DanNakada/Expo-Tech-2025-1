from conexao_database import conectar
from datetime import datetime

def adicionar_gasto(id_usuario):
    con = conectar()
    cursor = con.cursor()
    valor = float(input('Digite o valor do gasto: '))
    descricao = input('Digite a descrição do gasto: ')

    cursor.execute("select id_categoria, nome_categoria from categorias")
    categoria = cursor.fetchall()
    print('Categorias disponíveis:')
    for cat in categoria:
        print(f'{cat[0]} - {cat[1]}')
    id_categoria = int(input('Digite o ID da categoria: '))
    data_gasto = datetime.now().date()
    cursor.execute("insert into gastos(id_usuario, id_categoria, valor, data_gasto, descricao) values (%s, %s, %s, %s, %s)", (id_usuario, id_categoria, valor, data_gasto, descricao))
    con.commit()
    print('Gasto cadastrado com sucesso!')
    cursor.close()
    con.close()
