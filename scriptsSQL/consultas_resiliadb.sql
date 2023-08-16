#Selecionar a quantidade total de estudantes cadastrados no banco;
SELECT COUNT(E.id_estudante)
FROM Estudantes E;

#Selecionar quais pessoas facilitadoras atuam em mais de uma turma;
SELECT Pessoas_facilitadoras.nome, COUNT(Facilitadores_turma.id_turma_fk) AS numero_de_turmas
FROM Pessoas_facilitadoras 
INNER JOIN Facilitadores_turma ON Pessoas_facilitadoras.id_pessoa_facilitadora = Facilitadores_turma.id_pessoa_facilitadora_fk OR Pessoas_facilitadoras.id_pessoa_facilitadora = Facilitadores_turma.id_pessoa_facilitadora2_fk
GROUP BY Pessoas_facilitadoras.nome
HAVING numero_de_turmas > 1;

#Quem são os alunos com mais de 15% de evasao agrupados por turma
SELECT Estudante_curso.id_turma_fk, Estudantes.nome, Estudante_curso.evasao
FROM Estudante_curso
INNER JOIN Estudantes ON Estudante_curso.id_estudante_fk = Estudantes.id_estudante
WHERE Estudante_curso.evasao > 15
ORDER BY Estudante_curso.evasao;

#Quais são os módulos agrupados por curso
SELECT Cursos.nome AS Curso, Modulos.tema AS Modulo
FROM Cursos
JOIN Curso_modulos ON Cursos.id_curso = Curso_modulos.id_cursos_fk
JOIN Modulos ON Curso_modulos.id_modulos_fk = Modulos.id_modulos
ORDER BY Modulos.tema, Cursos.nome; 

#Quantos estudantes com o status "ativo" tem em cada curso agrupados por periodo
SELECT Cursos.nome as Curso, Turmas.periodo_aulas as periodo, COUNT(Estudantes.id_estudante) AS estudantes_ativos
FROM Cursos
INNER JOIN Turmas ON Cursos.id_curso = Turmas.id_curso_fk
INNER JOIN Estudantes ON Turmas.id_turma = Estudantes.id_turma_fk
WHERE Estudantes.status = 'Ativo'
GROUP BY Cursos.nome, Turmas.periodo_aulas;