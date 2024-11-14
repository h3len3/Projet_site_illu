CREATE PROCEDURE [dbo].[SP_Order_GetAll]
	AS
	   SELECT [Id_Order],
	       [Date_Order]
	        
		   FROM [Order]
