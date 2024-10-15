CREATE PROCEDURE [dbo].[SP_Category_Delete]
	@id_category INT

AS
	DELETE FROM [Category]
		WHERE [Id_Category] = @id_category
