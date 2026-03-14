---Basic JOIN Queries

---1. View combined customer data
SELECT c.customerID, c.gender, s.InternetService, b.Contract, b.MonthlyCharges, c.Churn
FROM Customers c
INNER JOIN Services s ON c.customerID = s.customerID
INNER JOIN Billing b ON c.customerID = b.customerID;

---2. Show customer ID, gender, contract type
SELECT c.customerID, c.gender, b.Contract
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID;

---3. Show customer ID, internet service, payment method
SELECT c.customerID, s.InternetService, b.PaymentMethod
FROM Customers c
INNER JOIN Services s ON c.customerID = s.customerID
INNER JOIN Billing b ON c.customerID = b.customerID;

---4. Customers who churned with their contract type
SELECT c.customerID, c.Churn, b.Contract
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID
WHERE c.Churn = 'Yes';

---5. Customers with fiber optic service
SELECT c.customerID, s.InternetService, b.MonthlyCharges
FROM Customers c
INNER JOIN Services s ON c.customerID = s.customerID
INNER JOIN Billing b ON c.customerID = b.customerID
WHERE s.InternetService = 'Fiber optic';