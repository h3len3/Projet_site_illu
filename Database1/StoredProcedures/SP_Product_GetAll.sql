CREATE PROCEDURE [dbo].[SP_Product_GetAll]
	AS
	   SELECT [Id_Product],
	       [Name_Product],
	       [Description_Product],
	       [Price_Product],
	       [Name_Category]
	      
		   FROM [Product]
