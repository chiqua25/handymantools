CREATE TABLE [User] 
(
	UserId int IDENTITY(1,1) NOT NULL,
	UserName varchar(36) NOT NULL,
	FirstName varchar(100) NOT NULL,
	LastName varchar(100) NOT NULL,
	[Password] varchar(256) NOT NULL,
	CONSTRAINT pk_User_UserId PRIMARY KEY (UserId),
	CONSTRAINT uq_User_UserName UNIQUE (UserName)		 
)
