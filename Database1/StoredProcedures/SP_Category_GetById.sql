CREATE PROCEDURE [dbo].[SP_Category_GetById]
	@id_category INT
AS
	SELECT [Id_Category],
	       [Name_Category]
	 
		FROM [Category]
		WHERE [Id_Category] = @id_category
