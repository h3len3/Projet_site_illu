using Shared_Projet_site_illu.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared_Projet_site_illu.Repositories
{
    public interface IOrderRepository<TEntity> : ICRUDRepository<TEntity, int>
    {
    }
}


