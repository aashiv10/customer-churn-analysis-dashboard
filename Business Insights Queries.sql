--High Risk Customers

SELECT *
FROM vw_TelcoChurn_Analysis
WHERE Risk_Category = 'High Risk';

--Top Revenue Customers

SELECT TOP 10 *
FROM vw_TelcoChurn_Analysis
ORDER BY Estimated_Lifetime_Value DESC;

--Churn by Contract

SELECT 
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2)
        AS Churn_Rate
FROM vw_TelcoChurn_Analysis
GROUP BY Contract
ORDER BY Churn_Rate DESC;

--STEP 4 — Add Index (Advanced Performance Move)

CREATE INDEX idx_churn ON TelcoChurn(Churn);
CREATE INDEX idx_contract ON TelcoChurn(Contract);