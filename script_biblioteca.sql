mysql> CREATE DATABASE Biblioteca;
Query OK, 1 row affected (0.01 sec)

mysql> USE Biblioteca;
Database changed
mysql> CREATE TABLE Autores (
    -> id_autor INT NOT NULL,
    -> nome VARCHAR(100) NOT NULL,
    -> nacionalidade VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> CREATE TABLE Livros (
    ->     id_livro INT NOT NULL,
    ->     titulo VARCHAR(150) NOT NULL,
    ->     ano_publicacao INT,
    ->     id_autor INT
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> ALTER TABLE Autores ADD PRIMARY KEY (id_autor);
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Livros ADD PRIMARY KEY (id_livro);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Autores MODIFY id_autor INT AUTO_INCREMENT;
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Livros MODIFY id_livro INT AUTO_INCREMENT;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Livros ADD CONSTRAINT FK_Autor_Livro
    -> FOREIGN KEY (id_autor) REFERENCES Autores(id_autor);
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Autores (nome, nacionalidade) VALUES ('Elsie Silver' , 'Canadense');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Livros (titulo, ano_publicacao, id_autor) VALUES ('Sem Coração' , '2025' , '1');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT Livros.titulo, Autores.nome
    -> FROM Livros
    -> INNER JOIN Autores ON Livros.id_autor = Autores.id_autor;
+---------------+--------------+
| titulo        | nome         |
+---------------+--------------+
| Sem Coração   | Elsie Silver |
+---------------+--------------+
1 row in set (0.00 sec)

mysql> INSERT INTO Autores (nome, nacionalidade) VALUES ('Emily Henry' , 'norte-americana');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Livros (titulo, ano_publicacao, id_autor) VALUES ('Leitura De Verão', '2020', '2');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT Livros.titulo, Autores.nome
    -> FROM Livros
    -> INNER JOIN Autores ON Livros.id_autor = Autores.id_autor;
+-------------------+--------------+
| titulo            | nome         |
+-------------------+--------------+
| Sem Coração       | Elsie Silver |
| Leitura De Verão  | Emily Henry  |
+-------------------+--------------+
2 rows in set (0.01 sec)

mysql>  INSERT INTO Autores (nome, nacionalidade) VALUES ('Agatha Christie' , 'britânica');
Query OK, 1 row affected (0.01 sec)

mysql>  INSERT INTO Livros (titulo, ano_publicacao, id_autor) VALUES ('M ou N?' , '1941' , '3');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT Livros.titulo, Autores.nome
    -> FROM Livros
    -> INNER JOIN Autores ON Livros.id_autor = Autores.id_autor;
+-------------------+-----------------+
| titulo            | nome            |
+-------------------+-----------------+
| Sem Coração       | Elsie Silver    |
| Leitura De Verão  | Emily Henry     |
| M ou N?           | Agatha Christie |
+-------------------+-----------------+
3 rows in set (0.00 sec)

mysql> CREATE TABLE Usuarios (
    ->     id_usuario INT NOT NULL,
    ->     nome VARCHAR(100) NOT NULL,
    ->     email VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE Emprestimos (
    ->     id_emprestimo INT NOT NULL,
    ->     id_livro INT NOT NULL,
    ->     id_usuario INT NOT NULL,
    ->     data_saida DATE NOT NULL,
    ->     data_devolucao DATE
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> ALTER TABLE Usuarios ADD PRIMARY KEY (id_usuario);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Emprestimos ADD PRIMARY KEY (id_emprestimo);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Usuarios MODIFY id_usuario INT AUTO_INCREMENT;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Emprestimos MODIFY id_emprestimo INT AUTO_INCREMENT;
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Emprestimos ADD CONSTRAINT FK_Livro_Emprestimo
    -> FOREIGN KEY (id_livro) REFERENCES Livros(id_livro);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Emprestimos ADD CONSTRAINT FK_Usuario_Emprestimo
    -> FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Usuarios (nome, email) VALUES ('Maria', 'maria@email.com');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Usuarios (nome, email) VALUES ('Sarah' , 'sarah@gmail.com');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Usuarios (nome, email) VALUES ('Brunna' , 'brunna@gmail.com');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Emprestimos (id_livro, id_usuario, data_saida)
    -> VALUES (1, 1, CURDATE());
Query OK, 1 row affected (0.01 sec)

mysql> SELECT
    ->     Usuarios.nome AS 'Leitor',
    ->     Livros.titulo AS 'Livro',
    ->     Autores.nome AS 'Autor',
    ->     Emprestimos.data_saida AS 'Data do Empréstimo'
    -> FROM Emprestimos
    -> INNER JOIN Usuarios ON Emprestimos.id_usuario = Usuarios.id_usuario
    -> INNER JOIN Livros ON Emprestimos.id_livro = Livros.id_livro
    -> INNER JOIN Autores ON Livros.id_autor = Autores.id_autor;
+--------+---------------+--------------+---------------------+
| Leitor | Livro         | Autor        | Data do Empréstimo  |
+--------+---------------+--------------+---------------------+
| Maria  | Sem Coração   | Elsie Silver | 2026-03-04          |
+--------+---------------+--------------+---------------------+
1 row in set (0.01 sec)

mysql> INSERT INTO Emprestimos (id_livro, id_usuario, data_saida)
    -> VALUES (2 , 2, CURDATE());
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Emprestimos (id_livro, id_usuario, data_saida)
    -> VALUES (3 , 3, CURDATE());
Query OK, 1 row affected (0.01 sec)

mysql> SELECT
    ->  Usuarios.nome AS 'Leitor',
    ->  Livros.titulo AS 'Livro',
    -> Autores.nome AS 'Autor',
    ->  Emprestimos.data_saida AS 'Data do Empréstimo'
    ->  FROM Emprestimos
    ->  INNER JOIN Usuarios ON Emprestimos.id_usuario = Usuarios.id_usuario
    -> INNER JOIN Livros ON Emprestimos.id_livro = Livros.id_livro
    ->  INNER JOIN Autores ON Livros.id_autor = Autores.id_autor;
+--------+-------------------+-----------------+---------------------+
| Leitor | Livro             | Autor           | Data do Empréstimo  |
+--------+-------------------+-----------------+---------------------+
| Maria  | Sem Coração       | Elsie Silver    | 2026-03-04          |
| Sarah  | Leitura De Verão  | Emily Henry     | 2026-03-04          |
| Brunna | M ou N?           | Agatha Christie | 2026-03-04          |
+--------+-------------------+-----------------+---------------------+
3 rows in set (0.00 sec)

mysql> UPDATE Emprestimos
    -> SET data_devolucao = CURDATE()
    -> WHERE id_usuario = 1 AND id_livro = 1;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT
    -> Usuarios.nome AS 'Leitor',
    ->  Livros.titulo AS 'Livro',
    ->  Autores.nome AS 'Autor',
    ->  Emprestimos.data_saida AS 'Data do Empréstimo'
    ->  FROM Emprestimos
    -> INNER JOIN Usuarios ON Emprestimos.id_usuario = Usuarios.id_usuario
    -> INNER JOIN Livros ON Emprestimos.id_livro = Livros.id_livro
    ->  INNER JOIN Autores ON Livros.id_autor = Autores.id_autor;
+--------+-------------------+-----------------+---------------------+
| Leitor | Livro             | Autor           | Data do Empréstimo  |
+--------+-------------------+-----------------+---------------------+
| Maria  | Sem Coração       | Elsie Silver    | 2026-03-04          |
| Sarah  | Leitura De Verão  | Emily Henry     | 2026-03-04          |
| Brunna | M ou N?           | Agatha Christie | 2026-03-04          |
+--------+-------------------+-----------------+---------------------+
3 rows in set (0.00 sec)

mysql> SELECT
    ->  Usuarios.nome AS 'Leitor',
    ->  Livros.titulo AS 'Livro',
    ->  Autores.nome AS 'Autor'
    -> Emprestimos.data_saida AS 'Data do Empréstimo'
    -> Emprestimos.data_devolucao AS 'Data Devolução'
    -> FROM Emprestimos
    -> INNER JOIN Usuarios ON Emprestimos.id_usuario = Usuarios.id_usuario
    -> INNER JOIN Livros ON Emprestimos.id_livro = Livros.id_livro
    -> INNER JOIN Autores ON Livros.id_autor = Autores.id_autor;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Emprestimos.data_saida AS 'Data do Empréstimo'
Emprestimos.data_devolucao AS 'D' at line 5
mysql> SELECT
    ->     Usuarios.nome AS 'Leitor',
    ->     Livros.titulo AS 'Livro',
    ->     Autores.nome AS 'Autor',
    ->     Emprestimos.data_saida AS 'Data do Empréstimo', 
    ->     Emprestimos.data_devolucao AS 'Data Devolução'
    -> FROM Emprestimos
    -> INNER JOIN Usuarios ON Emprestimos.id_usuario = Usuarios.id_usuario
    -> INNER JOIN Livros ON Emprestimos.id_livro = Livros.id_livro
    -> INNER JOIN Autores ON Livros.id_autor = Autores.id_autor;
+--------+-------------------+-----------------+---------------------+------------------+
| Leitor | Livro             | Autor           | Data do Empréstimo  | Data Devolução   |
+--------+-------------------+-----------------+---------------------+------------------+
| Maria  | Sem Coração       | Elsie Silver    | 2026-03-04          | 2026-03-04       |
| Sarah  | Leitura De Verão  | Emily Henry     | 2026-03-04          | NULL             |
| Brunna | M ou N?           | Agatha Christie | 2026-03-04          | NULL             |
+--------+-------------------+-----------------+---------------------+------------------+
3 rows in set (0.00 sec)