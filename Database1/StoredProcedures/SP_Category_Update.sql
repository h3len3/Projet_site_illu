CREATE PROCEDURE [dbo].[SP_Category_Update]
	@id_category INT,
	@name_category NVARCHAR(64)
AS

		UPDATE [Category] 
			SET [Name_Category] = @name_category 
			WHERE [Id_Category] = @id_category
	
