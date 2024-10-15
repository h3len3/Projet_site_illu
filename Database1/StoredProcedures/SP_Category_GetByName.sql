CREATE PROCEDURE [dbo].[SP_Category_GetByName]
	@name_category NVARCHAR(64)

AS
	SELECT [Id_Category],
	       [Name_Category]
	     
		FROM [Category]
		WHERE [Name_Category] = @name_category
