using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LojaProdutosEletronicos.Útil;

namespace LojaProdutosEletronicos
{
    public partial class PagFuncionarios : System.Web.UI.Page
    {
        //Métodos

        protected void AtualizaGrid()
        {
            GridFuncionarios.DataSource = Framework.GetDataTable("SELECT tb_Funcionarios.ID_Funcionario, tb_Setor.ID_Setor, tb_Funcionarios.Nome_Funcionario, tb_Funcionarios.Funcao, tb_Setor.Setor FROM tb_Funcionarios INNER JOIN tb_Setor ON tb_Funcionarios.ID_Setor = tb_Setor.ID_Setor WHERE tb_Funcionarios.Deleted = 0");
            GridFuncionarios.DataBind();
        }

        protected void EsconderPaineis()
        {
            PnlGridFuncionarios.Visible = false;
            PnlCadastroFuncionarios.Visible = false;
        }

        protected void LimpaCampos()
        {
            txtNomeFuncionario.Text =
            txtFuncao.Text =
            HdfID.Value =
            string.Empty;
        }

        protected void PopularDdlSetor()
        {
            DdlSetor.DataSource = Framework.GetDataTable("Select ID_Setor, Setor From tb_Setor where Deleted = 0");
            DdlSetor.DataBind();
            DdlSetor.Items.Insert(0, new ListItem("- Selecione -", "0"));
        }

        protected void PopulaCampos(int _cdID)
        {
            using (EmpresaXEntities ctx = new EmpresaXEntities())
            {
                tb_Funcionarios Funcionario = new tb_Funcionarios();

                int ID = _cdID;
                HdfID.Value = _cdID.ToString();

                var Query = (from objFuncionario in ctx.tb_Funcionarios where objFuncionario.ID_Funcionario == ID select objFuncionario).FirstOrDefault();

                txtNomeFuncionario.Text = Query.Nome_Funcionario;
                DdlSetor.SelectedValue = Query.ID_Setor.ToString();
                txtFuncao.Text = Query.Funcao;
            }
        }

        protected void GridFuncionarios_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            GridFuncionarios.DataSource = Framework.GetDataTable("SELECT tb_Funcionarios.ID_Funcionario, tb_Setor.ID_Setor, tb_Funcionarios.Nome_Funcionario, tb_Funcionarios.Funcao, tb_Setor.Setor FROM tb_Funcionarios INNER JOIN tb_Setor ON tb_Funcionarios.ID_Setor = tb_Setor.ID_Setor WHERE tb_Funcionarios.Deleted = 0");
        }

    //ItemCommand

    protected void GridFuncionarios_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                int cdID = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ID_Funcionario"]);

                switch (e.CommandName)
                {
                    case "opEditar":
                        EsconderPaineis();
                        LimpaCampos();
                        PopulaCampos(cdID);
                        AtualizaGrid();
                        PnlCadastroFuncionarios.Visible = true;
                        break;

                    case "opExcluir":
                        using (EmpresaXEntities ctx = new EmpresaXEntities())
                        {
                            tb_Funcionarios Funcionario = new tb_Funcionarios();

                            int ID = cdID;
                            HdfID.Value = cdID.ToString();

                            var Query = (from objFuncionario in ctx.tb_Funcionarios where objFuncionario.ID_Funcionario == ID select objFuncionario).FirstOrDefault();

                            Query.Deleted = 1;
                            ctx.SaveChanges();
                            AtualizaGrid();
                        }
                        break;

                }
            }
            catch (Exception ex)
            {
                Response.Write("Error, " + ex.Message);
            }
        }

        //Click

        protected void BtCadastrarNovoFuncionario_Click(object sender, EventArgs e)
        {
            EsconderPaineis();
            LimpaCampos();
            PnlCadastroFuncionarios.Visible = true;
        }

        protected void BtListaFuncionarios_Click(object sender, EventArgs e)
        {
            EsconderPaineis();
            AtualizaGrid();
            PnlGridFuncionarios.Visible = true;
        }

        protected void BtSalvar_Click(object sender, EventArgs e)
        {
            using (EmpresaXEntities ctx = new EmpresaXEntities())
            {
                tb_Funcionarios Funcionario = new tb_Funcionarios();

                if (!string.IsNullOrEmpty(HdfID.Value))
                {
                    int ID = Convert.ToInt32(HdfID.Value);

                    var Query = (from objFuncionario in ctx.tb_Funcionarios where objFuncionario.ID_Funcionario == ID select objFuncionario);

                    Funcionario = Query.FirstOrDefault();
                }
                else
                {
                    Funcionario.Nome_Funcionario = txtNomeFuncionario.Text;
                    Funcionario.Funcao = txtFuncao.Text;
                    Funcionario.ID_Setor = Convert.ToInt32(DdlSetor.SelectedValue);
                    Funcionario.Deleted = 0;

                    if (string.IsNullOrEmpty(HdfID.Value))
                    {
                        ctx.tb_Funcionarios.Add(Funcionario);
                    }

                    ctx.SaveChanges();
                    EsconderPaineis();
                    PnlGridFuncionarios.Visible = true;
                    AtualizaGrid();
                }
            }
        }

        protected void BtCancelar_Click(object sender, EventArgs e)
        {
            EsconderPaineis();
            PnlOpcoes.Visible = true;
        }

        //Programa Principal

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopularDdlSetor();
            }
        }

        
    }
}