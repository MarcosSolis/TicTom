using CapaDato.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaOperaciones
{
    public class ClienteService : CRUDService<Cliente>
    {
        private LicTomContainer db;

        public ClienteService(LicTomContainer db) : base(db)
        {
            if (db == null)
                this.db = new LicTomContainer();
            else
                this.db = db;
        }

        public string ValidarAntesCrear(Cliente cliente)
        {
            if (db.Cliente.Any(x => x.Nombre == cliente.Nombre))
                return "Ya existe un Cliente con el mismo Nombre, Verifique y Vuelva a intentar";

            return string.Empty;
        }

        public string ValidarAntesActualizar(Cliente cliente)
        {
            var clienteDb = db.Cliente.Find(cliente.Id);

            if (clienteDb == null)
                return "El Cliente a modificar ya no existe en el sistema";

            if (cliente.Nombre == clienteDb.Nombre)
                return string.Empty;

            return ValidarAntesCrear(cliente);
        }

        public string ValidarAntesEliminar(int id)
        {
            var estudianteDb = db.Cliente.Find(id);

            if (estudianteDb == null)
                return "El Cliente a modificar ya no existe en el sistema";


            return string.Empty;
        }
    }
}
