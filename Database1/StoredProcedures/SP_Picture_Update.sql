CREATE PROCEDURE [dbo].[SP_Picture_Update]
	@id_picture INT ,
	@name_picture VARCHAR(64),
	@url_picture NVARCHAR(256),
	@id_product INT


AS
	UPDATE [Picture] 
		SET [Name_Picture] = @name_picture,
			[Url_Picture] = @url_picture,
			[Id_Product] = @id_product
			
		WHERE [Id_Picture] = @id_picture