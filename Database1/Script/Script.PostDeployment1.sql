/*
Modèle de script de post-déploiement							
--------------------------------------------------------------------------------------
 Ce fichier contient des instructions SQL qui seront ajoutées au script de compilation.		
 Utilisez la syntaxe SQLCMD pour inclure un fichier dans le script de post-déploiement.			
 Exemple :      :r .\monfichier.sql								
 Utilisez la syntaxe SQLCMD pour référencer une variable dans le script de post-déploiement.		
 Exemple :      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

insert into [Category]
    values  ('Carte'),
            ('Carnet'),
            ('Marque-pages');  
            
go


EXEC SP_Product_Insert 'Carte - fond vert - motifs fleuris', 'Carte - fond vert - motifs fleuris, papier glacé', 2, 'Carte';
EXEC SP_Product_Insert 'Carnet bleu', 'Carnet bleu, 100 pages', 11, 'Carnet';
EXEC SP_Product_Insert 'Marque-pages - fond vert - motif chat', 'Marque-pages - fond vert - motif chat - 10cm x 3cm', 4, 'Marque-pages';

/* DECLARE @today DATE = CONVERT(DATE,GETDATE()); */

/* EXEC SP_Order_Insert @today; */





