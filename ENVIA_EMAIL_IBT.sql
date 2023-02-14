USE XMLink_IBT
GO

/****** Object:  Table [dbo].[TB_EnvioEmail_evm]    Script Date: 05/16/2013 16:27:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TB_IBT_XML_EnvioEmail_evm](
	[evm_EnvioEmail_int_PK] [int] IDENTITY(1,1) NOT NULL,
	[usu_Usuario_int_FK] [int] NOT NULL,
	[evm_TipoEmail_int_FK] [int] NOT NULL,
	[evm_Referencia_int] [int] NOT NULL,
	[evm_Subject_chr] [varchar](300) NOT NULL,
	[evm_Body_txt] [text] NOT NULL,
	[evm_To_chr] [varchar](1000) NULL,
	[evm_From_chr] [varchar](150) NOT NULL,
	[evm_User_chr] [varchar](100) NULL,
	[evm_Password_chr] [varchar](20) NOT NULL,
	[evm_Data_dtm] [datetime] NOT NULL,
	[evm_DataEnvio_dtm] [datetime] NULL,
	[evm_Enviado_ind] [tinyint] NOT NULL,
	[evm_Erro_chr] [varchar](300) NULL,
	[evm_CC_chr] [varchar](1000) NULL,
	[evm_BCC_chr] [varchar](1000) NULL,
	[evm_Tentativas_int] [tinyint] NULL,
	[evm_UltimaTentativa_dtm] [smalldatetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


