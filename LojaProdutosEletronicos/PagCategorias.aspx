<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PagCategorias.aspx.cs" Inherits="LojaProdutosEletronicos.PagCategorias" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>

    <%--GRID CATEGORIAS--%>
    <asp:Panel ID="PnlGridCategorias" runat="server">
        <asp:Button ID="BtCadastrarCategoria" runat="server" Text="Cadastrar" OnClick="BtCadastrarCategoria_Click" />
        <br />
        <br />
        <telerik:RadGrid ID="GridCategorias" runat="server" OnNeedDataSource="GridCategorias_NeedDataSource" OnItemCommand="GridCategorias_ItemCommand" AutoGenerateColumns="false">
            <GroupingSettings CollapseAllTooltip="Collapse all columns" />
            <MasterTableView DataKeyNames="ID_Categoria" Width="30%" BorderStyle="Groove">
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="OP" AllowFiltering="false" HeaderStyle-Width="30%">
                        <ItemTemplate>
                            <asp:Button ID="BtEditar" runat="server" Text="Editar" CommandName="opEditar" />&nbsp&nbsp
                        <asp:Button ID="BtExcluir" runat="server" Text="Excluir" CommandName="opExcluir" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn UniqueName="Coluna_IDCategoria" DataField="ID_Categoria" HeaderText="Cod Categoria" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30%" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Coluna_Categoria" DataField="Categoria" HeaderText="Categoria" HeaderStyle-Width="30%" HeaderStyle-Font-Bold="true"></telerik:GridBoundColumn>
                    
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </asp:Panel>

    <%--CADASTRO CATEGORIAS--%>

    <asp:Panel ID="PnlCadastroCategorias" runat="server" Visible="false">

        <asp:Table ID="Tb_CadastroCategorias" runat="server">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center">
                    <asp:Label ID="LbCategoria" runat="server" Text="Nome Categoria"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNomeCategoria" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="center">
                    <asp:Button ID="BtSalvar" runat="server" Text="Salvar" Width="35%" OnClick="BtSalvar_Click"/>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:Button ID="BtCancelar" runat="server" Text="Cancelar" Width="35%" OnClick="BtCancelar_Click"/>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        

    </asp:Panel>
    <asp:HiddenField ID="HdfID" runat="server" />
</asp:Content>
