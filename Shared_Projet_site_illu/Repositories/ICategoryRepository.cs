using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared_Projet_site_illu.Repositories
{
    public interface ICategoryRepository<TEntity> : ICRUDRepository<TEntity, string>
    {
    }
}
