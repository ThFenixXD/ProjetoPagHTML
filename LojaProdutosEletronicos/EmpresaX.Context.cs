﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LojaProdutosEletronicos
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class EmpresaXEntities : DbContext
    {
        public EmpresaXEntities()
            : base("name=EmpresaXEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tb_Categorias> tb_Categorias { get; set; }
        public virtual DbSet<tb_Produtos> tb_Produtos { get; set; }
        public virtual DbSet<tb_Funcionarios> tb_Funcionarios { get; set; }
        public virtual DbSet<tb_Setor> tb_Setor { get; set; }
        public virtual DbSet<tb_Estoque> tb_Estoque { get; set; }
    }
}
