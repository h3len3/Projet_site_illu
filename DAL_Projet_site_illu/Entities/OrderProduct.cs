using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Projet_site_illu.Entities
{
    public class OrderProduct
    {
        public int Id_OrderProduct { get; set; }
        public int Id_Order { get; set; }
        public int Id_Product { get; set; }

    }
}

// Id_OrderProduct INT NOT NULL PRIMARY KEY,
// Id_Order INT,
// Id_Product INT,
