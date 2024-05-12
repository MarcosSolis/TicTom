using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;

namespace CapaOperaciones
{
    public class CRUDService<T> where T : class
    {
        
        private DbContext db;
        public CRUDService(DbContext db)
        {
            this.db = db;
        }

        public List<T> GetAll()
        {
            return db.Set<T>().ToList();
        }

        public List<T> GetAll(Expression<Func<T, bool>> expression)
        {
            return db.Set<T>().Where(expression).ToList();
        }

      
        public bool Crear(T entidad)
        {
            db.Entry(entidad).State = EntityState.Added;
            return db.SaveChanges() > 0;
        }

       
        public void Actualizar(T entidad)
        {
            db.Entry(entidad).State = EntityState.Modified;

            db.SaveChanges();

        }

        
        public bool Eliminar(int id)
        {
            var entidad = db.Set<T>().Find(id);

            db.Entry(entidad).State = EntityState.Deleted;

            return db.SaveChanges() > 0;
        }

       
        public T BuscarId(int id)
        {
            var entidad = db.Set<T>().Find(id);
            return entidad;
        }
    }
}
    
