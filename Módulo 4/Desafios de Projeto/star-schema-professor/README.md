# Star Schema: Análise de Professores (Universidade)

Desafio de modelagem dimensional: transformar o diagrama relacional "Universidade" em um **star schema** com foco na análise de **professores** (departamentos, cursos ministrados, carga horária e alunos atendidos).

## Modelo dimensional

![Star Schema](https://raw.githubusercontent.com/LeticiaPaesano/power-bi-dashboard-sql/main/M%C3%B3dulo%204/Desafios%20de%20Projeto/star-schema-professor/star_schema.png)

| Tabela | Tipo | Descrição |
|---|---|---|
| `f_oferta_professor` | Fato | Oferta de uma disciplina por professor, em um curso, em uma data |
| `d_professor` | Dimensão | SCD Tipo 2 (`start_date`, `end_date`, `professor_atual`) |
| `d_departamento` | Dimensão | Departamento e campus |
| `d_curso` | Dimensão | Curso, nível e modalidade |
| `d_disciplina` | Dimensão | Disciplina, tipo e carga horária padrão |
| `d_date` | Dimensão | Calendário: dia, mês, trimestre, semestre, ano e `ano_semestre` |

**Grão:** uma linha por professor, em cada disciplina ofertada para um curso em uma data.

**Métricas:** `carga_horaria`, `qtd_alunos`, `qtd_prerequisitos` e a flag `eh_coordenador`.

## Decisões de projeto

- O diagrama relacional só contém chaves; atributos como nome, titulação, nível e modalidade foram **supostos**, como o enunciado autoriza.
- Dados de alunos ficam fora do modelo: a tabela `Matriculado` vira apenas a métrica `qtd_alunos`.
- `id_departamento` está na fato para registrar o departamento vigente na oferta, mantendo o star schema puro (sem snowflake).
- `d_professor` usa SCD Tipo 2: mudança de titulação gera nova linha e preserva o histórico.
- `d_date` usa chave `AAAAMMDD` e a data de oferta como referência.

## Limitação conhecida

O relacional liga aluno à disciplina, não ao curso. Em dados reais, somar `qtd_alunos` por professor pode duplicar a contagem quando uma disciplina atende mais de um curso. Opções: ratear o valor entre os cursos ou analisar alunos por disciplina.

## Resultados (dados fictícios)

![Resultado da Consulta 1](https://github.com/LeticiaPaesano/power-bi-dashboard-sql/blob/main/M%C3%B3dulo%204/Desafios%20de%20Projeto/star-schema-professor/consultas/print_consulta1.png?raw=true)

![Resultado da Consulta 2](https://github.com/LeticiaPaesano/power-bi-dashboard-sql/blob/main/M%C3%B3dulo%204/Desafios%20de%20Projeto/star-schema-professor/consultas/print_consulta2.png?raw=true)

![Resultado da Consulta 3](https://github.com/LeticiaPaesano/power-bi-dashboard-sql/blob/main/M%C3%B3dulo%204/Desafios%20de%20Projeto/star-schema-professor/consultas/print_consulta3.png?raw=true)

![Resultado da Consulta 4](https://github.com/LeticiaPaesano/power-bi-dashboard-sql/blob/main/M%C3%B3dulo%204/Desafios%20de%20Projeto/star-schema-professor/consultas/print_consulta4.png?raw=true)

![Resultado da Consulta 5](https://github.com/LeticiaPaesano/power-bi-dashboard-sql/blob/main/M%C3%B3dulo%204/Desafios%20de%20Projeto/star-schema-professor/consultas/print_consulta5.png?raw=true)

Verificação de consistência: o total é de **2.700 horas** e **1.471 alunos** em todas as visões (por professor, departamento e semestre).

Os dados são aleatórios (`random.seed(42)`) e servem apenas para validar que o modelo responde às perguntas do desafio.

## Arquivos

| Arquivo | Descrição |
|---|---|
| `desafio_professor.mwb` / `schema.sql.mwb` | Modelo do MySQL Workbench (baixe e abra com File → Open Model) |
| `schema.sql` | DDL do banco de dados |
| `popular_dw.py` | Carga de dados fictícios |
| `consultas/consultas.sql` | Consultas analíticas |
| `consultas/print_consulta*.png` | Prints dos resultados das consultas |
| `consulta*.csv` | Resultados exportados em CSV |
| `star_schema.png` | Diagrama do star schema |

## Como reproduzir

1. Execute `schema.sql` no MySQL (ou use o Forward Engineer do `.mwb`).
2. Rode `popular_dw.py` para carregar os dados fictícios (requer `pip install mysql-connector-python`).
3. Execute as consultas de `consultas/consultas.sql`.
