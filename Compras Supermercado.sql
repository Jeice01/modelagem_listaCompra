CREATE TABLE "Supermercado" (
  "supe_ID" integer PRIMARY KEY,
  "supe_CNPJ" varchar(14),
  "supe_RazaoSocial" varchar(60),
  "supe_Endereco" varchar(60),
  "supe_Municipio" varchar(60),
  "supe_UF" char(2),
  "supe_CEP" char(8),
  "supe_Email" char(8),
  "supe_Telefone" varchar(11)
);



CREATE TABLE "Produto" (
  "prod_ID" integer PRIMARY KEY,
  "prod_Descricao" varchar(60),
  "prod_Categoria" int,
  "prod_Valor" money
);



CREATE TABLE "Categoria" (
  "cate_ID" integer PRIMARY KEY,
  "cate_Descricao" varchar(60)
);


CREATE TABLE "Consumidor" (
  "cons_ID" integer PRIMARY KEY,
  "cons_Nome" varchar(60),
  "cons_CPF" char(11),
  "cons_DataNascimento" date,
  "cons_Endereco" varchar(60),
  "cons_Municipio" varchar(60),
  "cons_UF" char(2),
  "cons_CEP" char(8),
  "cons_Email" char(8),
  "cons_Telefone" varchar(11)
);


CREATE TABLE "Compra" (
  "comp_ID" integer PRIMARY KEY,
  "supe_ID" integer,
  "cons_ID" integer,
  "comp_Data" date,
  "comp_ValorTotal" money
);



CREATE TABLE "DetalheCompra" (
  "detalhe_ID" serial PRIMARY KEY,
  "comp_ID" integer,
  "prod_ID" integer,
  "comp_Quantidade" int,
  "comp_ValorUnitario" int,
  FOREIGN KEY ("prod_ID") REFERENCES "Produto" ("prod_ID")
);


ALTER TABLE "Produto" ADD FOREIGN KEY ("prod_Categoria") REFERENCES "Categoria" ("cate_ID");

ALTER TABLE "DetalheCompra" ADD FOREIGN KEY ("comp_ID") REFERENCES "Compra" ("comp_ID");

ALTER TABLE "Compra" ADD FOREIGN KEY ("supe_ID") REFERENCES "Supermercado" ("supe_ID");

ALTER TABLE "Compra" ADD FOREIGN KEY ("cons_ID") REFERENCES "Consumidor" ("cons_ID");

ALTER TABLE "Produto" ADD FOREIGN KEY ("prod_ID") REFERENCES "DetalheCompra" ("prod_ID");



SELECT
    tc.table_name, 
    kcu.column_name, 
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name 
FROM 
    information_schema.table_constraints AS tc 
    JOIN information_schema.key_column_usage AS kcu
      ON tc.constraint_name = kcu.constraint_name
    JOIN information_schema.constraint_column_usage AS ccu
      ON ccu.constraint_name = tc.constraint_name
WHERE 
    constraint_type = 'FOREIGN KEY' 
    AND tc.table_name = 'DetalheCompra'
    AND ccu.table_name = 'Produto';

