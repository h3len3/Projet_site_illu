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
