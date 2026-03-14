---Aggregate + JOIN Queries


---6. Total customers by contract
SELECT b.Contract, COUNT(*) AS Total_Customers
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID
GROUP BY b.Contract;

---7. Churn count by contract
SELECT b.Contract, COUNT(*) AS Churn_Count
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID
WHERE c.Churn = 'Yes'
GROUP BY b.Contract;

---8. Churn count by internet service
SELECT s.InternetService, COUNT(*) AS Churn_Count
FROM Customers c
INNER JOIN Services s ON c.customerID = s.customerID
WHERE c.Churn = 'Yes'
GROUP BY s.InternetService;

---9. Average monthly charges by contract
SELECT b.Contract, AVG(b.MonthlyCharges) AS Avg_Monthly_Charges
FROM Billing b
GROUP BY b.Contract;

---10. Revenue by payment method
SELECT b.PaymentMethod, SUM(b.TotalCharges) AS Revenue
FROM Billing b
GROUP BY b.PaymentMethod;

---11. Average tenure by churn status
SELECT c.Churn, AVG(c.tenure) AS Avg_Tenure
FROM Customers c
GROUP BY c.Churn;

---12. Revenue lost due to churn
SELECT SUM(b.TotalCharges) AS Revenue_Lost
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID
WHERE c.Churn = 'Yes';