using Humanizer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Projet_site_illu.Entities
{
    public class Product
    {
        public int Id_Product { get; set; }
        public string Name_Product { get; set; }
        public string Description_Product { get; set; }
        public decimal Price_Product { get; set; }
        public string Name_Category { get; set; }
    }
}

/*
[Id_Product] INT IDENTITY NOT NULL PRIMARY KEY,
[Name_Product] NVARCHAR(64) NOT NULL,
[Description_Product] NVARCHAR(MAX) NOT NULL,
[Price_Product] DECIMAL(10,2) NOT NULL,
[Name_Category] NVARCHAR(64) NOT NULL,
  CONSTRAINT[FK_Product_Category] FOREIGN KEY ([Name_Category]) REFERENCES[Category]([Name_Category])
*/