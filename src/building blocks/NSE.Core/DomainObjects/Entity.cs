using NSE.Core.Messages;
using System;
using System.Collections.Generic;

namespace NSE.Core.DomainObjects
{
    public abstract class Entity
    {
        public Guid Id { get; set; }

        public Entity()
        {
            Id = Guid.NewGuid();
        }

        private List<Event> eventos;
        public IReadOnlyCollection<Event> Eventos => eventos?.AsReadOnly();

        public void AdicionarEvento(Event evento)
        {
            eventos = eventos ?? new List<Event>();
            eventos.Add(evento);
        }

        public void RemoverEvento(Event evento)
        {
            eventos?.Remove(evento);
        }

        public void LimparEventos()
        {
            eventos?.Clear();
        }

        #region Comparações
        public override bool Equals(object obj)
        {
            var comparteTo = obj as Entity;

            if (ReferenceEquals(this, comparteTo)) return true;
            if (ReferenceEquals(null, comparteTo)) return false;

            return Id.Equals(comparteTo.Id);
        }

        public static bool operator ==(Entity a, Entity b)
        {
            if (ReferenceEquals(a, null) && ReferenceEquals(b, null))
                return true;

            if (ReferenceEquals(a, null) || ReferenceEquals(b, null))
                return false;


            return a.Equals(b);
        }

        public static bool operator !=(Entity a, Entity b)
        {
            return !(a == b);
        }

        public override int GetHashCode()
        {
            return (GetType().GetHashCode() * 907) + Id.GetHashCode();
        }

        public override string ToString()
        {
            return $"{GetType().Name} [Id={Id}]";
        }
        #endregion
    }
}
