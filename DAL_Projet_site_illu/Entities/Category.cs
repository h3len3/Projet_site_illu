using Humanizer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Projet_site_illu.Entities
{
    public class Category
    {
        public int Id_Category { get; set; }
        public string Name_Category { get; set; }
    }
    
}

/*
[Id_Category] INT IDENTITY NOT NULL,
[Name_Category] NVARCHAR(64) NOT NULL PRIMARY KEY
*/
