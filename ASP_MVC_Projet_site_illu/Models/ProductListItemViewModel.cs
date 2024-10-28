using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace ASP_MVC_Projet_site_illu.Models
{
    public class ProductListItemViewModel
    {
        [ScaffoldColumn(false)]
        public int Id_Product { get; set; }
        [DisplayName("Nom")]
        public string Name_Product { get; set; }
        [DisplayName("Description")]
        public string Description_Product { get; set; }
        [DisplayName("Prix (en €)")]
        public decimal Price_Product { get; set; }
        [DisplayName("Eco Score")]
        public string Name_Category { get; set; }
    }
}
