using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Projet_site_illu.Entities
{
    public class OrderProduct
    {
        public int Id_OrderProduct { get; set; }
        public int Id_Order { get; set; }
        public int Id_Product { get; set; }

        public OrderProduct (int id_orderproduct, int id_order, int id_product)
        {
            Id_OrderProduct = id_orderproduct;
            Id_Order = id_order;
            Id_Product = id_product;
        }
     
    }
}
