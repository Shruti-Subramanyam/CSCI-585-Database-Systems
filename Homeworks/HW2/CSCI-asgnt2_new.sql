CREATE TABLE Procedures ( 
    ProcedureID INT PRIMARY KEY, 
    ProcedureType VARCHAR(255) NOT NULL, 
    ProcedureDuration INT 
);

INSERT INTO Procedures (ProcedureID, ProcedureType, ProcedureDuration) VALUES (5501, 'Dental Cleaning', 6);
INSERT INTO Procedures (ProcedureID, ProcedureType, ProcedureDuration) VALUES (5502, 'X-ray Examination', 7);
INSERT INTO Procedures (ProcedureID, ProcedureType, ProcedureDuration) VALUES (5503, 'Root Canal Therapy', 8);
INSERT INTO Procedures (ProcedureID, ProcedureType, ProcedureDuration) VALUES (5504, 'Physical Examination', 1);
INSERT INTO Procedures (ProcedureID, ProcedureType, ProcedureDuration) VALUES (5505, 'Tooth Extraction', 9);

CREATE TABLE Patients ( 
    PatientID INT PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL, 
    InsuranceInformation VARCHAR(255), 
    MedicalRecord VARCHAR(50) 
);

INSERT INTO Patients (PatientID, Name, InsuranceInformation, MedicalRecord) VALUES (10001, 'Shruti', 'Delta Insurance', 'MR-2022001');
INSERT INTO Patients (PatientID, Name, InsuranceInformation, MedicalRecord) VALUES (10002, 'Spurthi', 'ABC Insurance', 'MR-2022002');
INSERT INTO Patients (PatientID, Name, InsuranceInformation, MedicalRecord) VALUES (10003, 'Rishi', 'XYZ Insurance', 'MR-2022003');
INSERT INTO Patients (PatientID, Name, InsuranceInformation, MedicalRecord) VALUES (10004, 'Siddhesh', 'Acme Insurance', 'MR-2022004');
INSERT INTO Patients (PatientID, Name, InsuranceInformation, MedicalRecord) VALUES (10005, 'Rudra', 'Global Care', 'MR-2022005');

CREATE TABLE Treatment ( 
    TreatmentID INT PRIMARY KEY, 
    TreatmentType VARCHAR(255) NOT NULL, 
    PatientID INT, 
    ProcedureID INT, 
    TreatmentDate DATE, 
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID), 
    FOREIGN KEY (ProcedureID) REFERENCES Procedures(ProcedureID) 
);

INSERT INTO Treatment (TreatmentID, TreatmentType, PatientID, ProcedureID, TreatmentDate) VALUES (7701, 'Dental Cleaning', 10001, 5501, TO_DATE('2021-01-01','YYYY-MM-DD'));
INSERT INTO Treatment (TreatmentID, TreatmentType, PatientID, ProcedureID, TreatmentDate) VALUES (7702, 'Tooth Extraction', 10002, 5502, TO_DATE('2021-03-03','YYYY-MM-DD'));
INSERT INTO Treatment (TreatmentID, TreatmentType, PatientID, ProcedureID, TreatmentDate) VALUES (7703, 'Cavity Filling', 10003, 5503, TO_DATE('2021-02-01','YYYY-MM-DD'));
INSERT INTO Treatment (TreatmentID, TreatmentType, PatientID, ProcedureID, TreatmentDate) VALUES (7704, 'Orthodontic Consultation', 10004, 5504, TO_DATE('2021-01-05','YYYY-MM-DD'));
INSERT INTO Treatment (TreatmentID, TreatmentType, PatientID, ProcedureID, TreatmentDate) VALUES (7705, 'Teeth Whitening', 10005, 5505, TO_DATE('2021-01-20','YYYY-MM-DD'));

CREATE TABLE InsuranceProviders ( 
    ProviderID INT PRIMARY KEY, 
    ProviderName VARCHAR(255) NOT NULL 
);

INSERT INTO InsuranceProviders (ProviderID, ProviderName) VALUES (1100, 'Delta Insurance');
INSERT INTO InsuranceProviders (ProviderID, ProviderName) VALUES (1101, 'ABC Insurance');
INSERT INTO InsuranceProviders (ProviderID, ProviderName) VALUES (1102, 'XYZ Insurance');
INSERT INTO InsuranceProviders (ProviderID, ProviderName) VALUES (1103, 'Acme Insurance');
INSERT INTO InsuranceProviders (ProviderID, ProviderName) VALUES (1104, 'Global Care');

CREATE TABLE BillingRecord ( 
    BillingID INT PRIMARY KEY, 
    PatientID INT, 
    InsuranceProviderID INT, 
    Amounts DECIMAL(10, 2) NOT NULL, 
    TreatmentDate DATE, 
    CoverageType VARCHAR(50), 
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID), 
    FOREIGN KEY (InsuranceProviderID) REFERENCES InsuranceProviders(ProviderID) 
);

INSERT INTO BillingRecord (BillingID, PatientID, InsuranceProviderID, Amounts, TreatmentDate, CoverageType) VALUES (20001, 10001, 1100, 1000, TO_DATE('2021-01-01','YYYY-MM-DD'), 'Dental');
INSERT INTO BillingRecord (BillingID, PatientID, InsuranceProviderID, Amounts, TreatmentDate, CoverageType) VALUES (20002, 10002, 1101, 800, TO_DATE('2021-03-03','YYYY-MM-DD'), 'Medical');
INSERT INTO BillingRecord (BillingID, PatientID, InsuranceProviderID, Amounts, TreatmentDate, CoverageType) VALUES (20003, 10003, 1102, 1200, TO_DATE('2021-02-01','YYYY-MM-DD'), 'Dental');
INSERT INTO BillingRecord (BillingID, PatientID, InsuranceProviderID, Amounts, TreatmentDate, CoverageType) VALUES (20004, 10004, 1103, 700, TO_DATE('2021-01-15','YYYY-MM-DD'), 'Medical');
INSERT INTO BillingRecord (BillingID, PatientID, InsuranceProviderID, Amounts, TreatmentDate, CoverageType) VALUES (20005, 10005, 1104, 900, TO_DATE('2021-05-05','YYYY-MM-DD'), 'Dental');

CREATE TABLE Staff ( 
    StaffID INT PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL, 
    Role VARCHAR(50) NOT NULL, 
    LicenseExpiryDate DATE 
);

INSERT INTO Staff (StaffID, Name, Role, LicenseExpiryDate) VALUES (1001, 'Jake', 'Prosthodontics', TO_DATE('2026-02-01','YYYY-MM-DD'));
INSERT INTO Staff (StaffID, Name, Role, LicenseExpiryDate) VALUES (1002, 'Mac', 'Orthodontist', TO_DATE('2029-06-11','YYYY-MM-DD'));
INSERT INTO Staff (StaffID, Name, Role, LicenseExpiryDate) VALUES (1003, 'Irina', 'Dental assistant', TO_DATE('2023-05-10','YYYY-MM-DD'));
INSERT INTO Staff (StaffID, Name, Role, LicenseExpiryDate) VALUES (1004, 'Chris', 'Doctor', TO_DATE('2027-12-22','YYYY-MM-DD'));
INSERT INTO Staff (StaffID, Name, Role, LicenseExpiryDate) VALUES (1005, 'Lily', 'Oral surgeon', TO_DATE('2022-8-05','YYYY-MM-DD'));

CREATE TABLE Rooms ( 
    RoomID INT PRIMARY KEY, 
    RoomNumber VARCHAR(20) NOT NULL, 
    DoctorID INT, 
    FOREIGN KEY (DoctorID) REFERENCES Staff(StaffID) 
);

INSERT INTO Rooms (RoomID, RoomNumber, DoctorID) VALUES (901, 'Room 101', 1004);
INSERT INTO Rooms (RoomID, RoomNumber, DoctorID) VALUES (902, 'Room 102', 1005);
INSERT INTO Rooms (RoomID, RoomNumber, DoctorID) VALUES (903, 'Room 103', 1001);
INSERT INTO Rooms (RoomID, RoomNumber, DoctorID) VALUES (904, 'Room 104', 1001);
INSERT INTO Rooms (RoomID, RoomNumber, DoctorID) VALUES (905, 'Room 105', 1005);
INSERT INTO Rooms (RoomID, RoomNumber, DoctorID) VALUES (906, 'Room 106', 1002);
INSERT INTO Rooms (RoomID, RoomNumber, DoctorID) VALUES (907, 'Room 106', 1003);

CREATE TABLE Scheduling ( 
    SchedulingID INT PRIMARY KEY, 
    PatientID INT, 
    StaffID INT, 
    RoomID INT, 
    ScheduledDate DATE, 
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID), 
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID), 
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID) 
);

INSERT INTO Scheduling (SchedulingID, PatientID, StaffID, RoomID, ScheduledDate) VALUES (20004, 10001, 1001, 901,  TO_DATE('2026-06-01','YYYY-MM-DD'));
INSERT INTO Scheduling (SchedulingID, PatientID, StaffID, RoomID, ScheduledDate) VALUES (20005, 10002, 1004, 902,  TO_DATE('2027-08-05','YYYY-MM-DD'));
INSERT INTO Scheduling (SchedulingID, PatientID, StaffID, RoomID, ScheduledDate) VALUES (20006, 10003, 1005, 903,  TO_DATE('2027-09-11','YYYY-MM-DD'));
INSERT INTO Scheduling (SchedulingID, PatientID, StaffID, RoomID, ScheduledDate) VALUES (20007, 10004, 1004, 904,  TO_DATE('2025-10-01','YYYY-MM-DD'));
INSERT INTO Scheduling (SchedulingID, PatientID, StaffID, RoomID, ScheduledDate) VALUES (20008, 10005, 1001, 905,  TO_DATE('2024-12-31','YYYY-MM-DD'));
INSERT INTO Scheduling (SchedulingID, PatientID, StaffID, RoomID, ScheduledDate) VALUES (20009, 10005, 1002, 905,  TO_DATE('2024-02-12','YYYY-MM-DD'));
INSERT INTO Scheduling (SchedulingID, PatientID, StaffID, RoomID, ScheduledDate) VALUES (20003, 10005, 1003, 905,  TO_DATE('2024-09-30','YYYY-MM-DD'));

CREATE TABLE Capabilities ( 
    StaffID INT, 
    Skill VARCHAR(255), 
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) 
);

INSERT INTO Capabilities (staffID,skill) VALUES (1001, 'File taxes');
INSERT INTO Capabilities (staffID,skill) VALUES (1001, 'Meet the press');
INSERT INTO Capabilities (staffID,skill) VALUES (1001, 'Organize spring cleaning');
INSERT INTO Capabilities (staffID,skill) VALUES (1001, 'Do teeth cleaning');
INSERT INTO Capabilities (staffID,skill) VALUES (1001, 'Reorder inventory');
INSERT INTO Capabilities (staffID,skill) VALUES (1002, 'File taxes');
INSERT INTO Capabilities (staffID,skill) VALUES (1002, 'Meet the press');
INSERT INTO Capabilities (staffID,skill) VALUES (1002, 'Organize spring cleaning');
INSERT INTO Capabilities (staffID,skill) VALUES (1002, 'Do teeth cleaning');
INSERT INTO Capabilities (staffID,skill) VALUES (1002, 'Reorder inventory');
INSERT INTO Capabilities (staffID,skill) VALUES (1003, 'Organize spring cleaning');
INSERT INTO Capabilities (staffID,skill) VALUES (1003, 'Do teeth cleaning');
INSERT INTO Capabilities (staffID,skill) VALUES (1003, 'Meet the press');
INSERT INTO Capabilities (staffID,skill) VALUES (1004, 'File taxes');
INSERT INTO Capabilities (staffID,skill) VALUES (1004, 'Organize spring cleaning');
INSERT INTO Capabilities (staffID,skill) VALUES (1005, 'Reorder inventory');
INSERT INTO Capabilities (staffID,skill) VALUES (1005, 'Do teeth cleaning');
INSERT INTO Capabilities (staffID,skill) VALUES (1005, 'Organize spring cleaning');

CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    Amount DECIMAL(10, 2) NOT NULL,
    InterestRate DECIMAL(5, 2) NOT NULL,
    InstallmentDuration INT NOT NULL
);

INSERT INTO Loan (LoanID, Amount, InterestRate, InstallmentDuration) VALUES (100, 23000, 10.5, 3);
INSERT INTO Loan (LoanID, Amount, InterestRate, InstallmentDuration) VALUES (101, 20000, 11, 4);
INSERT INTO Loan (LoanID, Amount, InterestRate, InstallmentDuration) VALUES (102, 10000, 10, 2);
INSERT INTO Loan (LoanID, Amount, InterestRate, InstallmentDuration) VALUES (103, 15000, 10.5, 1);
INSERT INTO Loan (LoanID, Amount, InterestRate, InstallmentDuration) VALUES (104, 25000, 11, 4);

CREATE TABLE Startupcosts (
    Furniture VARCHAR(150) NOT NULL,
    DentalEquipment VARCHAR(150) NOT NULL,
    Software VARCHAR(150) NOT NULL,
    Supplies VARCHAR(150) NOT NULL,
    Training VARCHAR(150) NOT NULL
);

INSERT INTO Startupcosts (Furniture, DentalEquipment, Software, Supplies, Training) VALUES ('Chairs', 'X-ray machine', 'Dental Practice Management Software', 'Sterilization kits', 'Staff Development Program');
INSERT INTO Startupcosts (Furniture, DentalEquipment, Software, Supplies, Training) VALUES ('Desks', 'Dental chairs', 'Accounting Software', 'Disposable gloves', 'Continuing Education Course');
INSERT INTO Startupcosts (Furniture, DentalEquipment, Software, Supplies, Training) VALUES ('Tables', 'Autoclave', 'Imaging Software', 'Dental materials', 'Regulatory Compliance Training');
INSERT INTO Startupcosts (Furniture, DentalEquipment, Software, Supplies, Training) VALUES ('Cabinets', 'Handpieces', 'Scheduling Software', 'Office stationery', 'CPR Certification');
INSERT INTO Startupcosts (Furniture, DentalEquipment, Software, Supplies, Training) VALUES ('Lights', 'Curing lights', 'Patient Records Software', 'Protective apparel', 'OSHA Compliance Training');

CREATE TABLE Surgery (
    SurgeryID INT PRIMARY KEY,
    SurgeryType VARCHAR(255) NOT NULL
);

INSERT INTO Surgery (SurgeryID, SurgeryType) VALUES (801, 'Wisdom tooth extraction');
INSERT INTO Surgery (SurgeryID, SurgeryType) VALUES (802, 'Root Canal Surgery');
INSERT INTO Surgery (SurgeryID, SurgeryType) VALUES (803, 'Dental implant placement');
INSERT INTO Surgery (SurgeryID, SurgeryType) VALUES (804, 'Gum Grafting');
INSERT INTO Surgery (SurgeryID, SurgeryType) VALUES (805, 'Jaw reconstruction surgery');

CREATE TABLE State (
    StateID INT PRIMARY KEY,
    StateName VARCHAR(255) NOT NULL
);

INSERT INTO State (StateID, StateName) VALUES (1, 'Alabama');
INSERT INTO State (StateID, StateName) VALUES (2, 'Alaska');
INSERT INTO State (StateID, StateName) VALUES (3, 'Arizona');
INSERT INTO State (StateID, StateName) VALUES (4, 'Arkansas');
INSERT INTO State (StateID, StateName) VALUES (5, 'California');

CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY,
    StaffID INT,
    RoomID INT,
    PatientID INT,
    ScheduledDate DATE,
    AppointmentTime TIMESTAMP, 
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

INSERT INTO Schedules (ScheduleID, StaffID, RoomID, PatientID, ScheduledDate, AppointmentTime) 
VALUES (1, 1001, 901, 10001, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'));
INSERT INTO Schedules (ScheduleID, StaffID, RoomID, PatientID, ScheduledDate, AppointmentTime) 
VALUES (2, 1002, 902, 10002, TO_DATE('2024-03-02', 'YYYY-MM-DD'), TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'));
INSERT INTO Schedules (ScheduleID, StaffID, RoomID, PatientID, ScheduledDate, AppointmentTime) 
VALUES (3, 1003, 903, 10003, TO_DATE('2024-03-03', 'YYYY-MM-DD'), TO_TIMESTAMP('09:15:00', 'HH24:MI:SS'));
INSERT INTO Schedules (ScheduleID, StaffID, RoomID, PatientID, ScheduledDate, AppointmentTime) 
VALUES (4, 1004, 904, 10004, TO_DATE('2024-03-04', 'YYYY-MM-DD'), TO_TIMESTAMP('11:45:00', 'HH24:MI:SS'));
INSERT INTO Schedules (ScheduleID, StaffID, RoomID, PatientID, ScheduledDate, AppointmentTime) 
VALUES (5, 1005, 905, 10005, TO_DATE('2024-03-05', 'YYYY-MM-DD'), TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'));

CREATE TABLE IncomeReport (
    ReportID INT PRIMARY KEY,
    Dates DATE NOT NULL,
    BillableIncome DECIMAL(10, 2) NOT NULL
);

INSERT INTO IncomeReport (ReportID, Dates, BillableIncome) VALUES (1, TO_DATE('2024-03-04', 'YYYY-MM-DD'), 1500.00);
INSERT INTO IncomeReport (ReportID, Dates, BillableIncome) VALUES (2, TO_DATE('2022-04-14', 'YYYY-MM-DD'), 1800.50);
INSERT INTO IncomeReport (ReportID, Dates, BillableIncome) VALUES (3, TO_DATE('2021-05-24', 'YYYY-MM-DD'), 2000.75);
INSERT INTO IncomeReport (ReportID, Dates, BillableIncome) VALUES (4, TO_DATE('2023-08-09', 'YYYY-MM-DD'), 1600.25);
INSERT INTO IncomeReport (ReportID, Dates, BillableIncome) VALUES (5, TO_DATE('2025-01-11', 'YYYY-MM-DD'), 2200.00);

CREATE TABLE Salary (
    SalaryID INT PRIMARY KEY,
    StaffID INT,
    MonthlySalary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

INSERT INTO Salary (SalaryID, StaffID, MonthlySalary) VALUES (1, 1001, 5000.00);
INSERT INTO Salary (SalaryID, StaffID, MonthlySalary) VALUES (2, 1002, 6000.00);
INSERT INTO Salary (SalaryID, StaffID, MonthlySalary) VALUES (3, 1003, 5500.00);
INSERT INTO Salary (SalaryID, StaffID, MonthlySalary) VALUES (4, 1004, 7000.00);
INSERT INTO Salary (SalaryID, StaffID, MonthlySalary) VALUES (5, 1005, 8000.00);

CREATE TABLE LeaseSchedule (
    LeaseID INT PRIMARY KEY,
    MonthlyLeaseAmount DECIMAL(10, 2) NOT NULL,
    DueDate DATE NOT NULL
);

INSERT INTO LeaseSchedule (LeaseID, MonthlyLeaseAmount, DueDate) VALUES (1, 3000.00, TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO LeaseSchedule (LeaseID, MonthlyLeaseAmount, DueDate) VALUES (2, 3000.00, TO_DATE('2024-04-01', 'YYYY-MM-DD'));
INSERT INTO LeaseSchedule (LeaseID, MonthlyLeaseAmount, DueDate) VALUES (3, 3000.00, TO_DATE('2024-05-01', 'YYYY-MM-DD'));
INSERT INTO LeaseSchedule (LeaseID, MonthlyLeaseAmount, DueDate) VALUES (4, 3000.00, TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO LeaseSchedule (LeaseID, MonthlyLeaseAmount, DueDate) VALUES (5, 3000.00, TO_DATE('2024-07-01', 'YYYY-MM-DD'));

CREATE TABLE MonthlyCosts (
    CostID INT PRIMARY KEY,
    SuppliesCost DECIMAL(10, 2) NOT NULL,
    OperatingCosts DECIMAL(10, 2) NOT NULL,
    CleaningCosts DECIMAL(10, 2) NOT NULL,
    Utilities DECIMAL(10, 2) NOT NULL,
    BreakoutRoomExpenses DECIMAL(10, 2) NOT NULL
);

INSERT INTO MonthlyCosts (CostID, SuppliesCost, OperatingCosts, CleaningCosts, Utilities, BreakoutRoomExpenses)
VALUES (1, 500.00, 2000.00, 300.00, 600.00, 400.00);
INSERT INTO MonthlyCosts (CostID, SuppliesCost, OperatingCosts, CleaningCosts, Utilities, BreakoutRoomExpenses)
VALUES (2, 550.00, 2100.00, 350.00, 650.00, 420.00);
INSERT INTO MonthlyCosts (CostID, SuppliesCost, OperatingCosts, CleaningCosts, Utilities, BreakoutRoomExpenses)
VALUES (3, 600.00, 2200.00, 400.00, 700.00, 450.00);
INSERT INTO MonthlyCosts (CostID, SuppliesCost, OperatingCosts, CleaningCosts, Utilities, BreakoutRoomExpenses)
VALUES (4, 550.00, 2100.00, 350.00, 650.00, 420.00);
INSERT INTO MonthlyCosts (CostID, SuppliesCost, OperatingCosts, CleaningCosts, Utilities, BreakoutRoomExpenses)
VALUES (5, 500.00, 2000.00, 300.00, 600.00, 400.00);

CREATE TABLE MonthlyReport (
    ReportID INT PRIMARY KEY,
    Month VARCHAR(20) NOT NULL,
    Income DECIMAL(10, 2) NOT NULL,
    Expenditure DECIMAL(10, 2) NOT NULL,
    ProfitLoss DECIMAL(10, 2) NOT NULL
);

INSERT INTO MonthlyReport (ReportID, Month, Income, Expenditure, ProfitLoss)
VALUES (1, 'January', 12000.00, 9000.00, 3000.00);
INSERT INTO MonthlyReport (ReportID, Month, Income, Expenditure, ProfitLoss)
VALUES (2, 'February', 13000.00, 9500.00, 3500.00);
INSERT INTO MonthlyReport (ReportID, Month, Income, Expenditure, ProfitLoss)
VALUES (3, 'March', 14000.00, 10000.00, 4000.00);
INSERT INTO MonthlyReport (ReportID, Month, Income, Expenditure, ProfitLoss)
VALUES (4, 'April', 15000.00, 10500.00, 4500.00);
INSERT INTO MonthlyReport (ReportID, Month, Income, Expenditure, ProfitLoss)
VALUES (5, 'May', 16000.00, 11000.00, 5000.00);
