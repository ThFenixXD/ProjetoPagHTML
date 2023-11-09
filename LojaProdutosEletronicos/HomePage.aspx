<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="LojaProdutosEletronicos.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center">
        <asp:label id="LbHistoriaEmpresa" runat="server" text="Nossa História"></asp:label>
    </div>
    <div style="text-align:center">
        <br />
        <asp:label id="LbTexto" runat="server"
            text="A educação desempenha um papel fundamental na vida de cada indivíduo e na sociedade como um todo. Ela é a chave para o crescimento, o desenvolvimento pessoal e o progresso de uma nação. Através da educação, as pessoas adquirem conhecimentos, habilidades e valores que os capacitam a enfrentar os desafios da vida, a tomar decisões informadas e a contribuir de maneira significativa para a comunidade.
        A importância da educação começa desde a infância. Ela oferece às crianças a oportunidade de explorar o mundo ao seu redor, aprender a ler, escrever e fazer cálculos. À medida que avançam na escolaridade, os alunos têm acesso a uma ampla gama de disciplinas, incluindo ciências, matemática, literatura, história e muito mais. Isso não apenas aumenta seu conhecimento, mas também estimula o pensamento crítico e a resolução de problemas."
            width="400px">
    </asp:label>
    </div>

</asp:Content>
