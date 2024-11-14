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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Création de la base de données $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de Table [dbo].[Category]...';


GO
CREATE TABLE [dbo].[Category] (
    [Id_Category]   INT           IDENTITY (1, 1) NOT NULL,
    [Name_Category] NVARCHAR (64) NOT NULL,
    PRIMARY KEY CLUSTERED ([Name_Category] ASC)
);


GO
PRINT N'Création de Table [dbo].[Order]...';


GO
CREATE TABLE [dbo].[Order] (
    [Id_Order]   INT      NOT NULL,
    [Date_Order] DATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_Order] ASC)
);


GO
PRINT N'Création de Table [dbo].[Order_Product]...';


GO
CREATE TABLE [dbo].[Order_Product] (
    [Id_Order]   INT NOT NULL,
    [Id_Product] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_Order] ASC, [Id_Product] ASC)
);


GO
PRINT N'Création de Table [dbo].[Picture]...';


GO
CREATE TABLE [dbo].[Picture] (
    [Id_Picture]   INT            IDENTITY (1, 1) NOT NULL,
    [Name_Picture] NVARCHAR (64)  NOT NULL,
    [Url_Picture]  NVARCHAR (256) NOT NULL,
    [Id_Product]   INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_Picture] ASC)
);


GO
PRINT N'Création de Table [dbo].[Product]...';


GO
CREATE TABLE [dbo].[Product] (
    [Id_Product]          INT             IDENTITY (1, 1) NOT NULL,
    [Name_Product]        NVARCHAR (64)   NOT NULL,
    [Description_Product] NVARCHAR (MAX)  NOT NULL,
    [Price_Product]       DECIMAL (10, 2) NOT NULL,
    [Name_Category]       NVARCHAR (64)   NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_Product] ASC)
);


GO
PRINT N'Création de Clé étrangère contrainte sans nom sur [dbo].[Order_Product]...';


GO
ALTER TABLE [dbo].[Order_Product]
    ADD FOREIGN KEY ([Id_Order]) REFERENCES [dbo].[Order] ([Id_Order]);


GO
PRINT N'Création de Clé étrangère contrainte sans nom sur [dbo].[Order_Product]...';


GO
ALTER TABLE [dbo].[Order_Product]
    ADD FOREIGN KEY ([Id_Product]) REFERENCES [dbo].[Product] ([Id_Product]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Media_Product]...';


GO
ALTER TABLE [dbo].[Picture]
    ADD CONSTRAINT [FK_Media_Product] FOREIGN KEY ([Id_Product]) REFERENCES [dbo].[Product] ([Id_Product]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Product_Category]...';


GO
ALTER TABLE [dbo].[Product]
    ADD CONSTRAINT [FK_Product_Category] FOREIGN KEY ([Name_Category]) REFERENCES [dbo].[Category] ([Name_Category]);


GO
PRINT N'Création de Procédure [dbo].[SP_Category_Delete]...';


GO
CREATE PROCEDURE [dbo].[SP_Category_Delete]
	@id_category INT

AS
	DELETE FROM [Category]
		WHERE [Id_Category] = @id_category
GO
PRINT N'Création de Procédure [dbo].[SP_Category_GetAll]...';


GO
CREATE PROCEDURE [dbo].[SP_Category_GetAll]
	
AS
	SELECT [Name_Category]

	FROM [Category]
GO
PRINT N'Création de Procédure [dbo].[SP_Category_GetById]...';


GO
CREATE PROCEDURE [dbo].[SP_Category_GetById]
	@id_category INT
AS
	SELECT [Id_Category],
	       [Name_Category]
	 
		FROM [Category]
		WHERE [Id_Category] = @id_category
GO
PRINT N'Création de Procédure [dbo].[SP_Category_GetByName]...';


GO
CREATE PROCEDURE [dbo].[SP_Category_GetByName]
	@name_category NVARCHAR(64)

AS
	SELECT [Id_Category],
	       [Name_Category]
	     
		FROM [Category]
		WHERE [Name_Category] = @name_category
GO
PRINT N'Création de Procédure [dbo].[SP_Category_Insert]...';


GO
CREATE PROCEDURE [dbo].[SP_Category_Insert]
	@name_category NVARCHAR(64)

AS
	INSERT INTO [Category] ([Name_Category])
		OUTPUT [inserted].[Id_Category]
		VALUES (@name_category)
GO
PRINT N'Création de Procédure [dbo].[SP_Category_Update]...';


GO
CREATE PROCEDURE [dbo].[SP_Category_Update]
	@id_category INT,
	@name_category NVARCHAR(64)
AS

		UPDATE [Category] 
			SET [Name_Category] = @name_category 
			WHERE [Id_Category] = @id_category
GO
PRINT N'Création de Procédure [dbo].[SP_Picture_Delete]...';


GO
CREATE PROCEDURE [dbo].[SP_Picture_Delete]
	@id_picture int
AS
	DELETE FROM [Picture]
		WHERE [Id_Picture] = @id_picture
GO
PRINT N'Création de Procédure [dbo].[SP_Picture_GetAll]...';


GO
CREATE PROCEDURE [dbo].[SP_Picture_GetAll]
	
AS
	  SELECT [Id_Picture],
	       [Name_Picture],
	       [Url_Picture],
	       [Id_Product]
	       
		   FROM [Picture]
GO
PRINT N'Création de Procédure [dbo].[SP_Picture_GetById]...';


GO
CREATE PROCEDURE [dbo].[SP_Picture_GetById]
	@id_picture INT
AS
	SELECT [Id_Picture],
	       [Name_Picture],
	       [Url_Picture],
	       [Id_Product]
	       [Name_Category]
		FROM [Picture]
		WHERE [Id_Picture] = @id_picture
GO
PRINT N'Création de Procédure [dbo].[SP_Picture_Insert]...';


GO
CREATE PROCEDURE [dbo].[SP_Picture_Insert]
	
	@name_picture NVARCHAR(64),
	@url_picture NVARCHAR(256),
	@id_product INT	
AS
	INSERT INTO [Picture] ([Name_Picture],[Url_Picture], [Id_Product])
		OUTPUT [inserted].[Id_Picture]
		VALUES (@name_picture,@url_picture,@id_product)
GO
PRINT N'Création de Procédure [dbo].[SP_Picture_Update]...';


GO
CREATE PROCEDURE [dbo].[SP_Picture_Update]
	@id_picture INT ,
	@name_picture VARCHAR(64),
	@url_picture NVARCHAR(256),
	@id_product INT


AS
	UPDATE [Picture] 
		SET [Name_Picture] = @name_picture,
			[Url_Picture] = @url_picture,
			[Id_Product] = @id_product
			
		WHERE [Id_Picture] = @id_picture
GO
PRINT N'Création de Procédure [dbo].[SP_Product_Delete]...';


GO
CREATE PROCEDURE [dbo].[SP_Product_Delete]
	@id_product INT
	
AS
	DELETE FROM [Product]
		WHERE [Id_Product] = @id_product
GO
PRINT N'Création de Procédure [dbo].[SP_Product_GetAll]...';


GO
CREATE PROCEDURE [dbo].[SP_Product_GetAll]
	AS
	   SELECT [Id_Product],
	       [Name_Product],
	       [Description_Product],
	       [Price_Product],
	       [Name_Category]
	      
		   FROM [Product]
GO
PRINT N'Création de Procédure [dbo].[SP_Product_GetByCategory]...';


GO
CREATE PROCEDURE [dbo].[SP_Product_GetByCategory]
	@name_category NVARCHAR(64) 
AS
	SELECT [Id_Product],
	       [Name_Product],
	       [Description_Product],
	       [Price_Product],
	       [Name_Category]
		FROM [Product]
		WHERE [Name_Category] = @name_category
GO
PRINT N'Création de Procédure [dbo].[SP_Product_GetById]...';


GO
CREATE PROCEDURE [dbo].[SP_Product_GetById]
	@id_product INT
AS
	SELECT [Id_Product],
	       [Name_Product],
	       [Description_Product],
	       [Price_Product],
	       [Name_Category]
		FROM [Product]
		WHERE [Id_Product] = @id_product
GO
PRINT N'Création de Procédure [dbo].[SP_Product_GetByName]...';


GO
CREATE PROCEDURE [dbo].[SP_Product_GetByName]
	@name_product NVARCHAR(64) 

AS
	SELECT [Id_Product],
	       [Name_Product],
	       [Description_Product],
	       [Price_Product],
	       [Name_Category]
		FROM [Product]
		WHERE [Name_Product] = @name_product
GO
PRINT N'Création de Procédure [dbo].[SP_Product_Insert]...';


GO
CREATE PROCEDURE [dbo].[SP_Product_Insert]
	@name_product NVARCHAR(64),
	@description_product NVARCHAR(MAX),
	@price_product DECIMAL(10,2),
	@name_category NVARCHAR(64)
AS
	INSERT INTO [Product] ([Name_Product],[Description_Product],[Price_Product],[Name_Category])
		OUTPUT [inserted].[Id_Product]
		VALUES (@name_product,@description_product,@price_product, @name_category)
GO
PRINT N'Création de Procédure [dbo].[SP_Product_Update]...';


GO
CREATE PROCEDURE [dbo].[SP_Product_Update]
	@id_product INT,
	@name_product NVARCHAR(64),
	@description_product NVARCHAR(MAX),
	@price_product DECIMAL(10,2),
	@name_category NVARCHAR(64)

AS
	UPDATE [Product] 
		SET [Name_Product] = @name_product ,
			[Description_Product] = @description_product ,
			[Price_Product] = @price_product ,
			[Name_Category] = @name_category
		WHERE [Id_Product] = @id_product
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

/* DECLARE @today DATE = CONVERT(DATE,GETDATE()); */

/* EXEC SP_Order_Insert @today; */





GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Mise à jour terminée.';


GO
