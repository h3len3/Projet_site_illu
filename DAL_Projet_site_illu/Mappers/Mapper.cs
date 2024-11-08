using DAL_Projet_site_illu.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Projet_site_illu.Mappers
{
    internal static class Mapper
    {
        public static Product ToProduct(this IDataRecord record)
        {
            if (record is null) return null;
            return new Product()
            {
                Id_Product = (int)record["Id_Product"],
                Name_Product = (string)record["Name_Product"],
                Description_Product = (string)record["Description_Product"],
                Price_Product = (decimal)record["Price_Product"],
                Name_Category = (string)record["Name_Category"]
            };
        }

        public static Category ToCategory(this IDataRecord record)
        {
            if (record is null) return null;
            return new Category()
            {
                Id_Category = (int)record["Id_Category"],
                Name_Category = (string)record["Name_Category"]        
            };
        }
    }
}

/*
Id_Product = id_product;
Name_Product = name_product;
Description_Product = description_product;
Price_Product = price_product;
Name_Category = name_category;
*/
