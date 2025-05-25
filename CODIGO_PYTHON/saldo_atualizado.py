from conexao_database import conectar

def calcular_saldo(id_usuario):
    con = conectar()
    cursor = con.cursor()
    cursor.execute("SELECT SUM(valor) FROM salarios WHERE id_usuario = %s", (id_usuario,))
    total_salario = cursor.fetchone()[0] or 0
    cursor.execute("SELECT SUM(valor) FROM gastos WHERE id_usuario = %s", (id_usuario,))
    total_gasto = cursor.fetchone()[0] or 0

    saldo = total_salario - total_gasto
    print(f'\nO seu saldo atual é: R${saldo :.2f}')
    con.close()
