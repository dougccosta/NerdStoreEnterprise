using FluentValidation.Results;
using Microsoft.EntityFrameworkCore;
using NSE.Clientes.API.Models;
using NSE.Core.Data;
using NSE.Core.DomainObjects;
using NSE.Core.Mediator;
using NSE.Core.Messages;
using System.Linq;
using System.Threading.Tasks;

namespace NSE.Clientes.API.Data
{
    public sealed class ClientesContext : DbContext, IUnitOfWork
    {
        private IMediatorHandler mediatorHandler;

        public ClientesContext(DbContextOptions<ClientesContext> options, IMediatorHandler mediatorHandler)
            : base(options)
        {
            ChangeTracker.QueryTrackingBehavior = QueryTrackingBehavior.NoTracking;
            ChangeTracker.AutoDetectChangesEnabled = false;
            this.mediatorHandler = mediatorHandler;
        }

        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<Endereco> Enderecos { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Ignore<ValidationResult>();
            modelBuilder.Ignore<Event>();

            foreach (var property in modelBuilder.Model.GetEntityTypes().SelectMany(
                e => e.GetProperties().Where(p => p.ClrType == typeof(string))))
                property.SetColumnType("varchar(100)");

            foreach (var relationship in modelBuilder.Model.GetEntityTypes()
                .SelectMany(e => e.GetForeignKeys())) relationship.DeleteBehavior = DeleteBehavior.ClientSetNull;

            modelBuilder.ApplyConfigurationsFromAssembly(typeof(ClientesContext).Assembly);
        }

        public async Task<bool> Commit()
        {
            var sucesso = await base.SaveChangesAsync() > 0;

            if (sucesso) await mediatorHandler.PulicarEventos(this);

            return sucesso;
        }
    }

    public static class MediatorExtension
    {
        public static async Task PulicarEventos<T>(this IMediatorHandler mediator, T ctx) where T : DbContext
        {
            var domainEntities = ctx.ChangeTracker
            .Entries<Entity>()
            .Where(x => x.Entity.Eventos != null && x.Entity.Eventos.Any());

            var domainEvents = domainEntities
                .SelectMany(x => x.Entity.Eventos)
                .ToList();

            domainEntities.ToList()
                .ForEach(entity => entity.Entity.LimparEventos());

            var tasks = domainEvents
                .Select(async (domainEvent) =>
                {
                    await mediator.PublicarEvento(domainEvent);
                });

            await Task.WhenAll(tasks);
        }
    }
}
