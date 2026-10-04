USE universidade_dw;

-- 1. Carga horária e alunos por professor e departamento
SELECT p.nome, d.nome AS departamento,
       SUM(f.carga_horaria) AS horas_totais,
       SUM(f.qtd_alunos)    AS alunos_atendidos
FROM f_oferta_professor f
JOIN d_professor p    ON p.id_professor = f.id_professor
JOIN d_departamento d ON d.id_departamento = f.id_departamento
GROUP BY p.nome, d.nome
ORDER BY horas_totais DESC;

-- 2. Alunos por curso e professor
SELECT c.nome_curso, p.nome, SUM(f.qtd_alunos) AS alunos
FROM f_oferta_professor f
JOIN d_curso c     ON c.id_curso = f.id_curso
JOIN d_professor p ON p.id_professor = f.id_professor
GROUP BY c.nome_curso, p.nome
ORDER BY c.nome_curso, alunos DESC;

-- 3. Horas por departamento
SELECT d.nome, SUM(f.carga_horaria) AS horas
FROM f_oferta_professor f
JOIN d_departamento d ON d.id_departamento = f.id_departamento
GROUP BY d.nome
ORDER BY horas DESC;

-- 4. Evolução por semestre
SELECT dt.ano_semestre,
       SUM(f.carga_horaria) AS horas,
       SUM(f.qtd_alunos)    AS alunos,
       COUNT(DISTINCT p.professor_id) AS professores_ativos
FROM f_oferta_professor f
JOIN d_date dt     ON dt.id_date = f.id_date
JOIN d_professor p ON p.id_professor = f.id_professor
GROUP BY dt.ano_semestre
ORDER BY dt.ano_semestre;

-- 5. Histórico da SCD Tipo 2
SELECT professor_id, nome, titulacao, professor_atual, start_date, end_date
FROM d_professor
WHERE professor_id IN (SELECT professor_id FROM d_professor
                       GROUP BY professor_id HAVING COUNT(*) > 1)
ORDER BY professor_id, start_date;
