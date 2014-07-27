use master
go
drop database dbFinalAssignment
go
create database dbFinalAssignment
go
use dbFinalAssignment
go

create table tbUsers
(
UserID INT IDENTITY (1,1) PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Address VARCHAR(100),
City VARCHAR(50),
Email VARCHAR(100),
Username VARCHAR(25),
Password VARCHAR(25),
IsAdmin INT
)

CREATE TABLE tbParagraphText
(
id int identity(1,1) primary key,
ParagraphText varchar(1000),
ParagraphName varchar(30)
)

CREATE TABLE tbAnimals
(
id int identity(1,1) primary key,
AnimalName varchar(30),
AnimalAge int,
AnimalDescription varchar(500),
AnimalImageURL varchar(100)
)

insert into tbUsers
values('kevin','lynch','3434 gigi dr','Formosa','kevin.lynch@robertsoncollege.net','admin','admin',1),
('Javon','Lunch','3434 gonzo rd','Carson City','javy.lch@robees.net','Knobby','beepbeep',0)
go

insert into tbParagraphText
values('Welcome to the Chestermere Zoo! We are very excited to see you, so come on down and see us','#welcomeText'),
('We have a variety of animals to choose from. And the list keeps growing. From Penguins to Cougars, Grizzley Bears to Mongoose you will be able to fina a diverse selection here at Chestermere Zoo','#featuredAnimals'),
('Buy your tickets online and beat the line-ups at the box office! Prices and packages are available with a click.','#tix')
go

insert into tbAnimals
values('Tiger','4','Meet Tonga. This amazing Tiger was found in a Florida neighborhood after being abandoned by exotic pet owners. He has is friendly and very active.','\images\Tiger1.jpg'),
('Hippopatamus','0','Welcome Kubucee to the Zoo. Kubucee is our newest member and is one of the favorite attractions of this year so far. She is 3 months old as of August 1, 2014.','\images\hippo1.jpg'),
('Mountain Goat','4','Say hello to Fred. Fred is one of our Mountain Goats, when he is not eating grass he really enjoys being in the highest spot possible.','\images\mountainGoat1.jpg'),
('Polar Bear','4','Come see Juna in our new Polar Bear exhibit. With underwater and above ground views, you are sure to catch a glimpse of some action.','\images\polarBear1.jpg'),
('Snake','4','Niccccccccce to meet you says Shamby the Bushwacker Snake. Our reptile exhibit has 100s of snakes and lizards for you to feast your eyes on.','\images\bushwacker1.jpg')
go

create procedure spLogin
(
@Username varchar(25),
@Password varchar(25)
)
as

if exists(select * from tbUsers where Username =  @Username and Password = @Password)
BEGIN
	select * from tbUsers
	where Username = @Username and Password = @Password
END
go

create procedure spRegister
(
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@Address VARCHAR(100),
@City VARCHAR(50),
@Email VARCHAR(100),
@Username VARCHAR(25),
@Password VARCHAR(25)
)
AS

IF NOT EXISTS(select * from tbUsers where Username = @Username)
BEGIN
	INSERT INTO tbUsers
	values(@FirstName,@LastName,@Address,@City,@Email,@Username,@Password,0)

	select @@IDENTITY as [NewUserID]
END
go

create procedure spCheckUsername
(
@Username varchar(25)
)
AS

SELECT * FROM tbUsers
where Username = @Username
go

create procedure spGetUser
(
@UserID INT = NULL
)
as
select * from tbUsers
where UserID = ISNULL(@UserID,UserID)
go

create procedure spGetUsers as
select * from tbUsers
go

create procedure spForgotPassword
(
@Email VARCHAR(100),
@NewPassword VARCHAR(25)
)
AS

declare @UserID int
set @UserID = (select UserID from tbUsers where Email = @Email)
IF (@UserID is not null)
BEGIN
	UPDATE tbUsers
	set Password = @NewPassword
	where tbUsers.UserID = @UserID

	select UserID from tbUsers
	where tbUsers.UserID = @UserID
END
go

create PROCEDURE spGetWelcomeParagraph
AS
BEGIN
	Select ParagraphText from tbParagraphText 
END
GO

CREATE PROCEDURE spGetText as
Begin
	select ParagraphName from tbParagraphText
End	
go

CREATE PROCEDURE spUpdateParagraphText 
(@id int,
@paragraphText varchar(1000))
as
BEGIN
	Update tbParagraphText set ParagraphText=@paragraphText 
	where id=@id
END
Go

CREATE PROCEDURE spGetAnimals
AS
BEGIN
	Select * from tbAnimals
END
Go
