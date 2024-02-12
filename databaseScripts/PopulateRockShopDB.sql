USE RockShopDB

INSERT INTO [dbo].[Addresses] ([AddressName], [Location])
VALUES 
    ('Home', geography::Point(47.1234, -122.3456, 4326)),
    ('Work', geography::Point(47.5678, -122.7890, 4326)),
    ('Work', geography::Point(47.9012, -122.1234, 4326)),
    ('Work', NULL),
    ('House', geography::Point(47.3456, -122.6789, 4326)),
    ('Work', geography::Point(47.8901, -122.5678, 4326)),
    ('Home', geography::Point(47.2345, -122.4567, 4326)),
    ('Home', NULL),
    ('House', geography::Point(47.6789, -122.9012, 4326)),
    ('Work', geography::Point(47.5432, -122.7890, 4326)),
    ('House', geography::Point(47.0123, -122.6789, 4326)),
    ('Work', geography::Point(47.9012, -122.5678, 4326)),
    ('House', geography::Point(47.7890, -122.4567, 4326)),
    ('Home', geography::Point(47.3456, -122.3456, 4326)),
    ('Home', geography::Point(47.6789, -122.2345, 4326)),
    ('Home', geography::Point(47.9012, -122.1234, 4326)),
    ('Home', geography::Point(47.1234, -122.0123, 4326)),
    ('Work', geography::Point(47.4567, -122.9012, 4326)),
    ('Work', geography::Point(47.7890, -122.7890, 4326)),
    ('Home', geography::Point(47.2345, -122.6789, 4326));
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
    (6, 4, 'Personalized Home Address 1'),
	(15, 9, 'Personalized Home Address 2'),
	(5, 17, 'Personalized Home Address 3'),
	(12, 3, 'Personalized Home Address 4'),
	(9, 9, 'Personalized Home Address 5'),
	(3, 16, 'Personalized Home Address 6'),
	(8, 6, 'Personalized Home Address 7'),
	(19, 17, 'Personalized Home Address 8'),
	(20, 15, 'Personalized Home Address 9'),
	(19, 10, 'Personalized Home Address 10'),
	(8, 6, 'Personalized Home Address 11'),
	(3, 11, 'Personalized Home Address 12'),
	(3, 1, 'Personalized Home Address 13'),
	(12, 17, 'Personalized Home Address 14'),
	(8, 12, 'Personalized Home Address 15'),
	(17, 5, 'Personalized Home Address 16'),
	(18, 6, 'Personalized Home Address 17'),
	(1, 7, 'Personalized Home Address 18'),
	(1, 13, 'Personalized Home Address 19'),
	(6, 13, 'Personalized Home Address 20');
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
select * from InventoryType
INSERT INTO [dbo].[Inventory] ([InventoryTypeID], [Title], [Description], [price], [ActiveTimestamp])
VALUES 
    (1, 'Dwayn Rock', 'Dwayne "the petrock" Johnson.', 771.89, GETDATE()),
	(1, 'Zebra Rock', 'Black and white striped rock.', 108.92, GETDATE()),
	(1, 'Giraffe Rock', 'Rock with long neck.', 578.76, GETDATE()),
	(2, 'Glass eyes', 'Glass beads in selected colours.', 315.55, GETDATE()),
	(2, 'Googly eyes', 'Description for Item 5', 633.04, GETDATE()),
	(3, 'Angry Brow', 'Angry shaped eyebrows.', 171.68, GETDATE()),
	(3, 'Happy Brow', 'Happy shaped eyebrows.', 635.74, GETDATE()),
	(3, 'Sad Brow', 'Sad shaped eyebrows.', 859.27, GETDATE()),
	(3, 'Skeptical Brow', 'Sus shaped eyebrows.', 119.26, GETDATE()),
	(4, 'Handelbar mustache', 'A distinctive mustache with long and upward-curled ends, resembling the handlebars of a bicycle.', 622.12, GETDATE()),
	(4, 'Horseshoe mustache', 'A mustache that resembles an upside-down "U" shape, extending downward from the corners of the mouth.', 670.17, GETDATE()),
	(5, 'Tophat', 'A tall, cylindrical hat with a flat crown and a narrow brim.', 523.81, GETDATE()),
	(5, 'Cowboy Hat', 'A wide-brimmed hat with a tall, creased crown.', 727.47, GETDATE()),
	(5, 'Newsboy Cap', 'A flat cap with a round, paneled crown and a small, stiff brim that curves slightly at the front.', 739.94, GETDATE()),
	(6, 'Leash', 'Leash for walking your rock in selected colours.', 696.27, GETDATE()),
	(7, 'Wellington boots', 'Footwear for outdoor activities such as gardening, farming, hiking, and festivals.', 286.38, GETDATE()),
	(9, 'Sneakers', 'Footwear designed primarily for sports and physical activities but widely used for everyday casual wear', 653.84, GETDATE()),
	(9, 'Ears', 'Ears available in several sizes and colours.', 632.83, GETDATE()),
	(9, 'Fancy gloves', 'Gloves for your trip to England.', 261.37, GETDATE()),
	(9, 'Rock Markers', 'For drawing on your pet rock to customize to your liking.', 837.69, GETDATE());
GO

INSERT INTO [dbo].[OrderLines] ([OrderID], [OrderStatusID])
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 1),
    (6, 2),
    (7, 3),
    (8, 4),
    (9, 1),
    (10, 2),
    (11, 3),
    (12, 4),
    (13, 1),
    (14, 2),
    (15, 3),
    (16, 4),
    (17, 1),
    (18, 2),
    (19, 3),
    (20, 4);
