from conexao_database import conectar
from datetime import datetime

def ver_extrato(id_usuario):
    con = conectar()
    cursor = con.cursor()
    print('\n--- EXTRATO DE DEPOSITO ---')
    cursor.execute("SELECT valor, data_registro FROM salarios WHERE id_usuario = %s", (id_usuario,))
    salarios = cursor.fetchall()
    if salarios:
        for valor, data_registro in salarios:
            data_formatada = data_registro.strftime('%d/%m/%Y')
            print(f'Depósito: R${valor} em {data_formatada}')
    else:
        print('Nenhum salário registrado.')
    
    print('\n--- EXTRATO DE GASTOS ---')
    cursor.execute("SELECT valor, data_gasto, descricao FROM gastos WHERE id_usuario = %s", (id_usuario,))
    gastos = cursor.fetchall()
    if gastos:
        for valor, data, descricao in gastos:
            data_formatada = data.strftime('%d/%m/%Y')
            print(f'Gasto: R${valor} em {data_formatada} | Descrição: {descricao}')
    else:
        print('Nenhum gasto registrado.')
    
    con.close()
