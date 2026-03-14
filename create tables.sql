---Step 1: Split the main table into 3 tables


---1. Customers table
CREATE TABLE Customers (
    customerID VARCHAR(50) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    Churn VARCHAR(10)
);

---2. Services table
CREATE TABLE Services (
    customerID VARCHAR(50) PRIMARY KEY,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(50),
    InternetService VARCHAR(50),
    OnlineSecurity VARCHAR(50),
    OnlineBackup VARCHAR(50),
    DeviceProtection VARCHAR(50),
    TechSupport VARCHAR(50),
    StreamingTV VARCHAR(50),
    StreamingMovies VARCHAR(50)
);

---3. Billing table
CREATE TABLE Billing (
    customerID VARCHAR(50) PRIMARY KEY,
    Contract VARCHAR(50),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(100),
    MonthlyCharges FLOAT,
    TotalCharges FLOAT
);