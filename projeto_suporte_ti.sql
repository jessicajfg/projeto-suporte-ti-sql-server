-- ============================================================
-- PROJETO: SUPORTE TI - SQL SERVER
-- Objetivo:
-- Simular uma base de chamados de suporte técnico e praticar
-- criação de banco, tabelas, relacionamentos, inserções,
-- consultas, JOINs, agregações e atualização com transação.
-- ============================================================


-- ============================================================
-- 1. CRIAÇÃO DO BANCO DE DADOS
-- ============================================================

CREATE DATABASE ProjetoSuporteTI;
GO

USE ProjetoSuporteTI;
GO


-- ============================================================
-- 2. CRIAÇÃO DA TABELA USUARIOS
-- ============================================================

CREATE TABLE usuarios (
    idusuario INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    departamento VARCHAR(50),
    ativo BIT NOT NULL DEFAULT 1
);
GO


-- ============================================================
-- 3. INSERÇÃO DOS USUÁRIOS
-- ============================================================

INSERT INTO usuarios (nome, email, departamento)
VALUES
('Ana Souza', 'ana.souza@empresa.com', 'Financeiro'),
('Bruno Lima', 'bruno.lima@empresa.com', 'RH'),
('Carla Mendes', 'carla.mendes@empresa.com', 'Comercial'),
('Diego Alves', 'diego.alves@empresa.com', 'TI'),
('Fernanda Rocha', 'fernanda.rocha@empresa.com', 'Financeiro'),
('Gabriel Martins', 'gabriel.martins@empresa.com', 'TI'),
('Helena Costa', 'helena.costa@empresa.com', 'RH'),
('Igor Santos', 'igor.santos@empresa.com', 'Financeiro'),
('Juliana Ribeiro', 'juliana.ribeiro@empresa.com', 'Comercial'),
('Kaique Oliveira', 'kaique.oliveira@empresa.com', 'Suporte'),
('Larissa Gomes', 'larissa.gomes@empresa.com', 'Marketing'),
('Marcos Ferreira', 'marcos.ferreira@empresa.com', 'TI'),
('Natalia Barros', 'natalia.barros@empresa.com', 'Financeiro'),
('Otavio Pereira', 'otavio.pereira@empresa.com', 'Suporte'),
('Patricia Araujo', 'patricia.araujo@empresa.com', 'RH'),
('Rafael Nunes', 'rafael.nunes@empresa.com', 'Comercial'),
('Sabrina Melo', 'sabrina.melo@empresa.com', 'Marketing'),
('Thiago Rocha', 'thiago.rocha@empresa.com', 'TI'),
('Vanessa Lima', 'vanessa.lima@empresa.com', 'Suporte'),
('William Souza', 'william.souza@empresa.com', 'Financeiro');
GO


-- ============================================================
-- 4. CONSULTA DOS USUÁRIOS CADASTRADOS
-- ============================================================

SELECT *
FROM usuarios;
GO


-- ============================================================
-- 5. CRIAÇÃO DA TABELA CHAMADOS
-- ============================================================

CREATE TABLE chamados (
    idchamado INT IDENTITY(1,1) PRIMARY KEY,
    idusuario INT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    descricao VARCHAR(500),
    prioridade VARCHAR(20) NOT NULL,
    status VARCHAR(30) NOT NULL,
    data_abertura DATETIME NOT NULL DEFAULT GETDATE(),
    data_fechamento DATETIME,

    FOREIGN KEY (idusuario)
        REFERENCES usuarios(idusuario)
);
GO


-- ============================================================
-- 6. INSERÇÃO DOS CHAMADOS
-- ============================================================

INSERT INTO chamados
    (idusuario, titulo, descricao, prioridade, status)
VALUES
(1,
 'Sistema financeiro não abre',
 'Usuário relatou que está com problema ao entrar no sistema, aparece erro "TAL"',
 'Alta',
 'Aberto'),

(4,
 'Usuário sem acesso à VPN',
 'Usuário relatou que ao acessar VPN dá mensagem de Acesso negado',
 'Alta',
 'Em andamento'),

(7,
 'Outlook não está sincronizando',
 'Usuário relatou que o Outlook não está sincronizando e fica apenas a mensagem "Conectando ao Servidor"',
 'Média',
 'Aberto'),

(10,
 'Impressora não imprime',
 'Usuário relatou que a impressora está travada e não está imprimindo',
 'Baixa',
 'Aberto'),

(15,
 'Senha do sistema bloqueada',
 'Usuário relatou que tentou acessar o sistema e errou nas tentativas de senha, então a senha bloqueou',
 'Média',
 'Em andamento'),

(2,
 'Erro ao acessar sistema de RH',
 'Usuário informou que o sistema de RH fecha logo após o login.',
 'Média',
 'Aberto'),

(3,
 'Lentidão no computador',
 'Usuário relatou lentidão ao abrir programas e navegar entre pastas.',
 'Baixa',
 'Em andamento'),

(5,
 'Acesso negado à pasta compartilhada',
 'Usuário informou que não consegue acessar a pasta compartilhada do setor.',
 'Alta',
 'Aberto'),

(6,
 'Teams sem áudio',
 'Usuário relatou que participa das reuniões, mas não consegue ouvir os demais participantes.',
 'Média',
 'Aberto'),

(8,
 'Erro ao imprimir documento em PDF',
 'Usuário informou que a impressão de arquivos PDF falha, mas outros arquivos imprimem normalmente.',
 'Baixa',
 'Em andamento'),

(9,
 'Sistema comercial apresentando tela em branco',
 'Usuário relatou que após o login o sistema carrega apenas uma tela em branco.',
 'Alta',
 'Aberto'),

(11,
 'Conta de e-mail bloqueada',
 'Usuário informou que não consegue acessar o e-mail corporativo e recebe mensagem de conta bloqueada.',
 'Alta',
 'Em andamento'),

(12,
 'VPN desconectando com frequência',
 'Usuário relatou que a conexão VPN cai várias vezes durante o expediente.',
 'Média',
 'Aberto'),

(16,
 'Computador não reconhece dispositivo USB',
 'Usuário informou que o computador não reconhece um dispositivo USB conectado.',
 'Baixa',
 'Aberto'),

(20,
 'Sistema financeiro muito lento',
 'Usuário relatou demora excessiva para carregar consultas e relatórios no sistema financeiro.',
 'Média',
 'Em andamento');
GO


-- ============================================================
-- 7. CONSULTA DOS CHAMADOS CADASTRADOS
-- ============================================================

SELECT *
FROM chamados;
GO


-- ============================================================
-- 8. FILTRO DE CHAMADOS DE PRIORIDADE ALTA E STATUS ABERTO
-- ============================================================

SELECT *
FROM chamados
WHERE prioridade = 'Alta'
    AND status = 'Aberto'
ORDER BY data_abertura DESC;
GO


-- ============================================================
-- 9. INNER JOIN ENTRE CHAMADOS E USUÁRIOS
-- ============================================================

SELECT
    c.idchamado AS Chamado,
    u.nome AS [Usuário],
    u.departamento AS Departamento,
    c.titulo AS [Título],
    c.prioridade AS Prioridade,
    c.status AS Status,
    c.data_abertura AS Data_Abertura
FROM chamados AS c
INNER JOIN usuarios AS u
    ON c.idusuario = u.idusuario
ORDER BY c.data_abertura DESC;
GO


-- ============================================================
-- 10. QUANTIDADE DE CHAMADOS POR DEPARTAMENTO
-- ============================================================

SELECT
    u.departamento AS Departamento,
    COUNT(c.idchamado) AS [Quantidade de Chamados]
FROM chamados AS c
INNER JOIN usuarios AS u
    ON c.idusuario = u.idusuario
GROUP BY u.departamento
ORDER BY [Quantidade de Chamados] DESC;
GO


-- ============================================================
-- 11. QUANTIDADE DE CHAMADOS POR PRIORIDADE E STATUS
-- ============================================================

SELECT
    c.prioridade AS Prioridade,
    c.status AS Status,
    COUNT(c.idchamado) AS [Quantidade de Chamados]
FROM chamados AS c
GROUP BY c.prioridade, c.status
ORDER BY [Quantidade de Chamados] DESC;
GO


-- ============================================================
-- 12. CHAMADOS ABERTOS DE PRIORIDADE ALTA
--     COM DADOS DO USUÁRIO
-- ============================================================

SELECT
    u.nome AS [Usuário],
    u.departamento AS Departamento,
    c.idchamado AS Chamado,
    c.titulo AS [Título],
    c.prioridade AS Prioridade,
    c.status AS Status,
    c.data_abertura AS [Data Abertura]
FROM chamados AS c
INNER JOIN usuarios AS u
    ON c.idusuario = u.idusuario
WHERE c.prioridade = 'Alta'
    AND c.status = 'Aberto'
ORDER BY c.data_abertura DESC;
GO


-- ============================================================
-- 13. ATUALIZAÇÃO DE CHAMADO COM TRANSAÇÃO
-- ============================================================

-- Consulta antes da alteração

SELECT *
FROM chamados
WHERE idchamado = 3;
GO


-- Início da transação

BEGIN TRANSACTION;


-- Atualização do chamado

UPDATE chamados
SET
    status = 'Fechado',
    data_fechamento = GETDATE()
WHERE idchamado = 3;


-- Conferência da alteração antes da confirmação

SELECT
    idchamado AS [ID Chamado],
    idusuario AS [ID Usuário],
    titulo AS [Título],
    descricao AS [Descrição],
    prioridade AS Prioridade,
    status AS Status,
    data_abertura AS [Data de Abertura],
    data_fechamento AS [Data de Fechamento]
FROM chamados
WHERE idchamado = 3;


-- Caso fosse necessário desfazer:
-- ROLLBACK;

-- Confirmação da alteração:
COMMIT;
GO
