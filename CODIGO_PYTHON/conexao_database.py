import mysql.connector

def conectar():
    return mysql.connector.connect(
        host= 'localhost',
        user= 'deny_silva',
        password= 'Denilson045174',
        database= 'projeto_financeiro',
    )
print('Conexão bem sucedida!')
