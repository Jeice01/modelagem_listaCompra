# Modelo de Dados para Lista de Compras Pessoal

## Introdução

Este repositório contém um modelo de dados para uma lista de compras pessoal. O objetivo deste projeto é fornecer uma estrutura sólida e flexível para gerenciar e organizar itens de compras de forma eficiente.
Para fazer a consulta da modelagem: https://dbdiagram.io/d/Compras-Supermercado-652be7e4ffbf5169f0b62d5e

## Estrutura do Banco de Dados

O banco de dados é composto por duas tabelas principais: `produtos` e `lista_compras`.

### Tabela `produtos`

A tabela `produtos` armazena informações sobre os produtos disponíveis para compra. Cada registro na tabela possui os seguintes campos:

- `id` (chave primária): Identificador único do produto.
- `nome`: Nome do produto.
- `categoria`: Categoria à qual o produto pertence (ex: alimentos, produtos de higiene, etc.).
- `preco`: Preço do produto.

### Tabela `lista_compras`

A tabela `lista_compras` registra os itens incluídos em uma lista de compras específica. Cada registro possui os seguintes campos:

- `id` (chave primária): Identificador único da lista de compras.
- `produto_id` (chave estrangeira referenciando `produtos.id`): Identifica o produto associado à lista de compras.
- `quantidade`: A quantidade desejada do produto na lista.
- `comprado`: Indica se o item foi comprado (1 para sim, 0 para não).

## Funcionalidades

O modelo de dados permite as seguintes funcionalidades:

1. Adicionar, remover e atualizar produtos na lista de compras.
2. Marcar produtos como comprados ou não comprados.
3. Visualizar a lista de compras atualizada com status de compra.

## Uso

Para utilizar este modelo de dados em seu projeto, siga os passos abaixo:

1. Clone este repositório para o seu ambiente local.
2. Importe o banco de dados no seu sistema de gerenciamento de banco de dados preferido.
3. Utilize as consultas SQL fornecidas para interagir com o banco de dados e gerenciar suas listas de compras.

## Exemplo de Consultas

Aqui estão alguns exemplos de consultas que você pode executar:

```sql
-- Atualização do tipo de dados para cons_Email
ALTER TABLE "Consumidor" ALTER COLUMN "cons_Email" TYPE varchar(255);

-- Atualização do email do consumidor
UPDATE "Consumidor"
SET "cons_Email" = 'meuemail@gmail.com'
WHERE "cons_ID" = 1;

-- Inicialização da sequência para supe_ID
CREATE SEQUENCE supermercado_supe_id_seq START 1;
ALTER TABLE "Supermercado" ALTER COLUMN "supe_ID" SET DEFAULT nextval('supermercado_supe_id_seq');
```

## Conclusão

Esperamos que este modelo de dados seja útil para gerenciar suas listas de compras pessoais de forma eficaz. Sinta-se à vontade para contribuir com melhorias ou entrar em contato em caso de dúvidas.

**Equipe do Repositório de Lista de Compras**
