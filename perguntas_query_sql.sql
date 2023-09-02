-- 1 - A Diretora Camilla Prado solicitou uma pesquisa que informe todas as obras cadastradas no acervo ordenadas por data de publicação.
SELECT O.Titulo_Obra as Obra,
    A.Nome_Autor as Autor,
    E.Nome_Editora as Editora,
    O.Data_Publicação as 'Data de Publicação'
FROM dw_obra AS O
    JOIN dw_editora AS E ON O.ID_Editora = E.ID_Editora
    JOIN dw_autor AS A ON O.ID_Autor = A.ID_Autor
ORDER BY O.Data_Publicação;
-- 2 - O Governador vai doar duzentos livros para a Biblioteca, mas só irá doar se a biblioteca tiver menos de 300 obras. O Gerente Márcio Tales solicitou que fosse feita a contagem de quantas obras a Biblioteca possui atualmente.
SELECT count(distinct titulo_obra) as 'Total de Obras'
FROM dw_obra;
-- 3 - A Gerência solicitou uma pesquisa para saber quais datas ocorreram empréstimos de livros e a quantidade emprestada. A consulta deverá retornar apenas um registro para cada data.
select count(id_emprestimo) as Total_de_Emprestimos,
    Data_Emprestimo
from dw_emprestimo
group by Data_Emprestimo
order by Total_de_Emprestimos DESC;
-- 4 - O Funcionário João Paulo Assistente de RH solicitou uma pesquisa que informasse todos os empréstimos que a Recepcionista Alice Meire fez no horário das 8hs as 9hs.
select F.Nome_Funcionario as 'Nome do Funcionario',
    O.Titulo_Obra as 'Titulo da Obra',
    E.hora_emprestimo as 'Horário do Empréstimo'
from dw_emprestimo as E
    join dw_funcionario as F on E.ID_Funcionario = F.ID_Funcionario
    join dw_obra as O on E.ID_Obra = O.ID_Obra
where E.ID_Funcionario = 8
    and E.Hora_Emprestimo between '08:00' AND '09:00';
-- 5 - A Diretoria solicitou uma pesquisa sobre devolução de livros entre as datas 29/03/2012 a 02/02/2013.
select *
from dw_devolucao;
select U.Nome_Usuario as 'Nome Usuário',
    O.Titulo_Obra as 'Titulo da Obra',
    D.Data_Devolucao as 'Data Devolução',
    D.Hora_Devolucao as 'Hora Devolução',
    D.Multa_Atraso as 'Multa por Atraso'
from dw_devolucao as D
    inner join dw_usuario as U on D.ID_Usuario = U.ID_Usuario
    inner join dw_obra as O on D.ID_Obra = O.ID_Obra
where Data_Devolucao between '2012-03-29' and '2013-02-02'
order by Data_Devolucao;
-- 6 - A Gerência solicitou uma pesquisa para saber quais reservas de livros que foram feitas com data maior  ou igual a 18/08/2011.
select O.Titulo_Obra as 'Titulo da Obra',
    R.Status_Livro as 'Status da Reserva',
    R.Data_Reserva as 'Data da Reserva',
    R.Hora_Reserva as 'Hora da Reserva',
    U.Nome_Usuario as 'Resevado por'
from dw_reserva as R
    inner join dw_usuario as U on R.ID_Usuario = U.ID_Usuario
    inner join dw_obra as O on R.ID_Obra = O.ID_Obra
where Data_Reserva >= '2011-08-18'
    AND R.Status_Livro = 'Reservado';
-- 7 -  A área de RH solicitou uma pesquisa para saber quais devoluções de livros  foram feitas antes de 29/03/2012.
select O.Titulo_Obra,
    D.Data_Devolucao,
    D.Hora_Devolucao,
    D.Multa_Atraso
from dw_devolucao as D
    inner join dw_obra as O on D.ID_Obra = O.ID_Obra
where Data_Devolucao < '2012-03-29';
-- 8 - A Gerência solicitou uma pesquisa para saber quais obras existem no acervo que são diferentes dos títulos das obras ‘O Conde de Monte Cristo’ e ‘Filhos e Amantes’  .
select O.Titulo_Obra,
    O.Gênero,
    O.Data_Publicação
from dw_obra as O
WHERE Titulo_Obra <> 'O Conde de Monte Cristo'
    and Titulo_Obra <> 'Filhos e Amantes';
-- 9 - O Funcionário João Paulo solicitou uma pesquisa para saber quantas obras do gênero ‘Ficção’ existem no acervo.
select count(*) as 'Total Livros Ficção'
from dw_obra
where Gênero = 'Ficção';
-- 10 - A Diretoria solicitou uma pesquisa para identificar qual o livro possuiu a maior quantidade em estoque.
select O.Titulo_Obra as 'Titulo da Obra',
    E.Quantidade_Livro as 'Maior Quantidade em Estoque'
from dw_estoque as E
    inner join dw_obra O on E.ID_Obra = O.ID_Obra
ORDER BY Quantidade_Livro DESC
LIMIT 1;