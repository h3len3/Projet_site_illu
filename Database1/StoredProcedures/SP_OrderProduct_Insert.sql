CREATE PROCEDURE [dbo].[SP_OrderProduct_Insert]
	@id_order INT,
	@id_product INT
AS
	INSERT INTO [OrderProduct] ([Id_Order],[Id_Product])
		OUTPUT [inserted].[Id_OrderProduct]
		VALUES (@id_order, @id_product)
