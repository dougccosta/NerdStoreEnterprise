using Microsoft.EntityFrameworkCore;
using NSE.Clientes.API.Models;
using NSE.Core.Data;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace NSE.Clientes.API.Data.Repository
{
    public class ClienteRepository : IClienteRepository
    {
        private readonly ClientesContext context;

        public ClienteRepository(ClientesContext context)
        {
            this.context = context;
        }

        public IUnitOfWork UnitOfWork => context;
        
        public async Task<IEnumerable<Cliente>> ObterTodos()
        {
            return await context.Clientes.AsNoTracking().ToListAsync();
        }

        public void Adicionar(Cliente cliente)
        {
            context.Clientes.Add(cliente);
        }

        public async Task<Cliente> ObterPorCpf(string cpf)
        {
            return await context.Clientes.FirstOrDefaultAsync(c => c.Cpf.Numero == cpf);
        }

        public void Dispose()
        {
            context?.Dispose();
        }

    }
}
