using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared_Projet_site_illu.Repositories
{
    public interface ICRUDRepository<TEntity, TId>
    {
        IEnumerable<TEntity> Get();
        TEntity Get(TId id);
        TId Insert(TEntity entity);
        void Update(TEntity entity);
        void Delete(TId id);
    }
}
