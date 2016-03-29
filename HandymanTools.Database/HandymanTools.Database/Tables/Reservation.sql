CREATE TABLE Reservation
(
	ReservationNumber int IDENTITY(1,1) NOT NULL, --autoincrement surrogate
	CustomerId int NOT NULL,
	PickupClerkId int NULL,
	DropOffClerkId int NULL,
	StartDate Date NOT NULL,
	EndDate Date NOT NULL,
	CreditCardNum varchar(16) NULL,
	CreditCardExpDate Date NULL,
	CONSTRAINT pk_Reservation_ReservationNumber PRIMARY KEY (ReservationNumber),
	CONSTRAINT fk_Reservation_CustomerId FOREIGN KEY (CustomerId) REFERENCES Customer(UserId),
	CONSTRAINT fk_Reservation_PickupClerkId FOREIGN KEY (PickupClerkId) REFERENCES Clerk(UserId),
	CONSTRAINT fk_Reservation_DropOffClerkId FOREIGN KEY (DropOffClerkId) REFERENCES Clerk(UserId)
)
