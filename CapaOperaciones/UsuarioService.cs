using CapaDato.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaOperaciones
{
    public class UsuarioService : CRUDService<Usuario>
    {
        private LicTomContainer db;

        public UsuarioService(LicTomContainer db) : base(db)
        {
            if (db == null)
                this.db = new LicTomContainer();
            else
                this.db = db;
        }

       
        public string ValidarAntesCrear(Usuario usuario)
        {
            if (db.Usuario.Any(x => x.User == usuario.User))
                return "Ya existe un usuario con el mismo user, Verifique y Vuelva a intentar";

            return string.Empty;
        }

      
        public string ValidarAntesActualizar(Usuario usuario)
        {
            var usuarioDb = db.Usuario.Find(usuario.Id);

            if (usuarioDb == null)
                return "El usuario a modificar ya no existe en el sistema";

            if (usuario.User == usuarioDb.User)
                return string.Empty;

            return ValidarAntesCrear(usuario);
        }

        public string ValidarAntesEliminar(int id)
        {
            var usuarioDb = db.Usuario.Find(id);

            if (usuarioDb == null)
                return "El usuario a modificar ya no existe en el sistema";


            return string.Empty;
        }

    }
}
