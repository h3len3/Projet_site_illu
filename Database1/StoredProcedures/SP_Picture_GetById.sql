CREATE PROCEDURE [dbo].[SP_Picture_GetById]
	@id_picture INT
AS
	SELECT [Id_Picture],
	       [Name_Picture],
	       [Url_Picture],
	       [Id_Product]
	       [Name_Category]
		FROM [Picture]
		WHERE [Id_Picture] = @id_picture


	