CREATE TABLE [dbo].[Product]
(
	[Id_Product] INT IDENTITY NOT NULL PRIMARY KEY,
	[Name_Product] NVARCHAR(64) NOT NULL,
	[Description_Product] NVARCHAR(MAX) NOT NULL,
	[Price_Product] DECIMAL(10,2) NOT NULL,

	[Name_Category] NVARCHAR(64) NOT NULL,
	
	CONSTRAINT [FK_Product_Category] FOREIGN KEY ([Name_Category]) REFERENCES [Category]([Name_Category])
	
)
