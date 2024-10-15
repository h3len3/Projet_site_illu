CREATE PROCEDURE [dbo].[SP_Product_Insert]
	@name_product NVARCHAR(64),
	@description_product NVARCHAR(MAX),
	@price_product DECIMAL(10,2),
	@name_category NVARCHAR(64)
AS
	INSERT INTO [Product] ([Name_Product],[Description_Product],[Price_Product],[Name_Category])
		OUTPUT [inserted].[Id_Product]
		VALUES (@name_product,@description_product,@price_product, @name_category)
