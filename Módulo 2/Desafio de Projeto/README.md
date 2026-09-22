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

## 🛠️ Tecnologias e Ferramentas Utilizadas

- **Power BI Desktop:** Construção do modelo de dados, métricas DAX, criação do layout e bookmarks.
- **Excel (`Financial Sample.xlsx`):** Base de dados relacional.
- **GitHub:** Versionamento e documentação do projeto.

---

## 🔗 Repositório de Origem

Fork de [julianazanelatto/power_bi_analyst](https://github.com/julianazanelatto/power_bi_analyst), adaptado e desenvolvido por [LeticiaPaesano](https://github.com/LeticiaPaesano).
