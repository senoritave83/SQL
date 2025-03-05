/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [usu_Usuario_int_PK]
      ,[usu_Usuario_chr]
      ,[usu_Login_chr]
      ,[usu_Senha_chr]
      ,[crg_Cargo_int_FK]
      ,[usu_Ativo_ind]
      ,[usu_Usuario_int_FK]
      ,[usu_Email_chr]
      ,[emp_IdEmpresa_int_FK]
      ,[USU_TIPOUSUARIO_INT]
      ,[USU_INDATIVO_IND]
      ,[DATAULTIMOACESSO]
      ,[usu_empresa_chr]
      ,[IdGrupo]
      ,[usu_UpdatePasswordNextLogon_ind]
       ,[IdGestor]
       FROM [TB_Usuario_usu]
        order by DATAULTIMOACESSO 
       
     update  [TB_Usuario_usu] set usu_Senha_chr =0x01008FDE35F051A20BDF54B22FF120B4F5571157323BA148B2DE where [usu_Usuario_int_PK]= 463
 
  select PWDENCRYPT('itc')
