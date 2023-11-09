using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LojaProdutosEletronicos.Útil;

namespace LojaProdutosEletronicos
{
    public partial class PagProdutos : System.Web.UI.Page
    {
        //Métodos

        protected void AtualizaGrid()
        {
            GridProdutos.DataSource = Framework.GetDataTable("SELECT tb_Produtos.ID_Produto, tb_Produtos.Produto, tb_Categorias.ID_Categoria, tb_Categorias.Categoria, tb_Produtos.Descricao " +
                                                              "FROM tb_Produtos " +
                                                              "INNER JOIN tb_Categorias " +
                                                              "ON tb_Produtos.ID_Categoria = tb_Categorias.ID_Categoria " +
                                                              "WHERE tb_Produtos.Deleted = 0");
            GridProdutos.DataBind();
        }

        protected void EsconderPaineis()
        {
            PnlGridProdutos.Visible = false;
            PnlCadastroProdutos.Visible = false;
        }

        protected void LimpaCampos()
        {
            txtNomeProduto.Text =
            txtDescricao.Text =
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
                tb_Produtos Produto = new tb_Produtos();

                int ID = _cdID;
                HdfID.Value = _cdID.ToString();

                var Query = (from objProduto in ctx.tb_Produtos where objProduto.ID_Produto == ID select objProduto).FirstOrDefault();

                txtNomeProduto.Text = Query.Produto;
                DdlCategoria.SelectedValue = Query.ID_Categoria.ToString();
                txtDescricao.Text = Query.Descricao;
            }
        }

        //NeedDataSource

        protected void Grid_Produtos_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            GridProdutos.DataSource = Framework.GetDataTable("SELECT tb_Produtos.ID_Produto, tb_Produtos.Produto, tb_Categorias.ID_Categoria, tb_Categorias.Categoria, tb_Produtos.Descricao " +
                                                              "FROM tb_Produtos " +
                                                              "INNER JOIN tb_Categorias " +
                                                              "ON tb_Produtos.ID_Categoria = tb_Categorias.ID_Categoria " +
                                                              "WHERE tb_Produtos.Deleted = 0");
        }

        //ItemCommand

        protected void GridProdutos_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
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
                        PnlCadastroProdutos.Visible = true;
                        break;

                    case "opExcluir":
                        using (EmpresaXEntities ctx = new EmpresaXEntities())
                        {
                            tb_Produtos Produto = new tb_Produtos();

                            int ID = _cdID;
                            HdfID.Value = _cdID.ToString();

                            var Query = (from objProduto in ctx.tb_Produtos where objProduto.ID_Produto == ID select objProduto).FirstOrDefault();

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

        //Programa

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopularDdlCategoria();
            }
        }

        //Click

        protected void BtSalvar_Click(object sender, EventArgs e)
        {
            using (EmpresaXEntities ctx = new EmpresaXEntities())
            {
                tb_Produtos Produto = new tb_Produtos();

                if (!string.IsNullOrEmpty(HdfID.Value))
                {
                    int ID = Convert.ToInt32(HdfID.Value);

                    var Query = (from objProduto in ctx.tb_Produtos where objProduto.ID_Produto == ID select objProduto);

                    Produto = Query.FirstOrDefault();
                }
                Produto.Produto = txtNomeProduto.Text;
                Produto.ID_Categoria = Convert.ToInt32(DdlCategoria.SelectedValue);
                Produto.Descricao = txtDescricao.Text;
                Produto.Deleted = 0;

                if (string.IsNullOrEmpty(HdfID.Value))
                {
                    ctx.tb_Produtos.Add(Produto);
                }

                ctx.SaveChanges();
                EsconderPaineis();
                PnlGridProdutos.Visible = true;
                AtualizaGrid();
            }
        }

        protected void BtCancelar_Click(object sender, EventArgs e)
        {
            EsconderPaineis();
            PnlGridProdutos.Visible = true;
        }

        protected void BtNovoRegistro_Click(object sender, EventArgs e)
        {
            EsconderPaineis();
            LimpaCampos();
            PnlCadastroProdutos.Visible = true;
        }
    }
}