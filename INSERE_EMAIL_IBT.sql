USE XMLink_IBT
GO
/****** Object:  StoredProcedure [dbo].[SP_DTS_IN_INSERE_EMAIL]    Script Date: 05/16/2013 16:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [dbo].[SP_DTS_IN_INSERE_EMAIL]    
@ASSUNTO VARCHAR(7800),    
@HTML TEXT,    
@DESTINO VARCHAR(500),    
@USUARIO INT    
/*
AS    
BEGIN    
   
INSERT    
INTO [TB_IBT_XML_EnvioEmail_evm]    
(    
[evm_EnvioEmail_int_PK],    
[evm_Subject_chr],    
[evm_Body_txt],    
[evm_To_chr],    
[evm_CC_chr],    
[evm_BCC_chr],    
[evm_From_chr],    
[evm_User_chr], 
[evm_Enviado_ind],   
[evm_Password_chr],  
[evm_Erro_chr],  
[evm_Data_dtm],    
[evm_DataEnvio_dtm],    
[evm_Referencia_int],    
[evm_TipoEmail_int_FK],
[evm_Tentativas_int],
[evm_UltimaTentativa_dtm])    
VALUES    
(    
@USUARIO,    
@ASSUNTO,    
@HTML,    
@DESTINO,    
'',    
'',    
'suporte@itc.etc.br',    
'',    
'',    
getdate(),    
0,    
0,    
0    
)    
   
   
END   
  */
--insert into TB_LOGPROCEDURE_LPR  
--values ('SP_DTS_IN_INSERE_EMAIL', GETDATE())  

