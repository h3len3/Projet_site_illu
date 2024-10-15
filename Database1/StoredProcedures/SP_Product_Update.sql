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
