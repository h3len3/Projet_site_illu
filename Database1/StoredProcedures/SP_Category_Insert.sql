CREATE PROCEDURE [dbo].[SP_Category_Insert]
	@name_category NVARCHAR(64)

AS
	INSERT INTO [Category] ([Name_Category])
		OUTPUT [inserted].[Id_Category]
		VALUES (@name_category)

