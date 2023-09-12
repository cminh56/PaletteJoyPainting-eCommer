
CREATE TABLE [Role](
RoleID INT NOT NULL PRIMARY KEY,
RoleName VARCHAR(50) NOT NULL

)

CREATE TABLE BlogStatus(
StatusID INT NOT NULL PRIMARY KEY,
StatusName VARCHAR(20) NOT NULL

)

CREATE TABLE Category(
CategoryID INT NOT NULL PRIMARY KEY,
CategoryName VARCHAR(50) NOT NULL

)


CREATE TABLE Account(

Email VARCHAR(50) NOT NULL PRIMARY KEY,
Password VARCHAR(50) NOT NULL,
RoleID INT NOT NULL
FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
)

CREATE TABLE [User](
UserID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
UserName VARCHAR(50) NOT NULL,
Gender BIT NOT NULL,
PhoneNumber VARCHAR(20) NOT NULL,
Address VARCHAR(MAX) NOT NULL,
Avatar VARCHAR(MAX) NOT NULL,
Email VARCHAR(50) NOT NULL
FOREIGN KEY (Email) REFERENCES Account(Email)
)

CREATE TABLE Blog(
BlogID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Title VARCHAR(MAX) NOT NULL,
Content VARCHAR(20) NOT NULL,
[Date] DATETIME NOT NULL,
UserID INT NOT NULL,
StatusID INT NOT NULL,
FOREIGN KEY (UserID) REFERENCES [User](UserID),
FOREIGN KEY (StatusID) REFERENCES BlogStatus(StatusID)
)

CREATE TABLE Product(
ProductID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
ProductName VARCHAR(50) NOT NULL,
Price DECIMAL NOT NULL,
[Description] VARCHAR(MAX) NOT NULL,
Height DECIMAL NOT NULL,
Width DECIMAL NOT NULL,
Quantity INT NOT NULL,
[View] INT NOT NULL,
Discount DECIMAL NOT NULL,
UserID INT NOT NULL,
FOREIGN KEY (UserID) REFERENCES [User](UserID)

)

CREATE TABLE ProductCategory(
ProductID INT NOT NULL ,
CategoryID INT NOT NULL,
PRIMARY KEY (ProductID, CategoryID),
FOREIGN KEY (ProductID) REFERENCES  [Product](ProductID),
FOREIGN KEY (CategoryID) REFERENCES  [Category](CategoryID)
)

CREATE TABLE ProductImage(
ProductID INT NOT NULL,
FOREIGN KEY (ProductID) REFERENCES  [Product](ProductID),
ImageUrl VARCHAR(MAX)
)

CREATE TABLE Orders(
OrderID INT NOT NULL PRIMARY KEY,
UserID INT NOT NULL,
OrderDate DATETIME NOT NULL,
FOREIGN KEY (UserID) REFERENCES  [User](UserID)
)

CREATE TABLE OrderDetail(
OrderID INT NOT NULL,
ProductID INT NOT NULL,
Quantity INT NOT NULL,
Price DECIMAL,
PRIMARY KEY(OrderID, ProductID),
FOREIGN KEY (OrderID) REFERENCES [Orders](OrderID),
FOREIGN KEY (ProductID) REFERENCES [Product](ProductID),
)

CREATE TABLE Cart(
CartID INT NOT NULL PRIMARY KEY,
UserID INT NOT NULL,
FOREIGN KEY (UserID) REFERENCES  [User](UserID)
)

CREATE TABLE CartDetail(
ProductID INT NOT NULL,
CartID INT NOT NULL,
Quantity INT NOT NULL,
PRIMARY KEY(ProductID, CartID, Quantity),
FOREIGN KEY (ProductID) REFERENCES [Product](ProductID),
FOREIGN KEY (CartID) REFERENCES [Cart](CartID)
)

CREATE TABLE ProductComment(
CommentID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
ProductID INT NOT NULL,
CommentDate DATETIME,
Content VARCHAR(MAX),
UserID INT NOT NULL,
Rate INT NOT NULL,
FOREIGN KEY (ProductID) REFERENCES [Product](ProductID),
FOREIGN KEY (UserID) REFERENCES [User](UserID)
)