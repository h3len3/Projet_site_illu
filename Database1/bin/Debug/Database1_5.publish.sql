/*
Script de déploiement pour Database1

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Database1"
:setvar DefaultFilePrefix "Database1"
:setvar DefaultDataPath "C:\Users\david\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MsSqlLocalDb\"
:setvar DefaultLogPath "C:\Users\david\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MsSqlLocalDb\"

GO
:on error exit
GO
/*
Détectez le mode SQLCMD et désactivez l'exécution du script si le mode SQLCMD n'est pas pris en charge.
Pour réactiver le script une fois le mode SQLCMD activé, exécutez ce qui suit :
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Le mode SQLCMD doit être activé de manière à pouvoir exécuter ce script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
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
            
GO


EXEC SP_Product_Insert 'Carte - fond vert - motifs fleuris', 'Carte - fond vert - motifs fleuris, papier glacé', 2, 'Carte';
EXEC SP_Product_Insert 'Carnet bleu', 'Carnet bleu, 100 pages', 11, 'Carnet';
EXEC SP_Product_Insert 'Marque-pages - fond vert - motif chat', 'Marque-pages - fond vert - motif chat - 10cm x 3cm', 4, 'Marque-pages';

DECLARE @today DATE = CONVERT(DATE,GETDATE());
DECLARE @now TIME = CONVERT(TIME,GETDATE());

EXEC SP_Order_Insert '01/01/24';

GO

GO
PRINT N'Mise à jour terminée.';


GO
