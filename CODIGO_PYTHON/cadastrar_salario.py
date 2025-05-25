from conexao_database import conectar
from datetime import datetime

def adicionar_salario(id_usuario):
    con = conectar()
    cursor = con.cursor()

    valor = float(input('Digite o valor do salário líquido: '))
    mes = int(input('Digite o mês do salário (1-12): '))
    ano = int(input('Digite o ano do salário (ex: 2025): '))
    data_registro = datetime.now().date()
    cursor.execute("insert into salarios(id_usuario, valor, mes, ano, data_registro) values (%s, %s, %s, %s, %s)", (id_usuario, valor, mes, ano, data_registro))
    con.commit()
    print('Salário cadastrado com sucesso!')
    cursor.close()
    con.close()
