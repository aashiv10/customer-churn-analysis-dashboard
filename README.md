# Customer Churn Analysis Dashboard

An end-to-end **data analytics project** that analyzes telecom customer churn using SQL and an interactive analytics dashboard.
The project identifies key churn drivers, customer behavior patterns, and revenue impact to help businesses improve retention strategies.

---

# Project Overview

Customer churn is a critical challenge in the telecom industry. Understanding why customers leave helps organizations reduce revenue loss and improve retention strategies.
This project performs **customer churn analysis** on telecom customer data to uncover patterns in customer behavior, contract types, service usage, and pricing.
The analysis is supported by **SQL queries and an executive dashboard** designed to visualize key churn insights.

---

# Business Problem
Telecom companies face high customer churn rates which lead to:

* Revenue loss
* Increased customer acquisition costs
* Reduced long-term customer value

The objective of this project is to identify:

* High-risk customer segments
* Key factors influencing churn
* Revenue impact of churn
* Opportunities to improve retention

---

# Dataset

Dataset: **Telco Customer Churn Dataset**

Source: Kaggle

Dataset features include:

* Customer demographics
* Subscription details
* Internet service usage
* Contract type
* Billing information
* Churn status

Total records: **~7,000 customers**

---

# Data Model
The dataset was normalized into **three relational tables**.

## Customers Table

customerID
gender
SeniorCitizen
Partner
Dependents
tenure
Churn

## Services Table

customerID
PhoneService
MultipleLines
InternetService
OnlineSecurity
OnlineBackup
DeviceProtection
TechSupport
StreamingTV
StreamingMovies

## Billing Table

customerID
Contract
PaperlessBilling
PaymentMethod
MonthlyCharges
TotalCharges

Relationships:

Customers.customerID → Services.customerID
Customers.customerID → Billing.customerID

---

# SQL Analysis
SQL was used to perform customer churn analysis and derive business insights.

Techniques used:

* Joins
* Aggregations
* Group By
* Case Statements
* Subqueries
* CTEs
* Window Functions

Example query:

SELECT
b.Contract,
COUNT(*) AS Churn_Count
FROM Customers c
JOIN Billing b ON c.customerID = b.customerID
WHERE c.Churn = 'Yes'
GROUP BY b.Contract
ORDER BY Churn_Count DESC;

The project includes **25 SQL queries** covering basic to advanced analysis.

---

# Dashboard
An **interactive dashboard** was built to visualize churn trends and customer behavior.

### Key KPIs

* Total Customers
* Churn Customers
* Churn Rate
* Total Revenue

### Dashboard Visualizations

* Customer Churn Rate by Contract Type
* Churn by Internet Service
* Revenue by Payment Method
* Customer Distribution by Contract
* Average Monthly Charges by Contract Type
* Churn by Tenure Category

### Filters / Slicers

* Contract Type
* Internet Service
* Payment Method
* Churn Status

---

# Key Insights

**Contract Risk**
Month-to-month contracts have the highest churn rate compared to long-term contracts.

**Service Impact**
Fiber optic internet customers exhibit higher churn probability.

**Pricing Sensitivity**
Customers with higher monthly charges are more likely to churn.

**Retention Success**
Customers with one-year or two-year contracts show significantly better retention.

---

# Tech Stack

SQL – Data analysis
Power BI – Dashboard visualization
Kaggle – Dataset source
GitHub – Version control

---

# Business Impact

This analysis helps organizations:

* Identify customers at high risk of churn
* Understand the effect of contract types on retention
* Detect pricing patterns related to churn
* Improve customer retention strategies

---

# Future Improvements

Potential extensions include:

* Churn prediction using machine learning
* Customer segmentation analysis
* Time-based churn trend analysis
* Automated BI reporting


