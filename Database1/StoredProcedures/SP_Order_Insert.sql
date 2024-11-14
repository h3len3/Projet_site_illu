CREATE PROCEDURE [dbo].[SP_Order_Insert]
	@date_order DATETIME
	
AS
	INSERT INTO [Order] ([Date_Order])
		OUTPUT [inserted].[Id_Order]
		VALUES (@date_order)
