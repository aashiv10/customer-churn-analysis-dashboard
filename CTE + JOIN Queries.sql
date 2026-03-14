---CTE + JOIN Queries

---20. Churned customer details using CTE
WITH ChurnedCustomers AS (
    SELECT customerID, tenure, Churn
    FROM Customers
    WHERE Churn = 'Yes'
)
SELECT cc.customerID, cc.tenure, b.Contract, b.MonthlyCharges
FROM ChurnedCustomers cc
INNER JOIN Billing b ON cc.customerID = b.customerID;

---21. Revenue lost by churned customers using CTE
WITH ChurnedCustomers AS (
    SELECT customerID
    FROM Customers
    WHERE Churn = 'Yes'
)
SELECT SUM(b.TotalCharges) AS Revenue_Lost
FROM ChurnedCustomers cc
INNER JOIN Billing b ON cc.customerID = b.customerID;