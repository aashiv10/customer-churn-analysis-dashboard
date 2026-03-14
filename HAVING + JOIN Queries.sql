---HAVING + JOIN Queries

---16. Contracts with more than 1000 customers
SELECT b.Contract, COUNT(*) AS Total_Customers
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID
GROUP BY b.Contract
HAVING COUNT(*) > 1000;

---17. Payment methods with average charges above 70
SELECT b.PaymentMethod, AVG(b.MonthlyCharges) AS Avg_Charge
FROM Billing b
GROUP BY b.PaymentMethod
HAVING AVG(b.MonthlyCharges) > 70;

