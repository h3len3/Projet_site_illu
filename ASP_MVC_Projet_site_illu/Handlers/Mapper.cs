using ASP_MVC_Projet_site_illu.Models;
using BLL_Projet_site_illu.Entities;

namespace ASP_MVC_Projet_site_illu.Handlers
{
    public static class Mapper
    {
        public static ProductListItemViewModel ToListItem(this Product entity)
        {
            if (entity is null) return null;
            return new ProductListItemViewModel
            {
                Id_Product = entity.Id_Product,
                Name_Product = entity.Name_Product,
                Description_Product = entity.Description_Product,
                Price_Product = entity.Price_Product,
                Name_Category = entity.Name_Category

            };
        }

        public static ProductDetailsViewModel ToDetails(this Product entity)
        {
            if (entity is null) return null;
            return new ProductDetailsViewModel
            {
                Id_Product = entity.Id_Product,
                Name_Product = entity.Name_Product,
                Description_Product = entity.Description_Product,
                Price_Product = entity.Price_Product,
                Name_Category = entity.Name_Category
            };
        }
    }
}
