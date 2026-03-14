USE SalesProject;
GO

CREATE OR ALTER VIEW dbo.vw_TelcoChurn_Analysis AS
SELECT
    customerID,
    gender,
    SeniorCitizen,
    tenure,
    Contract,
    PaymentMethod,
    InternetService,
    MonthlyCharges,
    TotalCharges,
    Churn,

    CASE 
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END AS Tenure_Group,

    (tenure * MonthlyCharges) AS Estimated_Lifetime_Value,

    CASE 
        WHEN Contract='Month-to-month' AND tenure < 12 THEN 'High Risk'
        WHEN Contract='Month-to-month' AND tenure < 24 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS Risk_Category

FROM dbo.TelcoChurn;
GO