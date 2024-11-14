CREATE PROCEDURE [dbo].[SP_Order_Delete]
	@id_order INT
AS
	DELETE FROM [Order]
		WHERE [Id_Order] = @id_order
