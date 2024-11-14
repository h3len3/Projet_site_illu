CREATE TABLE [dbo].[Order_Product]
(
Id_Order INT,
Id_Product INT,
PRIMARY KEY (Id_Order, Id_Product),
FOREIGN KEY (Id_Order) REFERENCES [Order](Id_Order),
FOREIGN KEY (Id_Product) REFERENCES Product(Id_Product)

)
