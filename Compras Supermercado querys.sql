SELECT * FROM "Categoria";
CREATE SEQUENCE categoria_cat_id_seq START 1;
ALTER TABLE "Categoria" ALTER COLUMN "cate_ID" SET DEFAULT nextval('categoria_cat_id_seq');




INSERT INTO "Categoria" ("cate_Descricao")
VALUES 
  ('Frutas'),
  ('Verduras e Legumes'),
  ('Cereais e Grãos'),
  ('Proteínas'),
  ('Laticínios');
  
  
SELECT *
FROM "Produto";
CREATE SEQUENCE produto_prod_id_seq START 1;
ALTER TABLE "Produto" ALTER COLUMN "prod_ID" SET DEFAULT nextval('produto_prod_id_seq');
  
INSERT INTO "Produto" ("prod_Descricao", "prod_Categoria", "prod_Valor" )
VALUES
  	('Banana', 1, 4.50),
	('Brócolis', 2, 5.00),
	('Arroz', 3, 15.00),
	('Peito de franfo', 4, 12.50),
	('Queijo mussarela', 5, 39.90);

SELECT *
FROM "Consumidor";
CREATE SEQUENCE consumidor_cons_id_seq START 1;
ALTER TABLE "Consumidor" ALTER COLUMN "cons_ID" SET DEFAULT nextval('consumidor_cons_id_seq');

INSERT INTO "Consumidor" ("cons_Nome", "cons_CPF", "cons_DataNascimento", "cons_Endereco", "cons_Municipio", "cons_UF", "cons_CEP", "cons_Email", "cons_Telefone")
VALUES
	('Nome Santos', 00000000000, '1980-10-20','qn 31 cj 05','Brasília', 'DF', 0000000,'@gmail', 610000000);

ALTER TABLE "Consumidor"
ALTER COLUMN "cons_Email" TYPE varchar(255);

UPDATE "Consumidor"
SET "cons_Email" = 'jeice.santos@gmail.com'
WHERE "cons_ID" = 1;



SELECT *
FROM "Supermercado";
CREATE SEQUENCE supermercado_supe_id_seq START 1;
ALTER TABLE "Supermercado" ALTER COLUMN "supe_ID" SET DEFAULT nextval('supermercado_supe_id_seq');

INSERT INTO "Supermercado" ("supe_CNPJ", "supe_RazaoSocial", "supe_Endereco", "supe_Municipio", "supe_UF", "supe_CEP", "supe_Email", "supe_Telefone")
VALUES (00000000000000, 'Supermercado Bom Preço','Riacho Fundo II', 'Riacho Fundo II','DF',71880715, '@gmail', 610000000),
	  (00000000000000, 'Supermercado da Fazenda', 'Riacho Fundo I', 'Riacho Fundo I', 'DF',72882716, '@hotmail',611111111);


SELECT *
FROM "Compra";
CREATE SEQUENCE compra_comp_id_seq START 1;
ALTER TABLE "Compra" ALTER COLUMN "comp_ID" SET DEFAULT nextval('compra_comp_id_seq');
INSERT INTO "Compra" ("supe_ID","cons_ID", "comp_Data", "comp_ValorTotal")
VALUES
	(1, 1, '2023-10-15', 550.00),
	(2, 1, '2023-10-16', 750.55);


UPDATE "Compra"
SET "comp_ValorTotal" = Null;


SELECT *
FROM "DetalheCompra";
CREATE SEQUENCE detalhecompra_detalhe_id_seq START 1;
ALTER TABLE "DetalheCompra" ALTER COLUMN "detalhe_ID" SET DEFAULT nextval('detalhecompra_detalhe_id_seq');
INSERT INTO "DetalheCompra" ("comp_ID", "prod_ID", "comp_Quantidade", "comp_ValorUnitario")
VALUES
	(1, 1, 5, 4.5),
	(1, 2, 2, 5.00),
	(1, 3, 2, 15.00),
	(1, 4, 3, 12.50),
	(1, 5, 1, 39.90),
	(2, 1, 3, 4.5),
	(2, 2, 4, 5.00),
	(2, 3, 3, 15.00),
	(2, 4, 1, 12.50),
	(2, 5, 2, 39.90);
	
SELECT * 
FROM "Compra";


UPDATE "Compra"
SET "comp_ValorTotal" = (
    SELECT SUM("comp_Quantidade" * "comp_ValorUnitario")
    FROM "DetalheCompra"
    WHERE "DetalheCompra"."comp_ID" = "Compra"."comp_ID"
);


