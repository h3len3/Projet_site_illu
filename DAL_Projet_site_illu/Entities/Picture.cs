using DAL_Projet_site_illu.Entities;
using Humanizer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Projet_site_illu.Entities
{
    public class Picture
    {
        public int Id_Picture { get; set; }
        public string Name_Picture { get; set; }
        public string Url_Picture { get; set; }
        public int Id_Product { get; set; }

    }
}

/*
[Id_Picture] INT IDENTITY NOT NULL PRIMARY KEY,
[Name_Picture] NVARCHAR(64) NOT NULL,
[Url_Picture] NVARCHAR(256) NOT NULL,
[Id_Product] INT  NOT NULL,
 CONSTRAINT[FK_Media_Product] FOREIGN KEY ([Id_Product]) REFERENCES[Product]([Id_Product])
*/
