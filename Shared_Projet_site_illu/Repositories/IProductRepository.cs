using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared_Projet_site_illu.Repositories
{
    public interface IProductRepository<TEntity> : ICRUDRepository<TEntity, int>
    {
        // IEnumerable<TEntity> GetByName(string name);
        IEnumerable<TEntity> GetByCategory(string category);

    }
}
