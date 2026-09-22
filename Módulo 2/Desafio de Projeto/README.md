# Relatório Gerencial de Vendas com Power BI

Este repositório apresenta o desenvolvimento do **Desafio de Projeto da DIO (Digital Innovation One)**, realizado durante a formação **Power BI Analyst**.

O projeto utiliza a base de dados **Financial Sample** para construção de um relatório gerencial interativo, com foco na análise de **vendas, volume comercializado, custos e lucro**, utilizando diferentes recursos de visualização, segmentação, bookmarks e navegação entre páginas.

---

## 📌 Visão Geral

O relatório foi desenvolvido com o objetivo de transformar os dados da base *Financial Sample* em informações para análise do desempenho comercial e financeiro.

O dashboard está estruturado em **duas páginas**:

- **Página 1 — Sales Report:** visão geral do desempenho de vendas.
- **Página 2 — Profit Report:** análise detalhada do lucro.

O projeto também utiliza **bookmarks e botões de navegação**, permitindo alternar entre diferentes visualizações dentro da mesma página e navegar entre os relatórios.

---

## 🖼️ Páginas e Funcionalidades

### 1. Página Principal — Sales Report

A primeira página apresenta os principais indicadores de desempenho e permite analisar as vendas sob diferentes perspectivas: período, segmento, produto e localização geográfica.

#### Visão Padrão

Utiliza **gráfico de linha, gráfico de rosca e treemap** para apresentar diferentes dimensões das vendas.

![Sales Report - Visão Geral](https://github.com/LeticiaPaesano/power-bi-dashboard-sql/blob/main/M%C3%B3dulo%202/Desafio%20de%20Projeto/assets/pagina_1_sales_report.png)

#### Visão Alternativa

Por meio de bookmarks e botões, os visuais podem ser alternados para **gráfico de dispersão, gráfico de barras e mapa**.

![Sales Report - Bookmarks](https://github.com/LeticiaPaesano/power-bi-dashboard-sql/blob/main/M%C3%B3dulo%202/Desafio%20de%20Projeto/assets/dashboard_sales_report_alternate.png)

#### Principais elementos

- **Total de Vendas:** $118,73 Mi
- **Unidades Vendidas:** 1,13 Mi
- **Descontos:** $9,21 Mi
- **Lucro:** $16,89 Mi
- **COGS:** $101,83 Mi
- **Segmentador de Data:** permite filtrar o período analisado.
- **Vendas por período:** análise das vendas ao longo dos meses.
- **Vendas por Segmento:** comparação entre os segmentos de mercado.
- **Vendas por Produto:** comparação do desempenho dos produtos.
- **Vendas por País:** análise da distribuição geográfica das vendas.
- **Bookmarks:** permitem alternar entre diferentes tipos de visualização.
- **Botões de navegação:** permitem acessar a segunda página do relatório.

---

### 2. Página Secundária — Profit Report

A segunda página concentra a análise do **lucro**, permitindo observar sua distribuição por diferentes dimensões do negócio.

![Report de Lucro Detalhado](https://github.com/LeticiaPaesano/power-bi-dashboard-sql/blob/main/M%C3%B3dulo%202/Desafio%20de%20Projeto/assets/pagina_2_lucro_detalhado.png)

#### Principais elementos

- **Árvore de Decomposição:** análise do lucro por ano, país e segmento.
- **Radar:** comparação do lucro entre os diferentes produtos.
- **Treemap:** distribuição do lucro por segmento.
- **Waterfall:** análise do lucro por trimestre.
- **Segmentador de Ano:** permite selecionar o ano analisado.
- **Botão de navegação:** permite retornar à página principal.

---

## 📊 Análise dos Dados

### 1. Desempenho de Vendas

Os principais indicadores apresentados na Página 1 mostram:

| Indicador | Resultado |
|---|---:|
| **Vendas** | **$118,73 Mi** |
| **Unidades Vendidas** | **1,13 Mi** |
| **Descontos** | **$9,21 Mi** |
| **Lucro** | **$16,89 Mi** |
| **COGS** | **$101,83 Mi** |

Considerando os indicadores consolidados do relatório, o COGS corresponde a aproximadamente **85,8% das vendas**, enquanto o lucro representa aproximadamente **14,2% das vendas**.

### Vendas por Segmento

O segmento **Government** apresenta o maior volume de vendas, com aproximadamente **$52,5 Mi**, correspondendo a **44,22%** das vendas totais.

Na sequência aparece o segmento **Small Business**, com aproximadamente **$42,43 Mi**, equivalente a **35,74%**.

Os dois segmentos representam, juntos, aproximadamente **80% das vendas totais**.

### Vendas por Produto

Entre os produtos apresentados no relatório, destacam-se:

- **Paseo:** aproximadamente $33 Mi
- **VTT:** aproximadamente $21 Mi
- **Velo:** aproximadamente $18 Mi

O produto **Paseo** apresenta o maior volume de vendas entre os produtos analisados.

### Vendas por País

A distribuição geográfica demonstra maior participação dos **Estados Unidos**, seguidos por **Canadá** e **França** no volume de vendas apresentado no relatório.

### Evolução Temporal

A análise mensal das vendas evidencia maior concentração de vendas no **último trimestre**, com destaque para o crescimento observado no final do período analisado.

---

## 💰 Análise de Lucro

A Página 2 permite analisar o lucro sob diferentes perspectivas.

### Lucro por País

Na análise selecionada para **2014**, o lucro apresentado foi de aproximadamente **$13,01 Mi**.

Entre os países destacados na árvore de decomposição:

- **França:** $2,97 Mi
- **Canadá:** $2,73 Mi
- **Alemanha:** $2,56 Mi
- **Estados Unidos:** $2,44 Mi
- **México:** $2,31 Mi

A visualização permite aprofundar a análise do lucro partindo do ano e detalhando os resultados por país e segmento.

### Lucro por Produto

O gráfico de radar apresenta a distribuição do **Profit por produto**, permitindo comparar visualmente a contribuição de cada produto para o resultado.

Entre os produtos analisados, o **Paseo** apresenta a maior contribuição de lucro no visual.

### Lucro por Segmento

O Treemap permite comparar a participação de cada segmento no lucro total, facilitando a identificação dos segmentos com maior contribuição para o resultado.

### Evolução Trimestral do Lucro

O gráfico de cascata apresenta o lucro distribuído por trimestre:

| Trimestre | Lucro |
|---|---:|
| **Q1** | $2,6 Mi |
| **Q2** | $3,2 Mi |
| **Q3** | $2,7 Mi |
| **Q4** | $4,4 Mi |
| **Total** | **aprox. $13,0 Mi** |

No período analisado, o **Q4 apresenta a maior contribuição trimestral de lucro**.

---

## 🛠️ Tecnologias e Ferramentas

- **Power BI Desktop**
  - Modelagem e análise dos dados
  - Criação de visualizações
  - Medidas e agregações
  - Segmentadores
  - Bookmarks
  - Botões de navegação
  - Custom Visual de Radar

- **Microsoft Excel**
  - Base de dados `Financial Sample.xlsx`

- **GitHub**
  - Versionamento
  - Organização dos arquivos
  - Documentação do projeto

---

## 📂 Arquivos do Projeto

| Arquivo | Descrição |
|---|---|
| `Financial Sample.xlsx` | Base de dados utilizada no projeto |
| `Projeto_Dio_2.pbix` | Arquivo do relatório desenvolvido no Power BI |
| `assets/` | Imagens utilizadas na documentação do projeto |

---

## 🎯 Competências Demonstradas

Este projeto demonstra a aplicação prática de:

- Análise exploratória de dados;
- Construção de dashboards gerenciais;
- Análise de indicadores de vendas e lucro;
- Criação e utilização de KPIs;
- Segmentação e filtros de dados;
- Análise temporal;
- Análise por produto, segmento e país;
- Utilização de bookmarks;
- Navegação entre páginas;
- Construção de diferentes tipos de visualizações;
- Comunicação de informações por meio de dados.

---

## 🔗 Repositório de Origem

Projeto desenvolvido a partir do repositório da DIO:

[**julianazanelatto/power_bi_analyst**](https://github.com/julianazanelatto/power_bi_analyst)

Adaptado e desenvolvido por [**LeticiaPaesano**](https://github.com/LeticiaPaesano).
