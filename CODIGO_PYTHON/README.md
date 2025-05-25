# Pojeto Financeiro

## Descrição:
O Projeto Financeiro é uma aplicação desenvolvida em Python com banco de dados MySQL, destinada ao controle de finanças pessoais. O sistema
permite que usuários cadastrem salários, despesas, categoria de gastos e metas, além de visualizar saldo, extrato financeiro e acompanhar o
comprimento de metas.

## Tecnologia utilizadas
- **Linguagem:** Python
- **Banco de Dados:** MySQL
- **Biliotecas:**
    - mysql-connector-python
    - datetime

## Estrutura do Banco de Dados
**Banco:** 'projeto_financeiro'

**Tabelas:**
- **usuarios**
    - id_usuario (INT, AI, PK)
    - nome (varchar(100))
    - email (varchar(100))
    - senha (varchar(100))
    - recuperar_senha (varchar(100))

- **salarios**
    - id_salario (INT, AI, PK)
    - id_usuario (INT, FK)
    - valor (decimal(10,2))
    - mes (int)
    - ano (int)
    - data_registro (date)

- **gastos**
    - id_gasto (INT, AI, PK)
    - id_usuario (INT, FK)
    - id_categoria (INT, FK)
    - valor (decimal(10,2))
    - data_gasto (date)
    - descricao (varchar(250))

- **categorias**
    - id_categoria (INT, AI, PK)
    - nome_categoria (varchar(100))

- **metas**
    - id_meta (INT, AI, PK)
    - id_usuario (INT, FK)
    - objetivo_meta (varchar(250))
    - data_limite (date)
    - atingida (varchar(20))

## Melhorias Futuras
· Interface Gráfica (TKinter ou Web)
· Gráficos Para Visualização dos dados
· Relatórios em PDF ou EXCEL
· Metas Recorrentes e Planejamento Financeiros
· Backup Automático do banco de dados
· Suporte a Múltiplos Salários no Mês

## AUTORES
- **NOMES:** Denilson Severino, Guilherme de Souza, Rafael Celestino, Daniel Nakada