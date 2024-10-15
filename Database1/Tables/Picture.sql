CREATE TABLE [dbo].[Picture]
(
	[Id_Picture] INT IDENTITY NOT NULL PRIMARY KEY,
	[Name_Picture] NVARCHAR(64) NOT NULL,
	[Url_Picture] NVARCHAR(256) NOT NULL,

	[Id_Product] INT  NOT NULL,

	CONSTRAINT [FK_Media_Product] FOREIGN KEY ([Id_Product]) REFERENCES [Product]([Id_Product])
)
