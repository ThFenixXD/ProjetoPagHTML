<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PagProdutos.aspx.cs" Inherits="LojaProdutosEletronicos.PagProdutos" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <%--GRID PRODUTOS--%>

    <asp:Panel ID="PnlGridProdutos" runat="server" Visible="true">
        <asp:Button ID="BtNovoRegistro" runat="server" Text="Cadastrar" OnClick="BtNovoRegistro_Click"/><br />
        <br />
        <telerik:RadGrid ID="GridProdutos" runat="server" OnNeedDataSource="Grid_Produtos_NeedDataSource" OnItemCommand="GridProdutos_ItemCommand" AutoGenerateColumns="false">
            <GroupingSettings CollapseAllTooltip="Collapse all columns"/>
            <MasterTableView DataKeyNames="ID_Produto, ID_Categoria">
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="OP" AllowFiltering="false" ItemStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Button ID="BtEditar" runat="server" Text="Editar" CommandName="opEditar" />&nbsp
                            <asp:Button ID="BtExcluir" runat="server" Text="Excluir" CommandName="opExcluir" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn UniqueName="Coluna_CodProdutos" DataField="ID_Produto" HeaderText="Cod Produto" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Coluna_Produtos" DataField="Produto" HeaderText="Produtos" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Coluna_Categoria" DataField="Categoria" HeaderText="Produtos" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Coluna_Descricao" DataField="Descricao" HeaderText="Descrição" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </asp:Panel>

    <%--CADASTRO PRODUTOS--%>

    <asp:Panel ID="PnlCadastroProdutos" runat="server" Visible="false">
        <asp:Table ID="Tb_CadastroProdutos" runat="server">
            <asp:TableRow>
                <asp:TableCell Font-Bold="true" >
                    <asp:Label ID="LbNomeProduto" runat="server" Text="Nome Produto"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNomeProduto" runat="server" Width="300px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Font-Bold="true" >
                    <asp:Label ID="LbNomeCategoria" runat="server" Text="Categoria" ></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="DdlCategoria" runat="server" DataTextField="Categoria" DataValueField="ID_Categoria" AutoPostBack="true" Width="300px"></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Font-Bold="true">
                    <asp:Label ID="LbDescricao" runat="server" Text="Descrição"></asp:Label><br />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDescricao" runat="server" Width="300px" Height="100px"></asp:TextBox>
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


