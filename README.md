📚 Sistema de Gerenciamento de Biblioteca (SQL)

📌 Sobre o Projeto

Este projeto foi desenvolvido como um exercício prático para dominar os fundamentos de bancos de dados relacionais e a linguagem SQL. O sistema gerencia o fluxo completo de uma biblioteca, desde o cadastro de autores e livros até o controle de empréstimos e devoluções para usuários.

🛠️ Tecnologias Utilizadas

Banco de Dados: MySQL. Ferramentas: Terminal MySQL / MySQL Workbench. Conceitos Aplicados: Modelagem de Dados, Chaves Primárias (PK), Chaves Estrangeiras (FK), Relacionamentos (Joins), DML (Insert, Update) e DQL (Selects complexos).

🏗️ Estrutura do Banco de Dados

Optei por uma abordagem de modelagem organizada, onde as tabelas são criadas primeiro e todas as restrições de integridade (Primary e Foreign Keys) são definidas ao final do script utilizando o comando ALTER TABLE. Isso garante uma visão clara da estrutura antes da aplicação das regras de negócio.

🚀 Funcionalidades Principais

Cadastro de Acervo: Registro de autores e livros com integridade referencial. Gestão de Usuários: Cadastro de leitores da biblioteca. Controle de Empréstimos: Registro de saídas de livros vinculando usuário, obra e data. Sistema de Devolução: Atualização de status de empréstimos através de campos temporais. Relatórios Dinâmicos: Consultas utilizando INNER JOIN para consolidar dados de múltiplas tabelas em um único relatório legível.

📊 Exemplo de Consulta (Triple JOIN)

Demonstração de como o sistema conecta Leitores, Livros e Autores: SELECT Usuarios.nome AS 'Leitor', Livros.titulo AS 'Livro', Autores.nome AS 'Autor', Emprestimos.data_saida AS 'Data Saída' FROM Emprestimos INNER JOIN Usuarios ON Emprestimos.id_usuario = Usuarios.id_usuario INNER JOIN Livros ON Emprestimos.id_livro = Livros.id_livro INNER JOIN Autores ON Livros.id_autor = Autores.id_autor;