INSERT INTO TB_REP_LojaSegmentacao_ljs
           (emp_Empresa_int_FK
           ,loj_Loja_int_FK
           ,sct_SubCategoria_int_FK
           ,cat_Categoria_int_FK
           ,prd_Produto_int_FK
           ,ljs_Ativo_ind)
     SELECT
           7
           ,IdRevenda
           ,0
           ,0
           ,IdProduto
           ,1 
           FROM [Dados_Segmentacao_itp_BH_19032013] inner join [TB_REP_Loja_loj] on loj_loja_int_pk = idrevenda


sUBCATEGORIA
UPDATE ljs set ljs.sct_SubCategoria_int_FK = PRD.sct_SubCategoria_int_FK FROM [TB_REP_LojaSegmentacao_ljs]ljs 
   INNER JOIN[TB_REP_Produto_prd]PRD  ON prd.prd_Produto_int_PK = ljs.prd_Produto_int_FK 
   WHERE LJS.sct_SubCategoria_int_FK =0


categoria

/****** Script for SelectTopNRows command from SSMS  ******/
 --SELECT   Ljs.cat_Categoria_int_FK
  --  FROM [Itaipava_XMPromotores].[dbo].[TB_REP_LojaSegmentacao_ljs]ljs WHERE ljs.sct_SubCategoria_int_FK = 0 AND [prd_Produto_int_FK] <> 0
  
  
  -- UPDATE ljs set ljs.cat_Categoria_int_FK = sct.cat_Categoria_int_FK FROM [TB_REP_LojaSegmentacao_ljs]ljs INNER JOIN
  -- TB_REP_SubCategoria_sct sct ON sct.sct_SubCategoria_int_PK =  ljs.sct_SubCategoria_int_FK WHERE ljs.cat_Categoria_int_FK =0 
  
 
   
  
 sELECT cat_Categoria_int_FK FROM [TB_REP_LojaSegmentacao_ljs]ljs INNER JOIN [TB_REP_Produto_prd]PRD  ON prd.prd_Produto_int_PK = ljs.prd_Produto_int_FK 
   WHERE LJS.cat_Categoria_int_FK =0
  
  
  SELECT * FROM [TB_REP_LojaSegmentacao_ljs]ljs INNER JOIN
  TB_REP_SubCategoria_sct sct ON sct.sct_SubCategoria_int_PK =  ljs.sct_SubCategoria_int_FK WHERE ljs.cat_Categoria_int_FK =0
  
  
   update ljs set ljs.cat_Categoria_int_FK = sct.cat_Categoria_int_FK FROM [TB_REP_LojaSegmentacao_ljs]ljs INNER JOIN
  TB_REP_SubCategoria_sct sct ON sct.sct_SubCategoria_int_PK =  ljs.sct_SubCategoria_int_FK WHERE ljs.cat_Categoria_int_FK =0