---Subquery + JOIN Queries

---18. Customers paying above average monthly charges
SELECT c.customerID, b.MonthlyCharges
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID
WHERE b.MonthlyCharges > (
    SELECT AVG(MonthlyCharges) FROM Billing
);

---19. Customers with above-average tenure
SELECT c.customerID, c.tenure, b.Contract
FROM Customers c
INNER JOIN Billing b ON c.customerID = b.customerID
WHERE c.tenure > (
    SELECT AVG(tenure) FROM Customers
);