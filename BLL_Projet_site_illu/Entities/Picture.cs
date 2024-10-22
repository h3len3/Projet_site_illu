using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Projet_site_illu.Entities
{
    public class Picture
    {
        public int Id_Picture { get; set; }
        public string Name_Picture { get; set; }
        public string Url_Picture { get; set; }
        public int Id_Product { get; set; }

        public Picture(int id_picture, string name_picture, string url_picture, int id_product)
        {
            Id_Picture = id_picture;
            Name_Picture = name_picture;
            Url_Picture = url_picture;
            Id_Product = id_product;         
        }
    }
}
