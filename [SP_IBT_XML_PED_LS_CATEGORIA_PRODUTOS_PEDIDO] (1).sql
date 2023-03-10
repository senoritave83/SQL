USE [XMLink_IBT]
GO
/****** Object:  StoredProcedure [dbo].[SP_IBT_XML_PED_LS_CATEGORIA_PRODUTOS_PEDIDO]    Script Date: 12/21/2012 11:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[SP_IBT_XML_PED_LS_CATEGORIA_PRODUTOS_PEDIDO]
@IDEMPRESA int,
@IDCATEGORIA VARCHAR(255),
@IDPEDIDO VARCHAR(255) = '',
@CODIGOPROD VARCHAR(255) = ''
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT	prd_Produto_int_PK IDProduto,
			prd_Descricao_chr Produto,
			prd_Codigo_chr Codigo,
			prd_PrecoUnitario_cur Preco,
			cat.cat_Categoria_int_PK IDCategoria,
			cat_Categoria_chr Categoria,
			ISNULL(itp_Quantidade_int, 0) Quantidade,
			ISNULL(itp_ValorUnitario_cur, ISNULL(prd_PrecoUnitario_cur,0)) PrecoProduto
	FROM	TB_IBT_XML_Produto_prd prd (NOLOCK) 
	LEFT	JOIN TB_IBT_XML_Categoria_cat cat (NOLOCK) ON prd.cat_Categoria_int_FK = cat.cat_Categoria_int_PK AND prd.emp_Empresa_int_FK = cat.emp_Empresa_int_FK
	LEFT	JOIN TB_IBT_XML_ItemPedido_itp itp (NOLOCK) ON prd.prd_Produto_int_PK = itp.prd_Produto_int_FK AND prd.emp_Empresa_int_FK = itp.emp_Empresa_int_FK AND CAST(itp.ped_Pedido_int_FK AS VARCHAR(255)) = CAST(@IDPEDIDO AS VARCHAR(255))
	WHERE	prd.emp_Empresa_int_FK = @IDEMPRESA
    AND		(prd_Ativo_ind = 1)
    AND		(cat.cat_Categoria_int_PK = @IDCATEGORIA OR prd.prd_Codigo_chr = @CODIGOPROD)
	ORDER	BY prd_Codigo_chr, prd_Descricao_chr
	
END



