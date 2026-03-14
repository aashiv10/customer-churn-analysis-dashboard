---Step 2: Insert data from main table

---Insert into Customers
INSERT INTO Customers (customerID, gender, SeniorCitizen, Partner, Dependents, tenure, Churn)
SELECT customerID, gender, SeniorCitizen, Partner, Dependents, tenure, Churn
FROM TelcoChurn;

---Insert into Services
INSERT INTO Services (customerID, PhoneService, MultipleLines, InternetService, OnlineSecurity, OnlineBackup, DeviceProtection, TechSupport, StreamingTV, StreamingMovies)
SELECT customerID, PhoneService, MultipleLines, InternetService, OnlineSecurity, OnlineBackup, DeviceProtection, TechSupport, StreamingTV, StreamingMovies
FROM TelcoChurn;

---Insert into Billing
INSERT INTO Billing (customerID, Contract, PaperlessBilling, PaymentMethod, MonthlyCharges, TotalCharges)
SELECT customerID, Contract, PaperlessBilling, PaymentMethod, MonthlyCharges, TotalCharges
FROM TelcoChurn;