CREATE PROCEDURE [dbo].[SP_Picture_Insert]
	
	@name_picture NVARCHAR(64),
	@url_picture NVARCHAR(256),
	@id_product INT	
AS
	INSERT INTO [Picture] ([Name_Picture],[Url_Picture], [Id_Product])
		OUTPUT [inserted].[Id_Picture]
		VALUES (@name_picture,@url_picture,@id_product)

