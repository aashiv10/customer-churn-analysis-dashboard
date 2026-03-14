---Step 3: Add foreign keys

ALTER TABLE Services
ADD CONSTRAINT FK_Services_Customers
FOREIGN KEY (customerID) REFERENCES Customers(customerID);

ALTER TABLE Billing
ADD CONSTRAINT FK_Billing_Customers
FOREIGN KEY (customerID) REFERENCES Customers(customerID);