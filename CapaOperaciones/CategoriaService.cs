using CapaDato.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaOperaciones
{
    public class CategoriaService : CRUDService<Categoria>
    {
        private LicTomContainer db;

        public CategoriaService(LicTomContainer db) : base(db)
        {
            if (db == null)
                this.db = new LicTomContainer();
            else
                this.db = db;
        }

        public string ValidarAntesCrear(Categoria categoria)
        {
            if (db.Categoria.Any(x => x.Codigo == categoria.Codigo))
                return "Ya existe una Categoria con el mismo codigo, Verifique y Vuelva a intentar";

            return string.Empty;
        }

        public string ValidarAntesActualizar(Categoria categoria)
        {
            var categoriaDb = db.Categoria.Find(categoria.Id);

            if (categoriaDb == null)
                return " La Categoria a modificar ya no existe en el sistema";

            if (categoria.Codigo == categoriaDb.Codigo)
                return string.Empty;

            return ValidarAntesCrear(categoria);
        }

        public string ValidarAntesEliminar(int id)
        {
            var categoriaDb = db.Categoria.Find(id);

            if (categoriaDb == null)
                return "La Categoria a modificar ya no existe en el sistema";


            return string.Empty;
        }
    }
}
