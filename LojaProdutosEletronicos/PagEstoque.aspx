<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PagEstoque.aspx.cs" Inherits="LojaProdutosEletronicos.PagCadastroComplexa" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>

    <asp:Panel ID="PnlBemVindo" runat="server">

        <asp:Table ID="Tabela" runat="server">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>
                    <asp:Label ID="LbBemVindo" runat="server" Text="Bem Vindo a Empresa X"></asp:Label><br />
                </asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableCell Width="250px">
                    <asp:Label ID="LbConsultarEstoque" runat="server" Text="Consultar Estoque"></asp:Label><br />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="BtConsultar" runat="server" Text="Consultar" OnClick="BtConsultar_Click" /><br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Width="250px">
                    <asp:Label ID="LbCadastrarProduto" runat="server" Text="Cadastrar um novo Produto"></asp:Label><br />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="BtCadastrarProduto" runat="server" Text="Cadastrar" OnClick="BtCadastrarProduto_Click" /><br />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>



    <asp:Panel ID="PnlCadastro" runat="server" Visible="false">
        <asp:Table ID="Tabela_Especificacoes" runat="server">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>
                    <asp:Label ID="LbNomeDoProduto" runat="server" Text="NOME PRODUTO"></asp:Label>
                </asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbNomeProduto" runat="server" Text="Nome do Produto"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNomeProduto" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="LbCategoria" runat="server" Text="Categoria"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="DdlCategoria" runat="server" DataTextField="Categoria" DataValueField="ID_Categoria"></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbDescricao" runat="server" Text="Descrição"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDescricao" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:Table ID="Tabela_EspecificacoesTecnicas" runat="server">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>
                    <asp:Label ID="LbEspecTecnicas" runat="server" Text="ESPECIFICAÇÕES TÉCNICAS"></asp:Label>
                </asp:TableHeaderCell>
            </asp:TableHeaderRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbNumeroDeSerie" runat="server" Text="Número de Serie"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNumedoDeSerie" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbFabricante" runat="server" Text="Fabricante"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFabricante" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbDataFabricacao" runat="server" Text="Data de Fabricação"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDataFabricacaco" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbPreco" runat="server" Text="Preço"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPreco" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbProcessador" runat="server" Text="Processador"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtProcessador" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbMemoria" runat="server" Text="Memória"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMemoria" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbArmazenamento" runat="server" Text="Armazenamento"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtArmazenamento" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbResolucaoDeTela" runat="server" Text="Resolução"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtResolucaoDeTela" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbTensao" runat="server" Text="Tensão"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CheckBoxList ID="CblTensao" runat="server">
                        <asp:ListItem>110V</asp:ListItem>
                        <asp:ListItem>220V</asp:ListItem>
                        <asp:ListItem>Bivolt</asp:ListItem>
                    </asp:CheckBoxList>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbDimensoes" runat="server" Text="Dimensoes LxAxP"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDimensoes" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbPeso" runat="server" Text="Peso"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPeso" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbImagem" runat="server" Text="Imagem"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LbStatus" runat="server" Text="Status"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="BtCadastroProduto" runat="server" Text="Salvar" OnClick="BtCadastroProduto_Click" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="BtCancelar" runat="server" Text="Cancelar" OnClick="BtCancelar_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>




    </asp:Panel>

    <asp:Panel ID="PnlGridEstoque" runat="server" Visible="false">

        <asp:Button ID="BtVoltar" runat="server" Text="Voltar" OnClick="BtVoltar_Click" /><br />
        <br />
        <br />

        <telerik:RadGrid ID="GridEstoqueProdutos" runat="server" OnNeedDataSource="GridEstoqueProdutos_NeedDataSource" OnItemCommand="GridEstoqueProdutos_ItemCommand" AutoGenerateColumns="false">
            <GroupingSettings CollapseAllTooltip="Collapse all columns" />
            <MasterTableView DataKeyNames="ID_Produto, ID_Categoria">
                <Columns>
                    <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="OP">
                        <ItemTemplate>
                            <asp:LinkButton ID="LnkEditar" runat="server" CommandName="opEditar">Editar</asp:LinkButton>
                            <asp:LinkButton ID="LnkExcluir" runat="server" CommandName="opExcluir">Excluir</asp:LinkButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn UniqueName="Col_IDProduto" DataField="ID_Produto" HeaderText="Codigo Produto"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Col_NomeProduto" DataField="NomeProduto" HeaderText="Produto"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Col_Descricao" DataField="Descricao" HeaderText="Descrição"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Col_Preco" DataField="Preco" HeaderText="Preço R$"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Col_Fabricante" DataField="Fabricante" HeaderText="Fabricante"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Col_DataDeFabricacao" DataField="DataDeFabricacao" HeaderText="Data de Fabricação"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Col_Processador" DataField="Processador" HeaderText="Data de Fabricação"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Col_Memoria" DataField="Memoria" HeaderText="Memoria"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Col_Armazenamento" DataField="Armazenamento" HeaderText="Armazenamento"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Col_Resolucao" DataField="Resolucao" HeaderText="Resolução"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Col_Tensao" DataField="Tensao" HeaderText="Tensão"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Col_Dimensoes" DataField="Dimensoes" HeaderText="Dimensões (mm)"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Col_Peso" DataField="Peso" HeaderText="Peso (g)"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Col_Status" DataField="Status" HeaderText="Status"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

    </asp:Panel>


    <asp:HiddenField ID="HdfID" runat="server" />
</asp:Content>
