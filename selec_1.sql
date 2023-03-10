/****** Script for SelectTopNRows command from SSMS  ******/
  SELECT TOP 1000 [cat_Categoria_int_PK],
         prd_Descricao_chr,
         sct_SubCategoria_chr,
         sct.emp_Empresa_int_FK,
         cli_RazaoSocial_chr
   FROM [XMPromotores].[dbo].[TB_REP_Categoria_cat] INNER JOIN 
   [XMPromotores].[dbo].[TB_REP_SubCategoria_sct] sct
   ON sct.cat_Categoria_int_fk= sct.cat_Categoria_int_FK INNER JOIN
   [XMPromotores].[dbo].[TB_REP_Produto_prd] prd
   ON prd.sct_SubCategoria_int_FK= sct.sct_SubCategoria_int_PK INNER JOIN
   [XMPromotores].[dbo].[TB_REP_Cliente_cli]cli
   ON cli.emp_Empresa_int_FK =sct.emp_Empresa_int_FK 
   ORDER BY cat_Ordem_int
  
