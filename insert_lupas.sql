INSERT INTO TB_IBT_XML_EstoqueConsignadoVendedorHistorico_evh
           ([emp_Empresa_int_FK]
           ,[ven_Vendedor_FK]
           ,[prd_Produto_int_FK]
           ,[evh_Usuario_chr]
           ,[evh_Modulo_chr]
           ,[evh_EstoqueAnterior_int]
           ,[evh_EstoqueAtual_int]
           ,[evh_Data_dtm]
           ,[evh_NumDevice_int]
           ,[pev_PedidoEstoqueVendedor_int_FK]
           ,[ped_Pedido_int_FK]
           ,[cli_Cliente_int_FK])
select emp_Empresa_int_FK, ven_Vendedor_int_FK, prd_Produto_int_FK,
'Veronica', 'Web- Zerar Estoque', ecv_Estoque_int, 0, GETDATE(), null, null, null, null
 from TB_IBT_XML_EstoqueConsignadoVendedor_ecv

go
          
    
    UPDATE [XMLink_IBT].[dbo].TB_IBT_XML_EstoqueConsignadoVendedor_ecv 
   SET ecv_estoque_int=0 
         
GO


