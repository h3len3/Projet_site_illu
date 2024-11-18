using Humanizer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Projet_site_illu.Entities
{
    public class Order
    {
        public int Id_Order { get; set; }
        public DateTime Date_Order { get; set; }
    }
}


// [Id_Order] INT NOT NULL PRIMARY KEY,
// [Date_Order] DATETIME NOT NULL