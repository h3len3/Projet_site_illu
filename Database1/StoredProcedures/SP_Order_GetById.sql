CREATE PROCEDURE [dbo].[SP_Order_GetById]
	@id_order INT
AS
	SELECT [Id_Order],
	       [Date_Order]
	       
		FROM [Order]
		WHERE [Id_Order] = @id_order

