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
		
