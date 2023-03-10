USE [XMLink_IBT]
GO
/****** Object:  StoredProcedure [dbo].[SP_IBT_XML_BS_PEDIDO_INC]    Script Date: 05/24/2013 11:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE[dbo].[SP_IBT_XML_BS_PEDIDO_INC]
@IDEMPRESA AS INT,
@IDPEDIDO AS UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON
             
           DECLARE	@ASSUNTO AS VARCHAR(100),@HTML AS VARCHAR(MAX),@STATUSPEDIDO  as varchar(30),
					@DESTINO AS VARCHAR(100),@USUARIOEMAIL AS INT ,@NUMEROPEDIDO int, @CLIENTE AS VARCHAR(100), 
					@DATA as varchar(50),@VENDEDOR AS VARCHAR(50),@TIPOPEDIDO AS VARCHAR (30),@DESCONTO as varchar(10),
					@DATA_ENTREGA as varchar (30),@OPCAO AS VARCHAR(50), @CONDICAO_PAGAMENTO AS VARCHAR(50), 
					@FORMA_PAGAMENTO AS VARCHAR(50),@QTD as varchar,@CODIGO as varchar(50),@TOTAL as int, @PRECO as varchar(30)
           
           SELECT	@DESTINO = cli_Email_chr,
					@NUMEROPEDIDO = ped_NumeroPedido_int,
					@CLIENTE =cli_Cliente_chr,
					@VENDEDOR= ven.ven_Vendedor_chr,
					@DATA = ped_DataEmissao_dtm,
					@TIPOPEDIDO =tpp_TipoPedido_chr,
					@STATUSPEDIDO = sta_Status_chr,
					@DESCONTO = ped_Desconto_num,
					@DATA_ENTREGA = ped_DataEntrega_dtm,
					@OPCAO = ped_Opcao_int,
					@CONDICAO_PAGAMENTO =con_Condicao_chr,
					@FORMA_PAGAMENTO = frm_FormaPagamento_chr
		   From		TB_IBT_XML_Cliente_cli CLI 
		   INNER	JOIN  TB_IBT_XML_Pedido_ped ped ON ped.cli_Cliente_int_FK = cli.cli_Cliente_int_PK 
		   INNER    JOIN  TB_IBT_XML_Vendedor_ven ven ON ped.ven_Vendedor_int_FK = ven.ven_Vendedor_int_PK 
		   INNER    JOIN  TB_IBT_XML_TipoPedido_tpp tpp ON  tpp.tpp_TipoPedido_int_PK = ped.ped_TipoPedido_int
		   INNER    JOIN  TB_IBT_XML_Status_sta sta ON sta.sta_Status_int_PK = ped.sta_StatusPedido_ind
		   INNER    JOIN  TB_IBT_XML_FormaPagamento_frm frm ON ped.frm_FormaPagamento_int_FK = frm.frm_FormaPagamento_int_PK
		   INNER    JOIN  TB_IBT_XML_Condicao_con con ON ped.con_Condicao_int_FK = con.con_Condicao_int_PK 
		   where	ped_Pedido_int_PK = @IDPEDIDO
			    
		   declare curDados cursor for 
					
			            	SELECT	CONVERT(VARCHAR(36), ITP_ITEMPEDIDO_INT_PK) IDItemPedido, 
							CONVERT(VARCHAR(36), PED_PEDIDO_INT_FK) IDPedido, 
							PRD_CODIGO_CHR Codigo,
							PRD_DESCRICAO_CHR Descricao,
							ITP_QUANTIDADE_INT Quantidade, 
							ITP_VALORUNITARIO_CUR ValorUnitario, 
							CASE 
					        WHEN ITP_PrecoBase_CUR <> 0 THEN (ITP_VALORUNITARIO_CUR - ITP_PrecoBase_CUR) / ITP_PrecoBase_CUR
					        ELSE 0
			            	END Desconto,
							(ISNULL(ITP_QUANTIDADE_INT, 0) * ISNULL(ITP_VALORUNITARIO_CUR, 0)) Total
							FROM 	TB_IBT_XML_ITEMPEDIDO_ITP ITP (NOLOCK) INNER 	JOIN TB_IBT_XML_PRODUTO_PRD PRD (NOLOCK) ON PRD_PRODUTO_INT_FK = PRD_PRODUTO_INT_PK
							WHERE	PED_PEDIDO_INT_FK = @IDPEDIDO 
							
							open curDados
							fetch next from curDados into @QTD,@CODIGO,@PRECO,@DESCONTO,@TOTAL
							 
							while @@FETCH_STATUS = 0
							begin
						 						 
								select @QTD,@CODIGO,@PRECO,@DESCONTO,@TOTAL
																
							    fetch next from curDados into @QTD,@CODIGO,@PRECO,@DESCONTO,@TOTAL
							end
							 
							close curDados
							deallocate curDados	

			    
	SET @ASSUNTO ='COPIA DO PEDIDO -LUPAS LEITOR'
	SET @HTML ='<b>SEU PEDIDO '+CAST(@numeropedido as varchar)+' FOI EFETUADO COM SUCESSO!!!</b><br><br><table border=0>
			    <tr><td colspan=4><B>DADOS DO PEDIDO:<B></td></tr>
			    <tr><td><b><font color=#137fc0>Cliente</b></font>: </td><td>'+@CLIENTE+'</td></tr>
			    <tr><td><b><font color=#137fc0>Vendedor:</font></b></td><td>'+@VENDEDOR+'</td>
			    <td><b><font color=#137fc0> Numero do Pedido:</b></font></td><td>'+CAST(@numeropedido as varchar)+'</td></tr>
				<tr><td><b><font color=#137fc0>Data de Emiss&atilde;o:</font></b></td><td>'+@DATA+'</td></tr>
				<tr><td><B><font color=#137fc0>Tipo do Pedido:</FONT></B></td><td>'+@TIPOPEDIDO+'</td>
				<td><B><font color=#137fc0>Status:</FONT></B></td><td>'+@STATUSPEDIDO+'</td></tr>
			    <tr><td><B><font color=#137fc0>Desconto:</FONT></B></td><td>'+@DESCONTO+'</td>
				<td><B><font color=#137fc0>Data de Entrega:</FONT></B></td><td>'+@DATA_ENTREGA+'</td></tr> 
				<tr><td><B><font color=#137fc0>Opção:</FONT></B></td><td>'+@OPCAO+'</td>
				<td><B><font color=#137fc0>Condição de Pagamento:</FONT></B></td><td>'+@CONDICAO_PAGAMENTO+'</td></tr>
				<tr><td><B><font color=#137fc0>Forma de Pagamento:</FONT></B></td><td>'+@FORMA_PAGAMENTO+'</td>
				</table><table border=0><tr><td colspan=4><b>Itens do Pedido:</b></td></tr>
				<table cellspacing=0 cellpadding=4 border=0 style=border-style:None;width:100%;border-collapse:collapse>
				<tr align="left">
				<th scope=col>Qtd.</th>
				<th scope="col">Codigo</th><th scope="col">Descricao</th>
				<th scope="col">Preço Unitário</th>
				<th scope="col">Desc/Acresc</th>
				<th scope="col">Total</th>
				<th scope="col">&nbsp;</th></tr>
				<tr>
				<td>'+@QTD+'</td>
				<td>'+@CODIGO+'</td>
				<td>'+@PRECO+'</td>
				<td>'+@DESCONTO+'</td>
				<td>'+@TOTAL+'</td>
				<td></td>
				</tr>
				</table>'
					
	
	SET @USUARIOEMAIL = 10
	    
    exec SP_IBT_XML_DTS_IN_INSERE_EMAIL @ASSUNTO,@HTML,@DESTINO,@USUARIOEMAIL
       
		
END




[SP_IBT_XML_BS_PEDIDO_INC]
@IDEMPRESA =10,
@IDPEDIDO = '51A30606-A34F-4347-9AD8-2BF2821E79D9'
