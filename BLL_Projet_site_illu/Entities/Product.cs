using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Projet_site_illu.Entities
{
    public class Product
    {
        public int Id_Product { get; set; }
        public string Name_Product { get; set; }
        public string Description_Product { get; set; }
        public decimal Price_Product { get; set; }
        public string Name_Category { get; set; }

        public Product(int id_product, string name_product, string description_product, decimal price_product, string name_category)
        {
            Id_Product = id_product;
            Name_Product = name_product;
            Description_Product = description_product;
            Price_Product = price_product;
            Name_Category = name_category;

        }
    }
    
}
