using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Projet_site_illu.Entities
{
    public class Category
    {
        public int Id_Category { get; set; }
        public string Name_Category { get; set; }
        public Category(int id_category, string name_category)
        {
            Id_Category = id_category;
            Name_Category = name_category;
        }
    }
}
