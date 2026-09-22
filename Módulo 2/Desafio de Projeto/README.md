# Relatório Gerencial de Vendas com Power BI

Este repositório contém o desenvolvimento do desafio de projeto da **DIO (Digital Innovation One)**, com foco na criação de um relatório gerencial e interativo no Power BI utilizando o conjunto de dados *Financials*.

---

## 📌 Visão Geral do Relatório

O objetivo principal do relatório é permitir a análise detalhada do desempenho de vendas, lucros e volume comercializado, oferecendo visões dinâmicas através de indicadores (bookmarks) e botões de navegação.

---

## 🖼️ Páginas e Funcionalidades

### 1. Página Principal — Sales Report

A primeira página apresenta os principais indicadores operacionais (KPIs) e permite a alternância entre diferentes tipos de gráficos para analisar vendas por período, segmento, produto e localização geográfica.

* **Visão Padrão (Gráfico de Linha, Rosca e Treemap):**
  ![Sales Report - Visão Geral](https://github.com/LeticiaPaesano/power-bi-dashboard-sql/blob/main/M%C3%B3dulo%202/Desafio%20de%20Projeto/assets/pagina_1_sales_report.png)

* **Visão Alternativa (Gráfico de Dispersão, Barras e Mapa):**
![Sales Report - Bookmarks](https://github.com/LeticiaPaesano/power-bi-dashboard-sql/blob/main/M%C3%B3dulo%202/Desafio%20de%20Projeto/assets/dashboard_sales_report_alternate.png)

> **Destaques da Página 1:**
> - **Indicadores (KPIs):** Total de Vendas, Unidades Vendidas, Soma de Descontos, Soma de Lucro e COGS.
> - **Filtro de Data:** Segmentador no topo para seleção de intervalo temporal.
> - **Bookmarks/Botões:** Permitem alternar os visuais na mesma tela (ex.: trocar Gráfico de Linha por Dispersão, Rosca por Barras e Treemap por Mapa).

---

### 2. Página Secundária — Report de Lucro Detalhado

A segunda página do relatório é dedicada à análise aprofundada da margem de lucro por diferentes dimensões do negócio.

* **Visão Detalhada do Lucro:**
![Report de Lucro Detalhado](https://github.com/LeticiaPaesano/power-bi-dashboard-sql/blob/main/M%C3%B3dulo%202/Desafio%20de%20Projeto/assets/pagina_2_lucro_detalhado.png)

> **Destaques da Página 2:**
> - **Árvore de Decomposição:** Permite decompor o lucro por país e ano.
> - **Gráfico de Radar:** Distribuição do lucro por produto.
> - **Treemap:** Lucro categorizado por segmento de mercado.
> - **Gráfico de Cascata (Waterfall):** Variação e evolução do lucro ao longo dos trimestres do ano.
> - **Navegação:** Botão no canto inferior esquerdo para retornar à página principal.

---

## 📊 Leitura Profissional e Diagnóstico de Negócio

### 1. Desempenho Geral de Vendas (Sales Report)
* **Volume Comercializado e Receita:** O volume total bruto atingiu **$118,73 Mi**, com um volume físico de **1,13 Mi de unidades vendidas**.
* **Margem Bruta Operacional:** O COGS (Custo das Mercadorias Vendidas) representou **$101,83 Mi** (~85,7% da receita bruta). Após a concessão de **$9,21 Mi em descontos**, o lucro líquido consolidado encerrou em **$16,89 Mi**, resultando em uma margem de lucro líquida sobre as vendas de aproximadamente **14,2%**.
* **Sazonalidade e Tendência:** A análise do gráfico temporal revela uma forte concentração de receita no **último trimestre do ano (Q4)**, apresentando pico expressivo em **outubro (~$20 Mi)** e manutenção em níveis elevados até dezembro. Os primeiros três trimestres mantiveram-se estáveis e em patamares substancialmente menores.
* **Concentração por Segmento:** O segmento **Government** é o principal *driver* de receita do negócio, respondendo por **$52,5 Mi (44,22%)** das vendas totais, seguido por **Small Business ($42,43 Mi / 35,74%)**. Juntos, esses dois segmentos dominam cerca de **80% de todo o volume comercial**.
* **Performance de Produtos:** O produto **Paseo** lidera isoladamente as vendas com **$33 Mi**, seguido por **VTT ($21 Mi)** e **Velo ($18 Mi)**.
* **Distribuição Geográfica:** O mercado dos **Estados Unidos** lidera em volume de receita, seguido por **Canadá** e **França**, demonstrando a relevância do mercado norte-americano na composição global das vendas.

---

### 2. Análise Detalhada de Lucratividade (Profit Report)
* **Distribuição Geográfica do Lucro (Árvore de Decomposição):** No exercício de 2014, dos **$13,01 Mi** de lucro apurados:
  - **França** liderou a contribuição com **$2,97 Mi** (~22,8%).
  - **Canadá** ficou em segundo com **$2,73 Mi** (~21,0%).
  - **Alemanha** (**$2,56 Mi**), **EUA** (**$2,44 Mi**) e **México** (**$2,31 Mi**) apresentaram contribuições equilibradas.
* **Eficiência do Lucro por Produto (Radar):** Embora o produto **Paseo** lidere em vendas absolutas, a análise do gráfico de radar indica que a sua margem de contribuição para o lucro também é predominante, mantendo correlação direta entre volume de vendas e rentabilidade.
* **Evolução Trimestral do Lucro (Gráfico de Cascata / Waterfall):** O acumulado do lucro teve sua maior aceleração no segundo semestre:
  - **Q1:** $2,6 Mi
  - **Q2:** $3,2 Mi
  - **Q3:** $2,7 Mi
  - **Q4:** **$4,4 Mi** (maior salto incremental do ano)
  - **Total Acumulado:** **$13,0 Mi** no período analisado.

  ---
  
## 🛠️ Tecnologias e Ferramentas Utilizadas

- **Power BI Desktop:** Construção do modelo de dados, métricas DAX, criação do layout e bookmarks.
- **Excel (`Financial Sample.xlsx`):** Base de dados relacional.
- **GitHub:** Versionamento e documentação do projeto.

---

## 🔗 Repositório de Origem

Fork de [julianazanelatto/power_bi_analyst](https://github.com/julianazanelatto/power_bi_analyst), adaptado e desenvolvido por [LeticiaPaesano](https://github.com/LeticiaPaesano).
