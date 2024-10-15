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
