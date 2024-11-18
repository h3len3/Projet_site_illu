using DAL_Projet_site_illu.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace BLL_Projet_site_illu.Entities
{
    public class Order
    {
        private List<OrderProduct> _orderproducts;

        public int Id_Order { get; set; }
        public DateTime Date_Order { get; set; }

        public OrderProduct[] OrderProducts { get { return _orderproducts.ToArray(); } }

        private Order()
        {
            _orderproducts = new List<OrderProduct>();
        }

        public Order(int id_order, DateTime date_order)
        {
            Id_Order = id_order;
            Date_Order = date_order;

        }

        public void AddOrderProduct(OrderProduct orderproduct)
        {
            if (orderproduct is null) throw new ArgumentNullException(nameof(orderproduct), "Pas de commande");
            if (orderproduct.Product is null) throw new ArgumentNullException(nameof(orderproduct.Product), "La commande ne contient pas de produit(s)");
            _orderproducts ??= new List<OrderProduct>();
            _orderproducts.Add(orderproduct);
        }

    }
   
}