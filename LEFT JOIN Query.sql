---LEFT JOIN Query

---25. Show all customers even if billing data is missing
SELECT c.customerID, c.gender, b.Contract, b.MonthlyCharges
FROM Customers c
LEFT JOIN Billing b ON c.customerID = b.customerID;