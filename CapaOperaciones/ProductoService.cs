using CapaDato.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaOperaciones
{
    public class ProductoService : CRUDService<Producto>
    {
        private LicTomContainer db;

        public ProductoService(LicTomContainer db) : base(db)
        {
            if (db == null)
                this.db = new LicTomContainer();
            else
                this.db = db;
        }

        #region Valiciones del CRUD

        public string ValidarAntesCrear(Producto producto)
        {
            if (db.Producto.Any(x => x.Nombre.Trim().ToLower() == producto.Nombre.Trim().ToLower()))
                return "existe un nombre igual en los productos";

            return string.Empty;
        }

        public string ValidarAntesActualizar(Producto producto)
        {
            var productoDb = db.Producto.Find(producto.Id);

            if (productoDb == null)
                return "el producto a modificar ya no existe en el sistema";

            if (productoDb.Nombre == producto.Nombre)
                return string.Empty;

            return ValidarAntesCrear(producto);
        }
        public string ValidarAntesEliminar(int id)
        {
            var productoDb = db.Producto.Find(id);

            if (productoDb == null)
                return "El Producto a modificar ya no existe en el sistema";


            return string.Empty;
        }

        #endregion
    }
}




