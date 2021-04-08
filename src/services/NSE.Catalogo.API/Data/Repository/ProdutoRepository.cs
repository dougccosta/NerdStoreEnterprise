using Microsoft.EntityFrameworkCore;
using NSE.Catalogo.API.Models;
using NSE.Core.Data;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace NSE.Catalogo.API.Data.Repository
{
    public class ProdutoRepository : IProdutoRepository
    {
        private readonly CatalogoContext context;

        public ProdutoRepository(CatalogoContext context)
        {
            this.context = context;
        }

        public IUnitOfWork UnitOfWork => context;

        public async Task<IEnumerable<Produto>> ObterTodos()
        {
            return await context.Produtos.AsNoTracking().ToListAsync();
        }

        public async Task<Produto> ObterPorId(Guid id)
        {
            return await context.Produtos.FindAsync(id);
        }

        public void Atualizar(Produto produto)
        {
            context.Produtos.Update(produto);
        }

        public void Adicionar(Produto produto)
        {
            context.Produtos.Add(produto);
        }

        public void Dispose()
        {
            context?.Dispose();
        }
    }
}
