CREATE PROCEDURE [dbo].[SP_Picture_Delete]
	@id_picture int
AS
	DELETE FROM [Picture]
		WHERE [Id_Picture] = @id_picture
