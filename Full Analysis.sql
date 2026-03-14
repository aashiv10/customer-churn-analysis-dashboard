/* =====================================================
   TELCO CUSTOMER CHURN – COMPLETE SQL ANALYSIS
   Database: SalesProject
   Table: TelcoChurn
===================================================== */

USE SalesProject;
GO

/* =====================================================
   SECTION 1: BASIC DATA EXPLORATION
===================================================== */

-- 1. Total Records
SELECT COUNT(*) AS Total_Customers
FROM TelcoChurn;

-- 2. Check Column Overview
SELECT TOP 5 *
FROM TelcoChurn;

-- 3. Null Check
SELECT 
    SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END) AS Null_TotalCharges
FROM TelcoChurn;

-- 4. Unique Values in Key Columns
SELECT DISTINCT Contract FROM TelcoChurn;
SELECT DISTINCT PaymentMethod FROM TelcoChurn;
SELECT DISTINCT InternetService FROM TelcoChurn;


/* =====================================================
   SECTION 2: CORE KPI ANALYSIS
===================================================== */

-- 5. Churn Count & Percentage
SELECT 
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM TelcoChurn;

-- 6. Average Monthly Charges
SELECT 
    AVG(MonthlyCharges) AS Avg_Monthly_Charges
FROM TelcoChurn;

-- 7. Average Tenure
SELECT 
    AVG(tenure) AS Avg_Tenure_Months
FROM TelcoChurn;


/* =====================================================
   SECTION 3: SEGMENTATION ANALYSIS
===================================================== */

-- 8. Churn by Contract Type
SELECT 
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2)
        AS Churn_Rate
FROM TelcoChurn
GROUP BY Contract
ORDER BY Churn_Rate DESC;

-- 9. Churn by Payment Method
SELECT 
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2)
        AS Churn_Rate
FROM TelcoChurn
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;

-- 10. Churn by Internet Service
SELECT 
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned
FROM TelcoChurn
GROUP BY InternetService
ORDER BY Churned DESC;


/* =====================================================
   SECTION 4: TENURE INSIGHTS
===================================================== */

-- 11. Tenure Group Segmentation
SELECT 
    CASE 
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END AS Tenure_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2)
        AS Churn_Rate
FROM TelcoChurn
GROUP BY 
    CASE 
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END
ORDER BY Tenure_Group;


/* =====================================================
   SECTION 5: REVENUE ANALYSIS
===================================================== */

-- 12. Total Revenue & Revenue at Risk
SELECT 
    SUM(MonthlyCharges) AS Total_Monthly_Revenue,
    SUM(CASE WHEN Churn='Yes' THEN MonthlyCharges ELSE 0 END)
        AS Revenue_At_Risk
FROM TelcoChurn;

-- 13. Avg Charges (Churn vs Non-Churn)
SELECT 
    Churn,
    AVG(MonthlyCharges) AS Avg_Monthly_Charges
FROM TelcoChurn
GROUP BY Churn;


/* =====================================================
   SECTION 6: ADVANCED ANALYSIS
===================================================== */

-- 14. High Value Customers (Top 10 by Monthly Charges)
SELECT TOP 10 *
FROM TelcoChurn
ORDER BY MonthlyCharges DESC;

-- 15. High Value Churned Customers
SELECT TOP 10 *
FROM TelcoChurn
WHERE Churn='Yes'
ORDER BY MonthlyCharges DESC;

-- 16. Customer Lifetime Value (Approximation)
SELECT 
    customerID,
    tenure,
    MonthlyCharges,
    (tenure * MonthlyCharges) AS Estimated_Lifetime_Value
FROM TelcoChurn
ORDER BY Estimated_Lifetime_Value DESC;

-- 17. Risk Segmentation (Advanced Business Logic)
SELECT 
    customerID,
    Contract,
    tenure,
    MonthlyCharges,
    CASE 
        WHEN Contract='Month-to-month' AND tenure < 12 THEN 'High Risk'
        WHEN Contract='Month-to-month' AND tenure < 24 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS Risk_Category
FROM TelcoChurn;


/* =====================================================
   SECTION 7: WINDOW FUNCTIONS (ADVANCED SQL)
===================================================== */

-- 18. Rank Customers by Monthly Charges
SELECT 
    customerID,
    MonthlyCharges,
    RANK() OVER (ORDER BY MonthlyCharges DESC) AS Revenue_Rank
FROM TelcoChurn;

-- 19. Churn Percentage by Contract (Window Function)
SELECT 
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(
        100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
        / SUM(COUNT(*)) OVER(),
        2
    ) AS Overall_Contribution_Percentage
FROM TelcoChurn
GROUP BY Contract;


/* =====================================================
   END OF COMPLETE ANALYSIS
===================================================== */