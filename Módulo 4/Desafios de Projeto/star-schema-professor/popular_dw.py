"""
Carga de dados fictícios para o star schema universidade_dw.

Pré-requisitos:
  - Banco universidade_dw criado (schema.sql)
  - pip install mysql-connector-python
  - Credenciais de acesso configuradas no arquivo de opções do cliente MySQL
"""
import os
import random
from datetime import date, timedelta
import mysql.connector

random.seed(42)

conn = mysql.connector.connect(
    option_files=os.path.expanduser("~/.my.cnf"),
    database="universidade_dw",
)
cur = conn.cursor()

# Limpeza (desativa FKs temporariamente para permitir o TRUNCATE)
cur.execute("SET FOREIGN_KEY_CHECKS = 0")
for t in ["f_oferta_professor", "d_professor", "d_departamento",
          "d_curso", "d_disciplina", "d_date"]:
    cur.execute(f"TRUNCATE TABLE {t}")
cur.execute("SET FOREIGN_KEY_CHECKS = 1")

# ---------- d_date ----------
MESES = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho",
         "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]
datas = []
d = date(2024, 1, 1)
while d <= date(2026, 12, 31):
    sem = 1 if d.month <= 6 else 2
    datas.append((int(d.strftime("%Y%m%d")), d, d.day, d.month,
                  MESES[d.month - 1], (d.month - 1) // 3 + 1, sem,
                  d.year, f"{d.year}-{sem}"))
    d += timedelta(days=1)
cur.executemany("INSERT INTO d_date VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)", datas)

# ---------- d_departamento ----------
deptos = [(1, "Computação", "Campus Central"), (2, "Matemática", "Campus Central"),
          (3, "Administração", "Campus Norte"), (4, "Engenharia", "Campus Norte")]
cur.executemany(
    "INSERT INTO d_departamento (departamento_id, nome, campus) VALUES (%s,%s,%s)",
    deptos)

# ---------- d_professor (SCD Tipo 2: Carla muda de titulação) ----------
profs = [
    (1, "Ana Souza", "Doutora", "40h", "Y", date(2018, 3, 1), None),
    (2, "Bruno Lima", "Mestre", "20h", "Y", date(2019, 8, 1), None),
    (3, "Carla Dias", "Mestre", "40h", "N", date(2017, 2, 1), date(2024, 12, 31)),
    (3, "Carla Dias", "Doutora", "40h", "Y", date(2025, 1, 1), None),
    (4, "Diego Alves", "Doutor", "Dedicação Exclusiva", "Y", date(2015, 5, 1), None),
    (5, "Elisa Nunes", "Mestre", "20h", "Y", date(2021, 1, 1), None),
]
cur.executemany(
    """INSERT INTO d_professor (professor_id, nome, titulacao, regime_trabalho,
       professor_atual, start_date, end_date) VALUES (%s,%s,%s,%s,%s,%s,%s)""",
    profs)

# ---------- d_curso ----------
cursos = [(1, "Ciência da Computação", "Graduação", "Presencial"),
          (2, "Sistemas de Informação", "Graduação", "Presencial"),
          (3, "Administração", "Graduação", "EAD"),
          (4, "Engenharia Civil", "Graduação", "Presencial")]
cur.executemany(
    "INSERT INTO d_curso (curso_id, nome_curso, nivel, modalidade) VALUES (%s,%s,%s,%s)",
    cursos)

# ---------- d_disciplina ----------
discs = [(1, "Banco de Dados", "Obrigatória", 60), (2, "Algoritmos", "Obrigatória", 80),
         (3, "Cálculo I", "Obrigatória", 80), (4, "Estatística", "Obrigatória", 60),
         (5, "Gestão de Projetos", "Optativa", 40), (6, "Estruturas", "Obrigatória", 80)]
cur.executemany(
    """INSERT INTO d_disciplina (disciplina_id, nome_disciplina, tipo,
       carga_horaria_padrao) VALUES (%s,%s,%s,%s)""", discs)

# ---------- f_oferta_professor ----------
# id_professor -> id_departamento (3 e 4 = Carla, duas versões)
prof_depto = {1: 1, 2: 2, 3: 1, 4: 1, 5: 4, 6: 3}
semestres = [(2024, 1), (2024, 2), (2025, 1), (2025, 2), (2026, 1)]
ofertas = []
for ano, sem in semestres:
    data_oferta = int(f"{ano}{'02' if sem == 1 else '08'}01")
    for _ in range(8):
        id_prof = random.choice([1, 2, 3 if ano == 2024 else 4, 5, 6])
        depto = prof_depto[id_prof]
        disc = random.randint(1, 6)
        curso = random.randint(1, 4)
        ch = discs[disc - 1][3]
        alunos = random.randint(15, 60)
        prereq = random.randint(0, 3)
        coord = "Y" if id_prof in (1, 5) else "N"
        ofertas.append((ch, alunos, prereq, coord, id_prof, depto,
                        curso, disc, data_oferta))
cur.executemany(
    """INSERT INTO f_oferta_professor (carga_horaria, qtd_alunos, qtd_prerequisitos,
       eh_coordenador, id_professor, id_departamento, id_curso, id_disciplina, id_date)
       VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)""", ofertas)

conn.commit()
cur.close()
conn.close()
print("Carga concluída.")
