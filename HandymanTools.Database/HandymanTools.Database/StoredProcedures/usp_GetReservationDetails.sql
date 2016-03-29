CREATE PROCEDURE [dbo].[usp_GetReservationDetails]
	@ReservationNumber int
AS
	SELECT Reservation.StartDate, Reservation.EndDate, Reservation.CreditCardNum, CustomerUser.FirstName, CustomerUser.LastName, PickupClerkUser.FirstName, DropOffClerkUser.FirstName 
	FROM Reservation
		INNER JOIN Customer ON Reservation.CustomerId = Customer.UserId
		INNER JOIN [User] AS CustomerUser ON CustomerUser.UserId = Customer.UserId
		INNER JOIN Clerk AS PickupClerk ON PickupClerk.UserId = Reservation.PickupClerkId
		INNER JOIN [User] AS PickupClerkUser ON PickupClerkUser.UserId = PickupClerk.UserId
		INNER JOIN Clerk AS DropOffClerk ON DropOffClerk.UserId = Reservation.DropOffClerkId
		INNER JOIN [User] AS DropOffClerkUser ON DropOffClerkUser.UserId = DropOffClerk.UserId
	WHERE Reservation.ReservationNumber = @ReservationNumber

RETURN 0
