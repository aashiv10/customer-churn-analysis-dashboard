---CASE WHEN + JOIN Queries

---13. Risk category by contract type
SELECT c.customerID, b.Contract,
       CASE
           WHEN b.Contract = 'Month-to-month' THEN 'High Risk'
           ELSE 'Low Risk'
       END AS Risk_Category
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID;

---14. Tenure category with contract
SELECT c.customerID, c.tenure, b.Contract,
       CASE
           WHEN c.tenure < 12 THEN 'New'
           WHEN c.tenure BETWEEN 12 AND 36 THEN 'Mid-Term'
           ELSE 'Long-Term'
       END AS Tenure_Category
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID;

--15. Monthly charge category
SELECT c.customerID, b.MonthlyCharges,
       CASE
           WHEN b.MonthlyCharges < 35 THEN 'Low'
           WHEN b.MonthlyCharges BETWEEN 35 AND 70 THEN 'Medium'
           ELSE 'High'
       END AS Charge_Category
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID;

