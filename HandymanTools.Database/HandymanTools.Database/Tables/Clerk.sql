CREATE TABLE Clerk
(
	UserId int NOT NULL,
	CONSTRAINT pk_Clerk_UserId PRIMARY KEY (UserId),
	CONSTRAINT fk_Clerk_UserId FOREIGN KEY (UserId) REFERENCES [User](UserId)	
);
