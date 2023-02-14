Imports ITCOffLine
Imports System.Data
Imports System.Web.Services
Public Class AssociadosDet

    Inherits XMWebPage

    Protected WithEvents frmCad As System.Web.UI.HtmlControls.HtmlForm
    Protected WithEvents tblAssociadosDet As System.Web.UI.WebControls.Table
    Protected WithEvents lblCodigo As System.Web.UI.WebControls.Label
    Protected WithEvents txtModulo As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtFantasia As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtRazaoSocial As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtEndereco As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtComplemento As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtCEP As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtCidade As System.Web.UI.WebControls.TextBox
    Protected WithEvents cboIdEstado As ComboBox
    Protected WithEvents cboIdRamo As ComboBox
    Protected WithEvents txtEnderecoCobranca As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtComplementoCobranca As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtCEPCobranca As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtCidadeCobranca As System.Web.UI.WebControls.TextBox
    Protected WithEvents cboIdEstadoCobranca As ComboBox
    Protected WithEvents txtEnderecoFaturamento As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtComplementoFaturamento As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtCEPFaturamento As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtCidadeFaturamento As System.Web.UI.WebControls.TextBox
    Protected WithEvents cboIdEstadoFaturamento As ComboBox
    Protected WithEvents txtCNPJ As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtInscricaoEstadual As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtWebSite As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtEmail As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtContrato As TextBox
    Protected WithEvents Barra As BarraBotoes2
    Protected WithEvents dtgContatos As System.Web.UI.WebControls.DataGrid
    Protected WithEvents dtgUsuarios As System.Web.UI.WebControls.DataGrid
    Protected WithEvents btnAdicionarContato As System.Web.UI.WebControls.ImageButton
    Protected WithEvents btnAdicionarUsuario As System.Web.UI.WebControls.ImageButton
    Protected WithEvents txtDataAtivacao As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtDataInicioPlano As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtDataFimPlano As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtObservacoes As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtSkype As System.Web.UI.WebControls.TextBox
    Protected WithEvents lblObservacoes As System.Web.UI.WebControls.Label
    Protected WithEvents cboTipoPessoa As ComboBox
    Protected WithEvents cboIdVendedor As ComboBox
    Protected WithEvents cboIdStatus As ComboBox
    Protected WithEvents cboIdAtividade As ComboBox
    Protected WithEvents cboIdFormaPagamento As ComboBox
    Protected WithEvents cboIdPosicao As ComboBox
    Protected WithEvents cboCidadeCobranca As ComboBox
    Protected WithEvents cboCidadeFaturamento As ComboBox
    Protected WithEvents cboCidade As ComboBox
    Protected WithEvents txtNumFunc As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnProdutos As System.Web.UI.WebControls.ImageButton
    Protected WithEvents txtProduto As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtImagemGuia As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnAssinatura As System.Web.UI.WebControls.ImageButton
    Protected WithEvents btnEnderecoEnt As Button
    Protected WithEvents btnEnderecoCob As Button

    Private Associados As clsAssociados

    Dim Cid As New clsCidades
    Dim Cidades As DataSet
    Dim CidadesFaturamento As DataSet
    Dim CidadesCobranca As DataSet

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If Not Page.IsPostBack Then

            Dim objAssociado As Object = DeCryptography(Page.Request("Codigo"))
            Dim m_IdAssociado As Integer
            If IsNumeric(objAssociado) Then
                m_IdAssociado = objAssociado
            Else
                m_IdAssociado = 0
            End If
            ViewState("IdAssociado") = CInt(0 & m_IdAssociado)

            With cboTipoPessoa
                .AddItem(1, "Física")
                .AddItem(2, "Jurídica")
                .Value = 2
            End With

            Dim Sta As New clsStatus
            With cboIdStatus
                .CssClass = "f8"
                .CssClassValidator = "f8"
                .DataSource = Sta.ListStatus
                .DataTextField = "DescricaoStatus"
                .DataValueField = "IdStatus"
                .DataBind()
            End With

            Dim Est As New clsEstados
            With cboIdEstado
                .CssClass = "f8"
                .CssClassValidator = "f8"
                .DataSource = Est.ListEstados
                .DataTextField = "UF"
                .DataValueField = "IdEstado"
                .DataBind()
            End With

            Dim Vend As New clsUsuario
            With cboIdVendedor
                .CssClass = "f8"
                .CssClassValidator = "f8"
                .DataSource = Vend.ListVendedores(Me.Usuario.IdEmpresa, Vend.TipoUsuario.Vendedor)
                .DataTextField = "Vendedor"
                .DataValueField = "IdVendedor"
                .DataBind()
                Vend = Nothing
            End With

            With cboIdEstadoCobranca
                .CssClass = "f8"
                .CssClassValidator = "f8"
                .DataSource = Est.ListEstados
                .DataTextField = "UF"
                .DataValueField = "IdEstado"
                .DataBind()
            End With

            With cboIdEstadoFaturamento
                .CssClass = "f8"
                .CssClassValidator = "f8"
                .DataSource = Est.ListEstados
                .DataTextField = "UF"
                .DataValueField = "IdEstado"
                .DataBind()
            End With

            cboCidade.Enabled = False
            cboCidade.EnableValidation = False

            cboCidadeFaturamento.Enabled = False
            cboCidadeFaturamento.EnableValidation = False

            cboCidadeCobranca.Enabled = False
            cboCidadeCobranca.EnableValidation = False

            Est = Nothing

            Dim Pos As New clsPosicao
            With cboIdPosicao
                .CssClass = "f8"
                .CssClassValidator = "f8"
                .DataSource = Pos.ListPosicao
                .DataTextField = "DescricaoPosicao"
                .DataValueField = "IdPosicao"
                .DataBind()
            End With
            Pos = Nothing

            Dim FPagto As New clsFormaPagamento
            With cboIdFormaPagamento
                .CssClass = "f8"
                .CssClassValidator = "f8"
                .DataSource = FPagto.ListFormaPagamento
                .DataTextField = "Descricao"
                .DataValueField = "IdFormaPagamento"
                .DataBind()
            End With
            FPagto = Nothing

            Dim At As New clsRamosAtividades
            With cboIdRamo
                .AutoPostBack = True
                .CssClass = "f8"
                .CssClassValidator = "f8"
                .DataSource = At.ListRamos
                .DataTextField = "Descricaoramo"
                .DataValueField = "Idramo"
                .DataBind()
            End With
            At = Nothing

            Associados = New clsAssociados(ViewState("IdAssociado"))
            Inflate()
            BindContatos()
            BindUsuarios(ViewState("IdAssociado"))

        Else

            Associados = New clsAssociados(ViewState("IdAssociado"))

        End If

        If CInt(0 & ViewState("IdAssociado")) > 0 Then
            If CheckPermission("Cadastro de Associados", "Alterar Vendedor") Then
                cboIdVendedor.Enabled = True
            Else
                cboIdVendedor.Enabled = False
            End If
            If CheckPermission("Cadastro de Associados", "Incluir Contato") Then
                btnAdicionarContato.Visible = True
            Else
                btnAdicionarContato.Visible = False
            End If
            If CheckPermission("Cadastro de Associados", "Incluir Usuário") Then
                btnAdicionarUsuario.Visible = True
            Else
                btnAdicionarUsuario.Visible = False
            End If
            btnProdutos.Enabled = True
        Else
            cboIdVendedor.Enabled = True
            btnAdicionarContato.Visible = False
            btnAdicionarUsuario.Visible = False
            btnProdutos.Visible = False
        End If

    End Sub

    Private Sub BindAtividades(ByVal IdRamo As Integer)
        If IdRamo > 0 Then
            Dim Ram As New clsRamosAtividades()
            With cboIdAtividade
                .CssClass = "f8"
                .CssClassValidator = "f8"
                .DataSource = Ram.ListAtividades(IdRamo)
                .DataTextField = "DescricaoAtividadeRamo"
                .DataValueField = "IdAtividadeRamo"
                .DataBind()
            End With
            Ram = Nothing
        Else
            cboIdAtividade.Clear()
            cboIdAtividade.AddItem(0, "Selecione o Ramo...   ")
        End If
    End Sub

    Private Sub BindContatos()
        Dim clsContato As New clsContatoAssociados(Me)
        dtgContatos.DataSource = clsContato.List(ViewState("IdAssociado"))
        dtgContatos.DataBind()
        clsContato = Nothing
    End Sub

    Private Sub BindUsuarios(ByVal IdAssociado As Integer)
        Dim Usu As New clsUsuario()
        dtgUsuarios.DataSource = Usu.ListUsuariosEmpresa(IdAssociado)
        dtgUsuarios.DataBind()
        Usu = Nothing
    End Sub

    Private Sub Deflate()
        With Associados
            .Codigo = lblCodigo.Text
            .Fantasia = txtFantasia.Text
            .Modulo = txtModulo.Text
            .RazaoSocial = txtRazaoSocial.Text
            .Endereco = txtEndereco.Text
            .Complemento = txtComplemento.Text
            .CEP = txtCEP.Text
            .Cidade = cboCidade.ValueString
            .Estado = cboIdEstado.Value
            .EnderecoCobranca = txtEnderecoCobranca.Text
            .ComplementoCobranca = txtComplementoCobranca.Text
            .CEPCobranca = txtCEPCobranca.Text
            .CidadeCobranca = cboCidadeCobranca.ValueString
            .EstadoCobranca = cboIdEstadoCobranca.Value
            .EnderecoFaturamento = txtEnderecoFaturamento.Text
            .ComplementoFaturamento = txtComplementoFaturamento.Text
            .CEPFaturamento = txtCEPFaturamento.Text
            .CidadeFaturamento = cboCidadeFaturamento.ValueString
            .EstadoFaturamento = cboIdEstadoFaturamento.Value
            .CNPJ = txtCNPJ.Text
            .InscricaoEstadual = txtInscricaoEstadual.Text
            .WebSite = txtWebSite.Text
            .EMail = txtEmail.Text
            .DataAtivacao = txtDataAtivacao.Text
            .InicioPlano = txtDataInicioPlano.Text
            .FimPlano = txtDataFimPlano.Text
            .IdRamo = cboIdRamo.Value
            .IdAtividade = cboIdAtividade.Value
            .IdFormaPagto = cboIdFormaPagamento.Value
            .IdPessoa = cboTipoPessoa.Value
            .IdPosicao = cboIdPosicao.Value
            .IdRegiao = 1
            .IdStatus = cboIdStatus.Value
            .IdVendedor = cboIdVendedor.Value
            .Observacoes = txtObservacoes.Text
            .NumFunc = txtNumFunc.Text
            .ImagemGuia = txtImagemGuia.Text
            .PrimeiroContrato = txtContrato.Text
            .Skype = txtSkype.Text
        End With
    End Sub

    Private Sub Inflate()

        With Associados
            lblCodigo.Text = Right("0000000" & .Codigo, 7)
            txtFantasia.Text = .Fantasia
            txtModulo.Text = .Modulo
            txtRazaoSocial.Text = .RazaoSocial
            txtEndereco.Text = .Endereco
            txtComplemento.Text = .Complemento
            txtCEP.Text = .CEP
            txtEnderecoCobranca.Text = .EnderecoCobranca
            txtComplementoCobranca.Text = .ComplementoCobranca
            txtCEPCobranca.Text = .CEPCobranca
            txtEnderecoFaturamento.Text = .EnderecoFaturamento
            txtComplementoFaturamento.Text = .ComplementoFaturamento
            txtCEPFaturamento.Text = .CEPFaturamento
            cboIdRamo.Value = .IdRamo
            BindAtividades(cboIdRamo.Value)
            cboIdAtividade.Value = .IdAtividade
            cboIdFormaPagamento.Value = .IdFormaPagto
            cboIdPosicao.Value = .IdPosicao
            cboIdStatus.Value = .IdStatus
            cboIdVendedor.Value = .IdVendedor

            cboIdEstadoFaturamento.Value = .EstadoFaturamento
            cboIdEstadoCobranca.Value = .EstadoCobranca
            cboIdEstado.Value = .Estado

            txtImagemGuia.Text = .ImagemGuia
            txtCNPJ.Text = .CNPJ
            txtInscricaoEstadual.Text = .InscricaoEstadual
            txtWebSite.Text = .WebSite
            txtEmail.Text = .EMail
            txtDataInicioPlano.Text = .InicioPlano
            txtDataFimPlano.Text = .FimPlano
            txtDataAtivacao.Text = .DataAtivacao
            txtObservacoes.Text = .Observacoes
            txtNumFunc.Text = .NumFunc
            txtContrato.Text = .PrimeiroContrato
            txtSkype.Text = .Skype

            If .Codigo > 0 Then

                CarregaCidades(cboIdEstadoFaturamento.Text, cboCidadeFaturamento)
                CarregaCidades(cboIdEstadoCobranca.Text, cboCidadeCobranca)
                CarregaCidades(cboIdEstado.Text, cboCidade)

                cboCidade.ValueString = .Cidade
                cboCidadeFaturamento.ValueString = .CidadeFaturamento
                cboCidadeCobranca.ValueString = .CidadeCobranca

                cboTipoPessoa.Value = .IdPessoa
                lblObservacoes.Text = "Plano de " & .QuantidadeDiasPlano & " dias - "
                If .DiasFimPlano = 0 Then
                    lblObservacoes.Text &= "Último dia do plano"
                Else
                    If .DiasFimPlano > 0 Then
                        lblObservacoes.Text &= "Falta" & IIf(.DiasFimPlano = 1, " ", "m ") & .DiasFimPlano & " dia" & IIf(.DiasFimPlano = 1, "", "s") & " para acabar o plano."
                    Else
                        lblObservacoes.Text &= "Plano Encerrado"
                    End If
                End If
            Else
                cboTipoPessoa.Value = 2
                lblObservacoes.Text = ""
            End If
            txtProduto.Text = .Produtos
        End With

        Barra.AtivarBotoes(IIf(CheckPermission("Cadastro de Associados", "Adicionar"), BarraBotoes2.Botoes_Ativos.Incluir, 0) + IIf(CheckPermission("Cadastro de Associados", "Atualizar"), BarraBotoes2.Botoes_Ativos.Atualizar, 0) + IIf(CheckPermission("Cadastro de Associados", "Excluir"), BarraBotoes2.Botoes_Ativos.Excluir, 0) + BarraBotoes2.Botoes_Ativos.Voltar)

    End Sub

    Private Sub BarraBotoes_Atualizar() Handles Barra.Gravar
        Deflate()
        Associados.Update()
        Log_Usuario("GRAVAR ASSOCIADO", XMWebPage.MODULO.ASSOCIADOS)
        Gravado("associadosdet.aspx?codigo=" & CryptographyEncoded(Associados.Codigo))
    End Sub

    Private Sub BarraBotoes_Incluir() Handles Barra.Incluir
        Response.Redirect("associadosdet.aspx?Codigo=" & CryptographyEncoded("0"))
    End Sub

    Private Sub BarraBotoes_Voltar() Handles Barra.Voltar
        Response.Redirect("associados.aspx")
    End Sub

    Private Sub btnAdicionarContato_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAdicionarContato.Click
        Response.Redirect("contatoassociados.aspx?IDAssociado=" & CryptographyEncoded(ViewState("IdAssociado")))
    End Sub

    Private Sub btnAdicionarUsuario_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAdicionarUsuario.Click
        Response.Redirect("usuariosdet.aspx?Codigo=" & CryptographyEncoded("0") & "&IdAssociado=" & CryptographyEncoded(ViewState("IdAssociado")))
    End Sub

    Private Sub cboIdRamo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboIdRamo.SelectedIndexChanged
        BindAtividades(cboIdRamo.Value)
    End Sub

    Private Sub btnProdutos_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnProdutos.Click
        Response.Redirect("produtosassociados.aspx?IdAssociado=" & CryptographyEncoded(ViewState("IdAssociado")))
    End Sub

    Private Sub BarraBotoes_Excluir() Handles Barra.Excluir
        If Associados.Delete(ViewState("IdAssociado")) = True Then
            Log_Usuario("APAGAR ASSOCIADO", XMWebPage.MODULO.ASSOCIADOS)
            Response.Redirect("associados.aspx")
        End If
    End Sub

    Private Sub btnAssinatura_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAssinatura.Click
        Response.Redirect("associadostiposregioes.aspx?IdAssociado=" & CryptographyEncoded(ViewState("IdAssociado")))
    End Sub

    Private Sub cboIdEstado_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboIdEstado.SelectedIndexChanged

        CarregaCidades(cboIdEstado.Text, cboCidade)
        cboCidade.Enabled = True

    End Sub

    Private Sub cboIdEstadoFaturamento_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboIdEstadoFaturamento.SelectedIndexChanged

        CarregaCidades(cboIdEstadoFaturamento.Text, cboCidadeFaturamento)
        cboCidadeFaturamento.Enabled = True

    End Sub

    Private Sub cboIdEstadoCobranca_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboIdEstadoCobranca.SelectedIndexChanged

        CarregaCidades(cboIdEstadoCobranca.Text, cboCidadeCobranca)
        cboCidadeCobranca.Enabled = True

    End Sub

    Private Sub CarregaCidades(ByVal Estado As String, ByRef vCombo As ComboBox)

        vCombo.Clear()

        Dim Cid As New clsCidades
        With vCombo
            .CssClass = "f8"
            .CssClassValidator = "f8"
            .DataSource = Cid.ListCidades(Estado)
            .DataTextField = "CIDADE"
            .DataValueField = "CIDADE"
            .DataBind()
            Cid = Nothing
        End With

    End Sub

    Private Sub btnEnderecoEnt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnderecoEnt.Click

        cboCidadeCobranca.Enabled = True

        txtEnderecoCobranca.Text = txtEndereco.Text
        txtComplementoCobranca.Text = txtComplemento.Text
        txtCEPCobranca.Text = txtCEP.Text
        cboIdEstadoCobranca.Value = cboIdEstado.Value

        CarregaCidades(cboIdEstadoCobranca.Text, cboCidadeCobranca)
        cboCidadeCobranca.ValueString = cboCidade.ValueString

    End Sub

    Private Sub btnEnderecoCob_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnderecoCob.Click

        cboCidadeFaturamento.Enabled = True

        txtEnderecoFaturamento.Text = txtEnderecoCobranca.Text
        txtComplementoFaturamento.Text = txtComplementoCobranca.Text
        txtCEPFaturamento.Text = txtCEPCobranca.Text
        cboIdEstadoFaturamento.Value = cboIdEstadoCobranca.Value

        CarregaCidades(cboIdEstadoFaturamento.Text, cboCidadeFaturamento)
        cboCidadeFaturamento.ValueString = cboCidadeCobranca.ValueString

    End Sub

    'Sub CNPJValidation(ByVal source As Object, ByVal args As ServerValidateEventArgs)

    '    Dim ass As New clsAssociados
    '    Try

    '        If txtCNPJ.Text <> "" Then
    '            If ass.CNPJExiste(txtCNPJ.Text) Then
    '                args.IsValid = False
    '            End If
    '        End If

    '    Catch ex As Exception

    '        args.IsValid = False

    '    End Try

    '    ass = Nothing

    'End Sub


    <WebMethod()> _
    Shared Function CNPJExiste(ByVal vCNPJ As String, ByVal vIdAssociado As Integer) As Boolean

        Dim blnReturn As Boolean = False
        Dim ass As New clsAssociados(vIdAssociado)
        If vCNPJ <> "" Then
            If ass.CNPJExiste(vCNPJ) Then
                Throw New Exception("CNPJ já existe")
            End If
        End If

        ass = Nothing

        Return blnReturn

    End Function

End Class