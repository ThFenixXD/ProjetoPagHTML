using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LojaProdutosEletronicos.Útil;

namespace LojaProdutosEletronicos
{
    public partial class PagCadastroComplexa : System.Web.UI.Page
    {
        protected void AtualizaGrid()
        {
            GridEstoqueProdutos.DataSource = Framework.GetDataTable("SELECT tb_Estoque.ID_Produto, tb_Estoque.NomeProduto, tb_Categorias.ID_Categoria, tb_Categorias.Categoria, tb_Estoque.Descricao, tb_Estoque.Preco, tb_Estoque.Fabricante, tb_Estoque.DataDeFabricacao, tb_Estoque.Processador, tb_Estoque.Memoria, tb_Estoque.Armazenamento, tb_Estoque.Resolucao, tb_Estoque.Tensao, tb_Estoque.Dimensoes, tb_Estoque.Peso, tb_Estoque.Status " +
                                                             "FROM tb_Estoque " +
                                                             "INNER JOIN tb_Categorias " +
                                                             "ON tb_Estoque.ID_Categoria = tb_Categorias.ID_Categoria " +
                                                             "WHERE tb_Estoque.Deleted = 0");
            GridEstoqueProdutos.DataBind();
        }

        protected void EsconderPaineis()
        {
            PnlCadastro.Visible = false;
            PnlBemVindo.Visible = false;
            PnlGridEstoque.Visible = false;
        }

        protected void LimpaCampos()
        {
            txtNomeProduto.Text =
            txtDescricao.Text =
            txtPreco.Text =
            txtFabricante.Text =
            txtDataFabricacaco.Text =
            txtProcessador.Text =
            txtMemoria.Text =
            txtArmazenamento.Text =
            txtResolucaoDeTela.Text =
            txtDimensoes.Text =
            txtPeso.Text =
            txtStatus.Text =
            HdfID.Value =
            string.Empty;
        }

        protected void PopularDdlCategoria()
        {
            DdlCategoria.DataSource = Framework.GetDataTable("Select ID_Categoria, Categoria From tb_Categorias where Deleted = 0");
            DdlCategoria.DataBind();
            DdlCategoria.Items.Insert(0, new ListItem("- Selecione -", "0"));

        }

        protected void PopulaCampos(int _cdID)
        {
            using (EmpresaXEntities ctx = new EmpresaXEntities())
            {
                tb_Estoque Produto = new tb_Estoque();

                int ID = _cdID;
                HdfID.Value = _cdID.ToString();

                var Query = (from objProduto in ctx.tb_Estoque where objProduto.ID_Produto == ID select objProduto).FirstOrDefault();

                txtNomeProduto.Text = Query.NomeProduto;
                DdlCategoria.SelectedValue = Query.ID_Categoria.ToString();
                txtDescricao.Text = Query.Descricao;
                txtPreco.Text = Query.Preco;
                txtFabricante.Text = Query.Fabricante;
                txtDataFabricacaco.Text = Query.DataDeFabricacao;
                txtProcessador.Text = Query.Processador;
                txtMemoria.Text = Query.Memoria;
                txtArmazenamento.Text = Query.Armazenamento;
                txtResolucaoDeTela.Text = Query.Resolucao;
                txtDimensoes.Text = Query.Dimensoes;
                txtPeso.Text = Query.Peso;
                txtStatus.Text = Query.Status;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopularDdlCategoria();
            }
        }

        protected void GridEstoqueProdutos_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            GridEstoqueProdutos.DataSource = Framework.GetDataTable("SELECT tb_Estoque.ID_Produto, tb_Estoque.NomeProduto, tb_Categorias.ID_Categoria, tb_Categorias.Categoria, tb_Estoque.Descricao, tb_Estoque.Preco, tb_Estoque.Fabricante, tb_Estoque.DataDeFabricacao, tb_Estoque.Processador, tb_Estoque.Memoria, tb_Estoque.Armazenamento, tb_Estoque.Resolucao, tb_Estoque.Tensao, tb_Estoque.Dimensoes, tb_Estoque.Peso, tb_Estoque.Status " +
                                                                    "FROM tb_Estoque " +
                                                                    "INNER JOIN tb_Categorias " +
                                                                    "ON tb_Estoque.ID_Categoria = tb_Categorias.ID_Categoria " +
                                                                    "WHERE tb_Estoque.Deleted = 0");
        }

        protected void GridEstoqueProdutos_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                int _cdID = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ID_Produto"]);

                switch (e.CommandName)
                {
                    case "opEditar":
                        EsconderPaineis();
                        LimpaCampos();
                        PopulaCampos(_cdID);
                        PnlCadastro.Visible = true;
                        break;

                    case "opExcluir":
                        using (EmpresaXEntities ctx = new EmpresaXEntities())
                        {
                            tb_Estoque Produto = new tb_Estoque();

                            int ID = _cdID;
                            HdfID.Value = _cdID.ToString();

                            var Query = (from objProduto in ctx.tb_Estoque where objProduto.ID_Produto == ID select objProduto).FirstOrDefault();

                            Query.Deleted = 1;
                            ctx.SaveChanges();
                            AtualizaGrid();
                        }
                        break;
                }

            }
            catch (Exception ex)
            {
                Response.Write("Erro, " + ex.Message);
            }
        }

        protected void BtConsultar_Click(object sender, EventArgs e)
        {
            EsconderPaineis();
            PnlGridEstoque.Visible = true;
            AtualizaGrid();
        }

        protected void BtCadastrarProduto_Click(object sender, EventArgs e)
        {
            EsconderPaineis();
            LimpaCampos();
            PnlCadastro.Visible = true;
        }

        protected void BtVoltar_Click(object sender, EventArgs e)
        {
            EsconderPaineis();
            PnlBemVindo.Visible = true;
        }

        protected void BtCadastroProduto_Click(object sender, EventArgs e)
        {
            using (EmpresaXEntities ctx = new EmpresaXEntities())
            {
                tb_Estoque Produto = new tb_Estoque();

                if (!string.IsNullOrEmpty(HdfID.Value))
                {
                    int ID = Convert.ToInt32(HdfID.Value);

                    var Query = (from objProduto in ctx.tb_Estoque where objProduto.ID_Produto == ID select objProduto);

                    Produto = Query.FirstOrDefault();
                }
                Produto.NomeProduto = txtNomeProduto.Text;
                Produto.ID_Categoria = Convert.ToInt32(DdlCategoria.SelectedValue);
                Produto.Descricao = txtDescricao.Text;
                Produto.Preco = "R$ " + txtPreco.Text;
                Produto.Fabricante = txtFabricante.Text;
                Produto.DataDeFabricacao = txtDataFabricacaco.Text;
                Produto.Processador = txtProcessador.Text;
                Produto.Memoria = txtMemoria.Text;
                Produto.Armazenamento = txtArmazenamento.Text;
                Produto.Resolucao = txtResolucaoDeTela.Text;
                Produto.Dimensoes = txtDimensoes.Text;
                Produto.Peso = txtPeso.Text + "g";
                Produto.Status = txtStatus.Text;
                Produto.Deleted = 0;


                if (string.IsNullOrEmpty(HdfID.Value))
                {
                    ctx.tb_Estoque.Add(Produto);
                }

                ctx.SaveChanges();
                EsconderPaineis();
                PnlGridEstoque.Visible = true;
                AtualizaGrid();

            }
        }

        protected void BtCancelar_Click(object sender, EventArgs e)
        {
            EsconderPaineis();
            PnlBemVindo.Visible = true;
        }

    }
}