CREATE TABLE [dbo].[OrderProduct]
(
/* PRIMARY KEY (Id_Order, Id_Product), */
Id_OrderProduct INT NOT NULL PRIMARY KEY,
Id_Order INT,
Id_Product INT,

 CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY ([Id_Order]) REFERENCES [Order]([Id_Order]),
 CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY ([Id_Product]) REFERENCES [Product]([Id_Product])

)
