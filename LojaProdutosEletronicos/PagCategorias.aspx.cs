using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LojaProdutosEletronicos.Útil;

namespace LojaProdutosEletronicos
{
    public partial class PagCategorias : System.Web.UI.Page
    {
        //Métodos

        protected void AtualizaGrid()
        {
            GridCategorias.DataSource = Framework.GetDataTable("SELECT ID_Categoria, ID_Categoria, Categoria From tb_Categorias WHERE tb_Categorias.Deleted = 0");
            GridCategorias.DataBind();
        }

        protected void EsconderPaineis()
        {
            PnlGridCategorias.Visible = false;
            PnlCadastroCategorias.Visible = false;
        }

        protected void LimpaCampos()
        {
            txtNomeCategoria.Text =
            HdfID.Value =
            string.Empty;
        }

        protected void PopulaCampos(int _cdID)
        {
            using (EmpresaXEntities ctx = new EmpresaXEntities())
            {
                tb_Categorias Categoria = new tb_Categorias();

                int ID = _cdID;
                HdfID.Value = _cdID.ToString();

                var Query = (from objCategoria in ctx.tb_Categorias where objCategoria.ID_Categoria == ID select objCategoria).FirstOrDefault();

                txtNomeCategoria.Text = Query.Categoria;
            }
        }

        //NeedDataSource

        protected void GridCategorias_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            GridCategorias.DataSource = Framework.GetDataTable("SELECT ID_Categoria, ID_Categoria, Categoria From tb_Categorias WHERE tb_Categorias.Deleted = 0");
        }

        //ItemCommand

        protected void GridCategorias_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                int _cdID = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ID_Categoria"]);

                switch (e.CommandName)
                {
                    case "opEditar":
                        EsconderPaineis();
                        LimpaCampos();
                        PopulaCampos(_cdID);
                        PnlCadastroCategorias.Visible = true;
                        break;

                    case "opExcluir":
                        using (EmpresaXEntities ctx = new EmpresaXEntities())
                        {
                            tb_Categorias Categoria = new tb_Categorias();

                            int ID = _cdID;
                            HdfID.Value = _cdID.ToString();

                            var Query = (from objCategoria in ctx.tb_Categorias where objCategoria.ID_Categoria == ID select objCategoria).FirstOrDefault();

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

        //Click

        protected void BtCadastrarCategoria_Click(object sender, EventArgs e)
        {
            EsconderPaineis();
            LimpaCampos();
            PnlCadastroCategorias.Visible = true;
        }

        protected void BtSalvar_Click(object sender, EventArgs e)
        {
            using (EmpresaXEntities ctx = new EmpresaXEntities())
            {
                tb_Categorias Categoria = new tb_Categorias();

                if (!string.IsNullOrEmpty(HdfID.Value))
                {
                    int ID = Convert.ToInt32(HdfID.Value);

                    var Query = (from objCategoria in ctx.tb_Categorias where objCategoria.ID_Categoria == ID select objCategoria);

                    Categoria = Query.FirstOrDefault();
                }
                else
                {
                    Categoria.Categoria = txtNomeCategoria.Text;
                    Categoria.Deleted = 0;

                    if (string.IsNullOrEmpty(HdfID.Value))
                    {
                        ctx.tb_Categorias.Add(Categoria);
                    }

                    ctx.SaveChanges();
                    EsconderPaineis();
                    PnlGridCategorias.Visible = true;
                    AtualizaGrid();
                }
            }
        }

        protected void BtCancelar_Click(object sender, EventArgs e)
        {
            EsconderPaineis();
            AtualizaGrid();
            PnlGridCategorias.Visible = true;
        }

        //Programa Principal

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
    }
}