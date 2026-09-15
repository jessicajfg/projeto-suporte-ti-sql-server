# 🗄️ Projeto Suporte TI — SQL Server

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=flat-square&logo=microsoftsqlserver&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-T--SQL-336791?style=flat-square)
![Suporte](https://img.shields.io/badge/Cenário-Suporte%20TI-0A66C2?style=flat-square)

Projeto prático desenvolvido em **Microsoft SQL Server** para simular uma base utilizada por uma equipe de **Suporte Técnico** no registro e acompanhamento de chamados.

A proposta foi aplicar SQL em um cenário próximo da rotina de Suporte a Sistemas, trabalhando com usuários, chamados, prioridades, status, departamentos e atualização segura de registros.

## 👀 Visão rápida

- Banco: `ProjetoSuporteTI`
- 2 tabelas relacionadas: `usuarios` e `chamados`
- 20 usuários fictícios cadastrados
- 15 chamados simulados
- consultas com filtros, JOINs e agregações
- atualização de chamado utilizando transação
- evidências visuais no SSMS

➡️ **[Ver o script SQL completo](projeto_suporte_ti.sql)**

## 🎯 Objetivo

Praticar conceitos de SQL aplicados a uma situação realista de suporte técnico, desde a criação da estrutura do banco até consultas para análise da fila de chamados e alterações controladas de dados.

## 🛠️ Tecnologias utilizadas

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL

## 🗃️ Estrutura do banco

### `usuarios`

Armazena informações dos usuários que podem abrir chamados:

- ID do usuário
- nome
- e-mail
- departamento
- status ativo/inativo

### `chamados`

Armazena os registros de suporte:

- ID do chamado
- usuário relacionado
- título e descrição
- prioridade
- status
- data de abertura
- data de fechamento

As tabelas são relacionadas por uma **Foreign Key** entre `chamados.idusuario` e `usuarios.idusuario`.

## 📚 Conceitos praticados

`CREATE DATABASE` · `CREATE TABLE` · `PRIMARY KEY` · `FOREIGN KEY` · `IDENTITY` · `NOT NULL` · `DEFAULT` · `INSERT INTO` · `SELECT` · `WHERE` · `ORDER BY` · `INNER JOIN` · `COUNT()` · `GROUP BY` · `UPDATE` · `GETDATE()` · `BEGIN TRANSACTION` · `COMMIT` · `ROLLBACK`

## 🔎 Consultas realizadas

Durante o projeto foram desenvolvidas consultas para:

- relacionar chamados aos usuários e departamentos;
- identificar chamados por prioridade e status;
- calcular a quantidade de chamados por departamento;
- agrupar chamados por prioridade e status;
- localizar chamados de prioridade alta ainda em aberto;
- atualizar status e data de fechamento utilizando transação.

## 📸 Evidências

### 1. Estrutura do banco de dados

Banco `ProjetoSuporteTI` com as tabelas `usuarios` e `chamados`.

![Estrutura do banco de dados](imagens/01-database-criada.png)

### 2. Relacionamento entre chamados e usuários

Consulta com `INNER JOIN` relacionando chamados aos usuários e respectivos departamentos.

![INNER JOIN entre chamados e usuários](imagens/02-inner-join-chamados-usuarios.png)

### 3. Quantidade de chamados por departamento

Consulta utilizando `COUNT()`, `GROUP BY` e `ORDER BY`.

![Quantidade de chamados por departamento](imagens/03-chamados-por-departamento.png)

### 4. Chamados por prioridade e status

Agrupamento utilizado para visualizar a distribuição da fila de atendimento.

![Chamados por prioridade e status](imagens/04-chamados-por-prioridade-status.png)

### 5. Chamados de alta prioridade em aberto

Consulta com `WHERE`, `AND` e `INNER JOIN` para localizar chamados críticos ainda pendentes.

![Chamados de alta prioridade em aberto](imagens/05-chamados-alta-abertos.png)

### 6. Atualização de chamado com transação

Antes da atualização, o chamado estava com status `Aberto` e sem data de fechamento.

![Chamado antes da atualização](imagens/06a-antes-update.png)

Após o `UPDATE`, o chamado passou para `Fechado`, recebeu a data de fechamento e a alteração foi confirmada com `COMMIT`.

![Chamado depois da atualização](imagens/06b-depois-update.png)

## 💡 Competências demonstradas

- SQL aplicado a Suporte a Sistemas
- modelagem relacional básica
- consultas e filtros
- JOINs entre tabelas
- agregações para análise de chamados
- atualização controlada de registros
- uso de transações
- organização e documentação técnica

## ✅ Resultado

O projeto consolidou conceitos de SQL em um contexto próximo ao atendimento de suporte, conectando banco de dados, investigação de chamados e manutenção segura de informações.

---

[← Voltar ao meu portfólio](https://github.com/jessicajfg)
