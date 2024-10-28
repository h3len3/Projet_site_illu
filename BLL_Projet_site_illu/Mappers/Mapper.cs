using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAL = DAL_Projet_site_illu.Entities;
using BLL = BLL_Projet_site_illu.Entities;

namespace BLL_Projet_site_illu.Mappers
{
    internal static class Mapper
    {
        #region Product
        public static BLL.Product ToBLL(this DAL.Product entity)
        {
            if (entity is null) return null;
            return new BLL.Product(
                entity.Id_Product,
                entity.Name_Product,
                entity.Description_Product,
                entity.Price_Product,
                entity.Name_Category);
        }

        public static DAL.Product ToDAL(this BLL.Product entity)
        {
            if (entity is null) return null;
            return new DAL.Product()
            {
                Id_Product = entity.Id_Product,
                Name_Product = entity.Name_Product,
                Description_Product = entity.Description_Product,
                Price_Product = entity.Price_Product,
                Name_Category = entity.Name_Category
            };
        }
        #endregion

    }
}
