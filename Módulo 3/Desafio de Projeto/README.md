# Integrando Dados com MySQL e Transformando com Power BI

## 📌 Resumo Executivo

Este projeto implementa um pipeline completo de engenharia de dados: provisionamento de um banco relacional (schema `Company`), integração com Power BI, e um processo estruturado de limpeza, transformação e modelagem, seguindo as diretrizes da Formação Power BI Analyst (DIO). O modelo final está pronto para servir de base a um esquema estrela em módulos futuros.

## ⚠️ Nota Técnica — Adaptação de Ambiente

**Nota técnica:** o schema mantém o nome `azure_company` por herança do script original do desafio. Devido à ausência de conta corporativa Azure, o ambiente foi provisionado localmente via MySQL Community Server — a arquitetura relacional, queries e transformações são idênticas às exigidas para o ambiente cloud original.

A conexão entre Power BI e MySQL local foi feita via **driver ODBC** (MySQL Connector/ODBC), após identificar incompatibilidade de negociação TLS 1.3 entre o MySQL 8 e o conector nativo `.NET` do Power BI.

## 📂 Arquivos deste Diretório

| Arquivo | Descrição |
|---|---|
| [`script_bd_company.sql`](./script_bd_company.sql) | DDL completo: schema, tabelas, constraints, chaves primárias/estrangeiras |
| [`insercao_de_dados_e_queries_sql.sql`]([[./insercao_de_dados_e_queries_sql.sql](https://github.com/LeticiaPaesano/power-bi-dashboard-vendas/blob/main/M%C3%B3dulo%203/Desafio%20de%20Projeto/insercao_de_dados_e_queries.sql)](https://raw.githubusercontent.com/LeticiaPaesano/power-bi-dashboard-vendas/refs/heads/main/M%C3%B3dulo%203/Desafio%20de%20Projeto/insercao_de_dados_e_queries.sql)) | Carga de dados (INSERT) e queries de validação |
| [`desenvolvimento_power_bi_company_local.pbix`](./desenvolvimento_power_bi_company_local.pbix) | Modelo Power BI completo: transformações no Power Query e relacionamentos |

## 🖼️ Modelo de Dados Final

![Modelo final](https://github.com/user-attachments/assets/97b033df-ffd2-4552-bb95-a27292508bb9)

*Modelo relacional com 7 tabelas: `employee`, `departament`, `dept_locations`, `project`, `works_on`, `dependent` e a tabela agregada `Managers_Headcount`, com 6 relacionamentos configurados (5 ativos, 1 inativo por resolução de ambiguidade de caminho).*

## ✅ Diretrizes Aplicadas

| # | Diretriz | Status | Como foi feito |
|---|---|---|---|
| 1 | Verificar cabeçalhos e tipos de dados | ✅ | Revisão manual de tipo em todas as 6 tabelas no Power Query |
| 2 | Valores monetários em tipo preciso | ✅ | Ver seção "Decisões Técnicas" — usamos Decimal Fixo |
| 3 | Verificar nulos e analisar remoção | ✅ | `Super_ssn` analisado: nulo estrutural (não removido) |
| 4 | Colaborador sem gerente | ✅ | Confirmado: apenas James Borg (presidente) |
| 5 | Departamento sem gerente | ✅ | Confirmado: nenhum caso (0 linhas no filtro) |
| 6 | Preencher lacunas se houvesse depto sem gerente | ➖ | Não se aplicou — nenhum caso identificado |
| 7 | Verificar número de horas dos projetos | ✅ | Validado; sem horas negativas ou inconsistentes |
| 8 | Separar colunas complexas | ✅ | `Address` dividido em 4 partes; 1 anomalia corrigida (ver abaixo) |
| 9 | Merge employee + departament (base employee) | ✅ | Left Join; colunas desnecessárias eliminadas |
| 10 | Junção colaborador + gerente (com query SQL documentada) | ✅ | Feito no Power Query (self-join) e via SQL (ver abaixo) |
| 11 | Mesclar Nome + Sobrenome | ✅ | Coluna `Full_Name` |
| 12 | Mesclar Departamento + Localização | ✅ | Coluna `Dept_Location_Key` |
| 13 | Explicar Mesclar vs. Atribuir | ✅ | Ver seção "Decisões Técnicas" |
| 14 | Agrupar colaboradores por gerente | ✅ | Tabela `Managers_Headcount` |
| 15 | Eliminar colunas desnecessárias de cada tabela | ✅ | Aplicado nas 6 tabelas via "Escolher Colunas" |

## 🔧 Decisões Técnicas

### Referência circular em `employee.Super_ssn`

| Aspecto | Detalhe |
|---|---|
| Problema | FK autorreferenciada (`Super_ssn → Ssn`) causa erro de violação na carga inicial, pois o MySQL valida linha a linha |
| Solução | `SET FOREIGN_KEY_CHECKS = 0` antes do INSERT, `= 1` logo depois |
| Justificativa | Técnica padrão para *seed data* com dependências circulares (usada por ferramentas como Flyway e Liquibase) |

### Tipo de dado para valores monetários

| Aspecto | Detalhe |
|---|---|
| Diretriz original | Converter `Salary` para tipo `double` |
| Decisão tomada | Usamos **Decimal Fixo (Fixed Decimal Number)** em vez de `Double` |
| Justificativa | `Double` usa ponto flutuante binário, que pode introduzir erros de arredondamento em somas e agregações financeiras (ex.: `0.1 + 0.2 ≠ 0.3`). `Decimal Fixo` evita esse problema, sendo a prática recomendada para campos monetários |

### Anomalia de dados no endereço

| Aspecto | Detalhe |
|---|---|
| Registro afetado | Ramesh Narayan — `975-Fire-Oak-Humble-TX` |
| Problema | 5 segmentos separados por hífen, em vez do padrão de 4 (`Número-Bairro-Cidade-UF`), pois o nome do bairro contém hífen interno |
| Correção | Lógica condicional no Power Query, reconstruindo `Neighborhood = "Fire Oak"`, `City = "Humble"`, `State = "TX"` |

### Por que "Mesclar" e não "Atribuir" (Merge vs. Append)

| Operação | O que faz | Equivalente SQL |
|---|---|---|
| **Mesclar (Merge)** | Combina tabelas horizontalmente: casa linhas por chave comum e traz colunas adicionais | `JOIN` |
| **Atribuir/Anexar (Append)** | Empilha tabelas verticalmente (união de linhas), exige mesma estrutura de colunas | `UNION` |

Como o objetivo era **adicionar a coluna `Dname`** à tabela `dept_locations` (enriquecer com uma coluna nova, não duplicar registros), a operação correta é necessariamente o **Mesclar**. "Atribuir" geraria uma união estrutural incorreta, pois as tabelas têm esquemas distintos e a intenção era relacionar os dados, não empilhá-los como linhas separadas.

### Relacionamento `works_on → employee` inativo

| Aspecto | Detalhe |
|---|---|
| Problema | Caminho ambíguo entre `works_on` e `departament` (via `employee` e via `project` simultaneamente) |
| Solução | Relacionamento `works_on.Essn → employee.Ssn` mantido **inativo** por padrão |
| Uso futuro | Ativação pontual via `USERELATIONSHIP()` em medidas DAX específicas, quando necessário |

## 🔍 Query SQL — Junção Colaborador → Gerente

```sql
SELECT
  e.Ssn,
  CONCAT(e.Fname, ' ', e.Lname) AS Employee_Name,
  CONCAT(m.Fname, ' ', m.Lname) AS Manager_Name
FROM employee e
LEFT JOIN employee m ON e.Super_ssn = m.Ssn;
```

*(Implementada também no Power Query via self-join, usando uma consulta de referência (`employee_lookup`) para evitar erro de referência circular do próprio Power Query.)*

## 🔗 Repositório de Origem

Fork de [julianazanelatto/power_bi_analyst](https://github.com/julianazanelatto/power_bi_analyst), adaptado e desenvolvido por [LeticiaPaesano](https://github.com/LeticiaPaesano).
