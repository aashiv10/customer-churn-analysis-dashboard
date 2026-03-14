--Executive Dashboard Block.

SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2)
        AS Churn_Rate_Percentage,
    SUM(MonthlyCharges) AS Total_Monthly_Revenue,
    SUM(CASE WHEN Churn='Yes' THEN MonthlyCharges ELSE 0 END)
        AS Revenue_At_Risk
FROM vw_TelcoChurn_Analysis;