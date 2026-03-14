---22. Rank customers by total charges
SELECT c.customerID, b.TotalCharges,
       RANK() OVER (ORDER BY b.TotalCharges DESC) AS Charge_Rank
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID;

---23. Row number by monthly charges
SELECT c.customerID, b.MonthlyCharges,
       ROW_NUMBER() OVER (ORDER BY b.MonthlyCharges DESC) AS Row_Num
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID;

---24. Rank customers within each contract type
SELECT c.customerID, b.Contract, b.MonthlyCharges,
       RANK() OVER (PARTITION BY b.Contract ORDER BY b.MonthlyCharges DESC) AS Rank_Within_Contract
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID;