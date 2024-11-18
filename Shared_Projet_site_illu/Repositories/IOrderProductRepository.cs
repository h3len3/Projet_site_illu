using Shared_Projet_site_illu.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared_Projet_site_illu.Repositories
{
    public interface IOrderProductRepository<TEntity> : ICRUDRepository<TEntity, int>
    {
        // TO DO une fois que d'autres proc stockées ajoutées : get by product , get by date 
        // TO DO quand user fait et relation : get by user
    }
}

public interface IDiffusionRepository<TEntity> : ICRUDRepository<TEntity, int>
{
    IEnumerable<TEntity> GetByCinemaPlace(int id_cinemaPlace);
    IEnumerable<TEntity> GetByMovie(int id_movie);
    IEnumerable<TEntity> GetByDate(DateTime diffusionDate);
}