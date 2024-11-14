CREATE PROCEDURE [dbo].[SP_Order_Update]
	@id_order INT,
	@date_order DATETIME

AS
	UPDATE [Order] 
		SET [Id_Order] = @id_order ,
			[Date_Order] = @date_order 
		WHERE [Id_Order] = @id_order
