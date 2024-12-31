CREATE TABLE hospital_records_unnormalized (
    record_id INT PRIMARY KEY,
    doctor_id INT,
    doctor_name VARCHAR(50),
    doctor_specialty VARCHAR(50),
    patient_id INT,
    patient_name VARCHAR(50),
    patient_address VARCHAR(100),
    appointment_id INT,
    appointment_datetime DATETIME,
    diagnosis VARCHAR(100),
    bill_amount DECIMAL(10,2),
    payment_status VARCHAR(20)
);
INSERT INTO hospital_records_unnormalized VALUES
(1, 1, 'Dr. Tara Shrestha', 'Ophthalmology', 1, 'Anza Amatya', '123 Oak St', 1, '2024-12-31 09:00:00', 'Eye Infection', 150.00, 'Paid'),
(2, 2, 'Dr. Mukul Aryal', 'ENT', 2, 'Mush Gurung', '456 Maple Ave', 2, '2024-12-31 10:30:00', 'Sinusitis', 75.00, 'Pending'),
(3, 1, 'Dr. Tara Shrestha', 'Ophthalmology', 3, 'Rose Shrestha', '789 Pine Rd', 3, '2024-12-31 14:00:00', 'Cataract, Allergy', 200.00, 'Unpaid');

CREATE TABLE hospital_records_1nf (
   appointment_id INT PRIMARY KEY,
   doctor_id INT,
   doctor_name VARCHAR(50),
   doctor_specialty VARCHAR(50),
   patient_id INT,
   patient_name VARCHAR(50),
   patient_address VARCHAR(100),
   appointment_datetime DATETIME,
   diagnosis VARCHAR(100),
   bill_amount DECIMAL(10,2),
   payment_status VARCHAR(20)
);

INSERT INTO hospital_records_1nf VALUES
(1, 1, 'Dr. Tara Shrestha', 'Ophthalmology', 1, 'Anza Amatya', '123 Oak St', '2024-12-31 09:00:00', 'Eye Infection', 150.00, 'Paid'),
(2, 2, 'Dr. Mukul Aryal', 'ENT', 2, 'Mush Gurung', '456 Maple Ave', '2024-12-31 10:30:00', 'Sinusitis', 75.00, 'Pending'),
(3, 1, 'Dr. Tara Shrestha', 'Ophthalmology', 3, 'Rose Shrestha', '789 Pine Rd', '2024-12-31 14:00:00', 'Cataract', 200.00, 'Unpaid'),
(4, 1, 'Dr. Tara Shrestha', 'Ophthalmology', 3, 'Rose Shrestha', '789 Pine Rd', '2024-12-31 16:00:00', 'Allergy', 200.00, 'Unpaid');

CREATE TABLE doctors_2nf (
   doctor_id INT PRIMARY KEY,
   doctor_name VARCHAR(50),
   doctor_specialty VARCHAR(50)
);
INSERT INTO doctors_2nf VALUES
(1, 'Dr. Tara Shrestha', 'Ophthalmology'),
(2, 'Dr. Mukul Aryal', 'ENT'),
(3, 'Dr. Divya Maskey', 'Dermatology'),
(4, 'Dr. Gina Karki', 'Cardiology'),
(5, 'Dr. Minaya Sen', 'Pediatrics');

CREATE TABLE patients_2nf (
   patient_id INT PRIMARY KEY,
   patient_name VARCHAR(50),
   patient_address VARCHAR(100)
);
INSERT INTO patients_2nf VALUES
(1, 'Anza Amatya', '123 Oak St'),
(2, 'Mush Gurung', '456 Maple Ave'),
(3, 'Rose Shrestha', '789 Pine Rd'),
(4, 'Ira Malla', '321 Elm St'),
(5, 'Numa Subba', '654 Birch Ave');

CREATE TABLE appointments_2nf (
   appointment_id INT PRIMARY KEY,
   doctor_id INT,
   patient_id INT,
   appointment_datetime DATETIME,
   diagnosis VARCHAR(100),
   bill_amount DECIMAL(10,2),
   payment_status VARCHAR(20),
   FOREIGN KEY (doctor_id) REFERENCES doctors_2nf(doctor_id),
   FOREIGN KEY (patient_id) REFERENCES patients_2nf(patient_id)
);
INSERT INTO appointments_2nf VALUES
(1, 1, 1, '2024-12-31 09:00:00', 'Eye Infection', 150.00, 'Paid'),
(2, 2, 2, '2024-12-31 10:30:00', 'Sinusitis', 75.00, 'Pending'),
(3, 1, 3, '2024-12-31 14:00:00', 'Cataract', 200.00, 'Unpaid'),
(4, 1, 3, '2024-12-31 14:00:00', 'Allergy', 200.00, 'Unpaid');

CREATE TABLE doctors_3nf (
   doctor_id INT PRIMARY KEY,
   doctor_name VARCHAR(50),
   doctor_specialty VARCHAR(50)
);
INSERT INTO doctors_3nf VALUES
(1, 'Dr. Tara Shrestha', 'Ophthalmology'),
(2, 'Dr. Mukul Aryal', 'ENT'),
(3, 'Dr. Divya Maskey', 'Dermatology'),
(4, 'Dr. Gina Karki', 'Cardiology'),
(5, 'Dr. Minaya Sen', 'Pediatrics');

CREATE TABLE patients_3nf (
   patient_id INT PRIMARY KEY,
   patient_name VARCHAR(50),
   patient_address VARCHAR(100)
);
INSERT INTO patients_3nf VALUES
(1, 'Anza Amatya', '123 Oak St'),
(2, 'Mush Gurung', '456 Maple Ave'),
(3, 'Rose Shrestha', '789 Pine Rd'),
(4, 'Ira Malla', '321 Elm St'),
(5, 'Numa Subba', '654 Birch Ave');

CREATE TABLE appointments_3nf (
   appointment_id INT PRIMARY KEY,
   doctor_id INT,
   patient_id INT,
   appointment_datetime DATETIME,
   diagnosis VARCHAR(100),
   FOREIGN KEY (doctor_id) REFERENCES doctors_3nf(doctor_id),
   FOREIGN KEY (patient_id) REFERENCES patients_3nf(patient_id)
);
INSERT INTO appointments_3nf VALUES
(1, 1, 1, '2024-12-31 09:00:00', 'Eye Infection'),
(2, 2, 2, '2024-12-31 10:30:00', 'Sinusitis'),
(3, 1, 3, '2024-12-31 14:00:00', 'Cataract'),
(4, 1, 3, '2024-12-31 14:00:00', 'Allergy');

CREATE TABLE billing_3nf (
   billing_id INT PRIMARY KEY,
   appointment_id INT,
   bill_amount DECIMAL(10,2),
   payment_status VARCHAR(20),
   FOREIGN KEY (appointment_id) REFERENCES appointments_3nf(appointment_id)
);
INSERT INTO billing_3nf VALUES
(1, 1, 150.00, 'Paid'),
(2, 2, 75.00, 'Pending'),
(3, 3, 200.00, 'Unpaid'),
(4, 3, 200.00, 'Unpaid');