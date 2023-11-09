<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PagFuncionarios.aspx.cs" Inherits="LojaProdutosEletronicos.PagFuncionarios" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>

    <asp:Panel ID="PnlOpcoes" runat="server" Visible="true">
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbCadastro" runat="server" Text="Cadastrar Funcionário"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="BtCadastrarNovoFuncionario" runat="server" Text="Cadastrar" Width="90px" OnClick="BtCadastrarNovoFuncionario_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbListaFuncionarios" runat="server" Text="Lista de Funcionarios"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="BtListaFuncionarios" runat="server" Text="Listar" Width="90px" OnClick="BtListaFuncionarios_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <br />
    </asp:Panel>

    <asp:Panel ID="PnlCadastroFuncionarios" runat="server" Visible="false">
        <asp:Label ID="LbCadastroFuncionarios" runat="server" Text="Cadastro de Funcionarios"></asp:Label><br />
        <br />
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbNomeFuncionario" runat="server" Text="Nome Funcionario"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNomeFuncionario" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbFuncao" runat="server" Text="Função"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFuncao" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbSetor" runat="server" Text="Setor"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="DdlSetor" runat="server" DataTextField="Setor" DataValueField="ID_Setor" AutoPostBack="True"></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="center">
                    <asp:Button ID="BtSalvar" runat="server" Text="Salvar" Width="35%" OnClick="BtSalvar_Click" />&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:Button ID="BtCancelar" runat="server" Text="Cancelar" Width="35%" OnClick="BtCancelar_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>

    <asp:Panel ID="PnlGridFuncionarios" runat="server" Visible="false">
        <telerik:RadGrid ID="GridFuncionarios" runat="server" OnNeedDataSource="GridFuncionarios_NeedDataSource" OnItemCommand="GridFuncionarios_ItemCommand" AutoGenerateColumns="false">
            <GroupingSettings CollapseAllTooltip="Collapse all columns"/>
            <MasterTableView DataKeyNames="ID_Funcionario, ID_Setor">
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="OP" AllowFiltering="false" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <telerik:RadButton ID="BtEditar" runat="server" Text="Editar" CommandName="opEditar"></telerik:RadButton>
                            &nbsp
                            <telerik:RadButton ID="BtExcluir" runat="server" Text="Excluir" CommandName="opExcluir"></telerik:RadButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn UniqueName="Coluna_IDFuncionario" DataField="ID_Funcionario" HeaderText="Cod Funcionario" HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Coluna_Funcionario" DataField="Nome_Funcionario" HeaderText="Funcionario" HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Coluna_Função" DataField="Funcao" HeaderText="Função" HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Coluna_Setor" DataField="Setor" HeaderText="Setor" HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </asp:Panel>

    <asp:HiddenField ID="HdfID" runat="server" />
</asp:Content>
