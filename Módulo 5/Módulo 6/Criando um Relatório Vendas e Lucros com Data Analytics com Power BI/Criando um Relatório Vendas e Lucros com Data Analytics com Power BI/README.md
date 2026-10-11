# 📊 Relatório de Vendas e Lucros | Power BI

> Dashboard financeiro interativo desenvolvido como **Desafio de Projeto da DIO – Formação Power BI Analyst**, com foco em transformar dados transacionais em decisões de negócio.

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-Medidas-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Concluído-success?style=for-the-badge)

---

## 📌 Resumo Executivo

O projeto consolida a performance comercial e financeira da base `financials` em um relatório de 4 páginas, permitindo acompanhar **vendas, lucro, mix de produtos, segmentos e países** com filtros por período.

| Indicador | Valor |
|---|---|
| **Total de Vendas** | 118,73 Mi |
| **Unidades Vendidas** | 1,13 Mi |
| **Lucro Total** | 16,89 Mi |
| **Margem de Lucro (Lucro / Vendas)** | ≈ 14,2% |
| **Período analisado** | Set/2013 a Dez/2014 |

### Principais insights

- **Sazonalidade forte no 4º trimestre:** o Trim 4 concentra **51,69 Mi (~43,5%)** das vendas totais, com pico em outubro.
- **Crescimento ano contra ano (Trim 4):** vendas de 21,93 Mi (2013) para 29,76 Mi (2014), **+35,7%**; lucro de 3,11 Mi para 4,41 Mi, **+41,7%**. O lucro cresceu acima das vendas, indicando ganho de eficiência.
- **Concentração de portfólio:** *Paseo* lidera as vendas (~33 Mi), enquanto *Carretera* é o menor (~13,8 Mi). Há espaço para ações de mix e de precificação nos produtos de menor tração.
- **Lucro por país (2013):** Alemanha (1,12 Mi) lidera, seguida por França, Canadá, México e EUA. Os EUA têm o menor lucro entre os cinco países, o que merece investigação de custo e desconto.
- **Nota metodológica:** 2013 contém apenas Trim 3 e Trim 4, portanto comparações anuais totais devem ser feitas por trimestre equivalente.

---

## 🎯 Objetivos de Negócio

1. Monitorar a evolução de vendas e lucro ao longo do tempo.
2. Identificar produtos, segmentos e países mais rentáveis.
3. Comparar receita bruta (*Gross Sales*) e receita líquida (*Sales*) para avaliar o impacto de descontos.
4. Disponibilizar navegação simples e intuitiva para usuários de negócio.

---

## 🗂️ Estrutura do Relatório

### 1️⃣ Home Page
<img width="797" height="440" alt="Home Page" src="https://github.com/user-attachments/assets/3b65dd3e-75ff-4127-b8a0-628c934b1263" />

Capa do relatório com botão **"Explorar Análise"** que direciona à navegação principal.

### 2️⃣ Sales (Vendas)
<img width="773" height="422" alt="Sales (Vendas)" src="https://github.com/user-attachments/assets/bd5787ce-815d-42a4-9760-84b300b7589d" />

- Cartões (KPIs): **Total de Vendas** e **Unidades Vendidas**
- Segmentação de datas (período de análise)
- Gráfico de barras **Vendas x Produto**
- Gráfico de área **Vendas por Período** (mensal)
- Matriz de vendas por **Trimestre x Ano**
- Botões de **Visão Segmento** e **Visão Produto** (alternância via indicadores/bookmarks)

### 3️⃣ Profit (Lucro)
<img width="747" height="409" alt="Profit (Lucro)" src="https://github.com/user-attachments/assets/fcf9ff8b-ea4b-4136-be19-e011d7331225" />

- Segmentação por ano (2013 / 2014)
- **Árvore de decomposição** (Lucro > Ano > País)
- Gráfico de dispersão **Lucro por Segmento e Produto**
- Gráfico de cascata **Lucro por Trimestre** (aumento, diminuição e total)

### 4️⃣ Report (Vendas Detalhado)
<img width="776" height="419" alt="Report (Vendas Detalhado)" src="https://github.com/user-attachments/assets/bcf0533e-39ca-485a-85dd-2638896e2c22" />

- **Vendas por Período**: Sales vs. Profit
- **Vendas x Gross Sales** por mês
- Matriz de **Lucro por Trimestre x Ano**

---

## 🧱 Modelo de Dados

**Tabela fato:** `financials`

| Coluna | Descrição |
|---|---|
| `Segment` | Segmento de cliente (Channel Partners, Enterprise, Government, Midmarket, Small Business) |
| `Country` | País da venda |
| `Product` | Produto (Amarilla, Carretera, Montana, Paseo, Velo, VTT) |
| `Discount Band` | Faixa de desconto |
| `Units Sold` | Unidades vendidas |
| `Manufacturing Price` | Preço de fabricação |
| `Sale Price` | Preço de venda |
| `Gross Sales` | Receita bruta |
| `Discounts` | Descontos concedidos |
| `Sales` | Receita líquida |
| `COGS` | Custo dos produtos vendidos |
| `Profit` | Lucro |
| `Date`, `Month Number`, `Month Name`, `Year` | Dimensões de tempo |

---

## 🛠️ Tecnologias e Recursos

- **Power BI Desktop** (modelagem, DAX e visualização)
- **Power Query** (tratamento e transformação dos dados)
- **Recursos visuais:** cartões, matriz, área, barras, dispersão, cascata, árvore de decomposição
- **Interatividade:** segmentações (slicers), botões de navegação, indicadores (bookmarks) e limpeza de filtros
- **Design:** layout padronizado com menu lateral de navegação entre páginas

---

📌 *Projeto desenvolvido para fins educacionais no bootcamp da [DIO](https://www.dio.me/).*
