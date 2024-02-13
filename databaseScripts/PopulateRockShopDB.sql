USE RockShopDB

INSERT INTO [dbo].[Addresses] ([AddressName], [Location])
VALUES 
    ('123 Main St', geography::Point(47.1234, -122.3456, 4326)),
    ('456 Elm St', geography::Point(47.5678, -122.7890, 4326)),
    ('789 Oak St', geography::Point(47.9012, -122.1234, 4326)),
    ('10 Maple Ave', NULL),
    ('20 Pine St', geography::Point(47.3456, -122.6789, 4326)),
    ('30 Cedar Rd', geography::Point(47.8901, -122.5678, 4326)),
    ('40 Birch Ln', geography::Point(47.2345, -122.4567, 4326)),
    ('50 Walnut Blvd', NULL),
    ('60 Cherry St', geography::Point(47.6789, -122.9012, 4326)),
    ('70 Chestnut Dr', geography::Point(47.5432, -122.7890, 4326)),
    ('80 Poplar Ave', geography::Point(47.0123, -122.6789, 4326)),
    ('90 Sycamore Rd', geography::Point(47.9012, -122.5678, 4326)),
    ('100 Hemlock Ln', geography::Point(47.7890, -122.4567, 4326)),
    ('110 Willow Blvd', geography::Point(47.3456, -122.3456, 4326)),
    ('120 Fir St', geography::Point(47.6789, -122.2345, 4326)),
    ('130 Spruce Ave', geography::Point(47.9012, -122.1234, 4326)),
    ('140 Cedar Rd', geography::Point(47.1234, -122.0123, 4326)),
    ('150 Pine St', geography::Point(47.4567, -122.9012, 4326)),
    ('160 Maple Ln', geography::Point(47.7890, -122.7890, 4326)),
    ('170 Elm Blvd', geography::Point(47.2345, -122.6789, 4326));
GO

INSERT INTO [dbo].[InventoryType] ([Description])
VALUES 
    ('Rock'),
    ('Eyes'),
    ('Eyebrow'),
    ('Mustache'),
    ('Hat'),
    ('Leash'),
    ('Legs'),
    ('Ears'),
    ('Arms'),
    ('Hair'),
    ('Cape'),
    ('Misc'),
	('Mouth'),
    ('Paint');
GO

INSERT INTO [dbo].[OrderStatus] ([Description])
VALUES 
    ('Pending'),
    ('Processing'),
    ('Shipped'),
    ('Delivered');
GO

INSERT INTO [dbo].[Customers] ([FirstName], [LastName], [Email], [CellNumber])
VALUES 
    ('John', 'Doe', 'john.doe@example.com', '1234567890'),
    ('Jane', 'Smith', 'jane.smith@example.com', '0987654321'),
    ('Michael', 'Johnson', 'michael.johnson@example.com', '1357924680'),
    ('Emily', 'Brown', 'emily.brown@example.com', '2468013579'),
    ('David', 'Martinez', 'david.martinez@example.com', '3692581470'),
    ('Jennifer', 'Jones', 'jennifer.jones@example.com', '1592637480'),
    ('Christopher', 'Davis', 'christopher.davis@example.com', '7531902468'),
    ('Jessica', 'Miller', 'jessica.miller@example.com', '9876543210'),
    ('Daniel', 'Wilson', 'daniel.wilson@example.com', '4561237890'),
    ('Sarah', 'Taylor', 'sarah.taylor@example.com', '6549873210'),
    ('Matthew', 'Anderson', 'matthew.anderson@example.com', '1472583690'),
    ('Lauren', 'Thomas', 'lauren.thomas@example.com', '3216549870'),
    ('Andrew', 'Hernandez', 'andrew.hernandez@example.com', '8529637410'),
    ('Elizabeth', 'Young', 'elizabeth.young@example.com', '3691472580'),
    ('Ryan', 'King', 'ryan.king@example.com', '9517538246'),
    ('Megan', 'Lee', 'megan.lee@example.com', '4561237890'),
    ('James', 'White', 'james.white@example.com', '7894561230'),
    ('Ashley', 'Hall', 'ashley.hall@example.com', '8529637410'),
    ('Justin', 'Adams', 'justin.adams@example.com', '7531592640'),
    ('Amanda', 'Nelson', 'amanda.nelson@example.com', '3216549870');
GO

INSERT INTO [dbo].[CustomersAddresses] ([AddressID], [CustomerID], [PersonalisedHomeAddress])
VALUES 
    (6, 4, 'Home'),
	(15, 9, 'Work'),
	(5, 17, 'Work'),
	(12, 3, 'Work'),
	(9, 9, 'House'),
	(3, 16, 'Work'),
	(8, 6, 'Home'),
	(19, 17, 'Home'),
	(20, 15, 'House'),
	(19, 10, 'Work'),
	(8, 6, 'House'),
	(3, 11, 'Work'),
	(3, 1, 'House'),
	(12, 17, 'Home'),
	(8, 12, 'Home'),
	(17, 5, 'Home'),
	(18, 6, 'Home'),
	(1, 7, 'Work'),
	(1, 13, 'Work'),
	(6, 13, 'Home');
GO

INSERT INTO [dbo].[Employees] ([Email], [CellNumber], [IdentityNumber], [TimeOfRegistration])
VALUES 
	('samanthajohnson2345@gmail.com', '9876543211', '0301016781181', GETDATE()),
	('brianthomas6789@aol.com', '9876543212', '0301018724081', GETDATE()),
	('ashleydavis8901@hotmail.com', '9876543213', '0301015719182', GETDATE()),
	('jasonmartinez1234@yahoo.com', '9876543214', '0301017512189', GETDATE()),
	('christinawilson5678@outlook.com', '9876543215', '0301016117188', GETDATE()),
	('ericthompson4321@gmail.com', '9876543216', '0301019342189', GETDATE()),
	('michellebrown9012@aol.com', '9876543217', '0301017983182', GETDATE()),
	('amandajackson7890@gmail.com', '9876543218', '0301018938185', GETDATE()),
	('roberttaylor321@hotmail.com', '9876543219', '0301015563184', GETDATE()),
	('jessicawhite4567@yahoo.com', '9876543220', '0301018958084', GETDATE()),
	('davidlee7890@outlook.com', '9876543210', '0301017476187', GETDATE()),
	('matthewmiller2345@outlook.com', '9876543211', '0301015582184', GETDATE()),
	('rachelgreen8765@yahoo.com', '9876543212', '0301019540188', GETDATE()),
	('alexjohnson6543@gmail.com', '9876543213', '0301019454182', GETDATE()),
	('laurasmith123@hotmail.com', '9876543214', '0301016645089', GETDATE()),
	('chriswilson9876@aol.com', '9876543215', '0301017279185', GETDATE()),
	('emilyjones4321@outlook.com', '9876543216', '0301016592182', GETDATE()),
	('mikebrown789@hotmail.com', '9876543217', '0301019602087', GETDATE()),
	('mikebrown789@hotmail.com', '9876543218', '0301018145088', GETDATE()),
	('sarahsmith5678@yahoo.com', '9876543219', '0301016741185', GETDATE());
GO

INSERT INTO [dbo].[Orders] ([CustomerID], [EmployeeID], [OrderStatusID], [PlacedDate])
VALUES
	(13, 1, 4, GETDATE()),
	(2, 9, 2, GETDATE()),
	(4, 4, 4, GETDATE()),
	(7, 5, 3, GETDATE()),
	(12, 9, 4, GETDATE()),
	(6, 9, 3, GETDATE()),
	(12, 11, 1, GETDATE()),
	(18, 10, 1, GETDATE()),
	(19, 11, 1, GETDATE()),
	(13, 1, 3, GETDATE()),
	(2, 3, 3, GETDATE()),
	(5, 5, 1, GETDATE()),
	(7, 7, 3, GETDATE()),
	(1, 3, 4, GETDATE()),
	(4, 10, 3, GETDATE()),
	(17, 5, 3, GETDATE()),
	(9, 5, 2, GETDATE()),
	(3, 9, 1, GETDATE()),
	(15, 8, 3, GETDATE()),
	(7, 4, 3, GETDATE());
Go

INSERT INTO [dbo].[Inventory] ([InventoryTypeID], [Title], [Description], [price], [ActiveTimestamp], [QuantityOnHand])
VALUES 
    (1, 'Dwayn Rock', 'Dwayne "the petrock" Johnson.', 771.89, GETDATE(), 5),
	(1, 'Zebra Rock', 'Black and white striped rock.', 108.92, GETDATE(), 5),
	(1, 'Giraffe Rock', 'Rock with long neck.', 578.76, GETDATE(), 5),
	(2, 'Glass eyes', 'Glass beads in selected colours.', 315.55, GETDATE(), 5),
	(2, 'Googly eyes', 'Description for Item 5', 633.04, GETDATE(), 5),
	(3, 'Angry Brow', 'Angry shaped eyebrows.', 171.68, GETDATE(), 5),
	(3, 'Happy Brow', 'Happy shaped eyebrows.', 635.74, GETDATE(), 5),
	(3, 'Sad Brow', 'Sad shaped eyebrows.', 859.27, GETDATE(), 5),
	(3, 'Skeptical Brow', 'Sus shaped eyebrows.', 119.26, GETDATE(), 5),
	(4, 'Handelbar mustache', 'A distinctive mustache with long and upward-curled ends, resembling the handlebars of a bicycle.', 622.12, GETDATE(), 5),
	(4, 'Horseshoe mustache', 'A mustache that resembles an upside-down "U" shape, extending downward from the corners of the mouth.', 670.17, GETDATE(), 5),
	(5, 'Tophat', 'A tall, cylindrical hat with a flat crown and a narrow brim.', 523.81, GETDATE(), 5),
	(5, 'Cowboy Hat', 'A wide-brimmed hat with a tall, creased crown.', 727.47, GETDATE(), 5),
	(5, 'Newsboy Cap', 'A flat cap with a round, paneled crown and a small, stiff brim that curves slightly at the front.', 739.94, GETDATE(), 5),
	(6, 'Leash', 'Leash for walking your rock in selected colours.', 696.27, GETDATE(), 5),
	(7, 'Wellington boots', 'Footwear for outdoor activities such as gardening, farming, hiking, and festivals.', 286.38, GETDATE(), 5),
	(9, 'Sneakers', 'Footwear designed primarily for sports and physical activities but widely used for everyday casual wear', 653.84, GETDATE(), 5),
	(9, 'Ears', 'Ears available in several sizes and colours.', 632.83, GETDATE(), 5),
	(9, 'Fancy gloves', 'Gloves for your trip to England.', 261.37, GETDATE(), 5),
	(9, 'Rock Markers', 'For drawing on your pet rock to customize to your liking.', 837.69, GETDATE(), 5);
GO

INSERT INTO [dbo].[OrderLines] ([InventoryID], [OrderID], [Quantity])
VALUES
	(8, 1, 1),
	(13, 1, 1),
	(11, 1, 1),
	(20, 1, 1),
	(9, 1, 1),
	(17, 1, 1),
	(14, 1, 1),
	(19, 1, 1),
	(7, 1, 1),
	(6, 1, 1),
	(4, 1, 1),
	(3, 1, 1),
	(18, 1, 1),
	(16, 1, 1),
	(1, 1, 1),
	(15, 1, 1),
	(2, 1, 1),
	(12, 1, 1),
	(10, 1, 1),
	(5, 1, 1);

INSERT INTO VAT ([Value], ActiveTimestamp)
VALUES 
	(0.14, '2014-05-14 00:00:00.000'),
	(0.15, '2018-02-18 12:00:00.000'),
	(0.01, '2024-02-12 22:41:54.490');
GO
