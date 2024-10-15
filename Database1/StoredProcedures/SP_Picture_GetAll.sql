CREATE PROCEDURE [dbo].[SP_Picture_GetAll]
	
AS
	  SELECT [Id_Picture],
	       [Name_Picture],
	       [Url_Picture],
	       [Id_Product]
	       
		   FROM [Picture]

		 