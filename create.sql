CREATE DATABASE medical_appointments;
USE medical_appointments;

-- Create the doctor table
CREATE TABLE doctor (
    doctorID INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    department VARCHAR(100),
    cabin VARCHAR(10)
);

-- Insert records into the doctor table
INSERT INTO doctor (doctorID, doctor_name, department, cabin) VALUES
(104, 'Daya Gurung', 'ENT', 'C16'),
(119, 'Lily Joshi', 'ENT', 'B13'),
(133, 'Sushil Karki', 'ENT', 'B08'),
(233, 'Krish Acharya', 'Oncology', 'G04'),
(276, 'Gina Karki', 'Opthalmology', 'A01'),
(281, 'Anita Tamrakar', 'Opthalmology', 'A08'),
(296, 'Divya Maskey', 'Pediatrics', 'D13'),
(311, 'Mukul Aryal', 'Pediatrics', 'B17'),
(345, 'Nayan Rana', 'Pediatrics', 'E07'),
(401, 'Sid Manandhar', 'Opthalmology', 'G09'),
(420, 'Minerva Sharma', 'Psychiatry', 'F20'),
(502, 'Mani Bahadur Karki', 'Psychiatry', 'F34'),
(504, 'Suman Theeng Tamang', 'Psychiatry', 'F17'),
(517, 'Akira Khadka', 'Dermatology', 'E16'),
(518, 'Mikha Tamrakar', 'Dermatology', 'H09'),
(671, 'Namata Lama', 'Neurology', 'H09'),
(703, 'Tara Shrestha', 'Cardiology', 'I18');

-- Create the patient table
CREATE TABLE patient (
    patientID INT PRIMARY KEY,
    patient_name VARCHAR(100),
    phone VARCHAR(15),
    department VARCHAR(100),
    age INT
);

-- Insert records into the patient table
INSERT INTO patient (patientID, patient_name, phone, department, age) VALUES
(10008, 'Sirish Rai', '9830289864', 'Opthalmology', 42),
(23159, 'Milli Lama', '9841290039', 'Pediatrics', 8),
(30525, 'Siddhi Pradhan', '9823039485', 'Psychiatry', 44),
(30967, 'Seema Gurung', '9841298420', 'Psychiatry', 23),
(31022, 'Travis Dhakal', '9843209822', 'Opthalmology', 18),
(32710, 'Ira Malla', '9834029412', 'Opthalmology', 59),
(34003, 'Lany Gurung', '9841320844', 'ENT', 27),
(34130, 'Kendrick Bhattarai', '9876340098', 'ENT', 44),
(37119, 'Manish Pokharel', '9876039022', 'Dermatology', 25),
(38160, 'Nirwan Sherchan', '9878009986', 'Oncology', 47),
(52118, 'Anza Amatya', '9874320907', 'Neurology', 32),
(55124, 'Tyler Rai', '9823006234', 'ENT', 31),
(63181, 'Rose Shrestha', '9865220978', 'Pediatrics', 11),
(79044, 'Tsering Dolma Lama', '9843627890', 'Psychiatry', 20),
(89042, 'Numa Subba', '9857230923', 'Dermatology', 17),
(90726, 'Kush Gurung', '9841237830', 'Cardiology', 30);

CREATE TABLE appointment (
    ticketID INT PRIMARY KEY,
    patientID INT,
    doctorID INT,
    date DATE,
    time TIME NOT NULL
);

INSERT INTO appointment (ticketID, patientID, doctorID, date, time) VALUES
(200, 10008, 276, '2024-09-30', '11:30:00'),
(201, 23159, 320, '2024-10-03', '14:00:00'),
(202, 30525, 420, '2024-09-30', '09:30:00'),
(203, 30967, 450, '2024-10-01', '12:15:00'),
(204, 31022, 276, '2024-09-29', '10:45:00'),
(205, 32710, 281, '2024-10-07', '14:20:00'),
(206, 34003, 104, '2024-10-02', '11:40:00'),
(207, 34130, 118, '2024-09-30', '10:30:00'),
(208, 37119, 518, '2024-10-06', '10:30:00'),
(209, 38160, 233, '2024-09-13', '14:45:00'),
(210, 52118, 671, '2024-09-29', '12:15:00'),
(211, 55124, 118, '2024-09-30', '11:15:00'),
(212, 63181, 334, '2024-10-19', '13:15:00'),
(213, 79044, 504, '2024-10-01', '10:45:00'),
(214, 30967, 450, '2024-09-18', '13:40:00'),
(215, 89042, 512, '2024-10-31', '16:15:00'),
(216, 90726, 703, '2024-10-02', '10:20:00');

CREATE TABLE billing (
    billID INT PRIMARY KEY,
    ticketID INT NOT NULL,
    patientID INT NOT NULL,
    date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (ticketID) REFERENCES appointment(ticketID)
);

INSERT INTO billing (billID, ticketID, patientID, date, status) VALUES
(100, 200, 10008, '2024-09-09', 'paid'),
(101, 201, 23159, '2024-09-11', 'paid'),
(102, 202, 30525, '2024-09-28', 'paid'),
(103, 203, 30967, '2024-09-30', 'pending'),
(104, 204, 31022, '2024-09-29', 'paid'),
(105, 205, 32710, '2024-09-08', 'overdue'),
(106, 206, 34003, '2024-09-28', 'paid'),
(107, 207, 34130, '2024-09-01', 'overdue'),
(108, 208, 37119, '2024-10-06', 'pending'),
(109, 209, 38160, '2024-09-22', 'paid'),
(110, 210, 52118, '2024-09-28', 'paid'),
(111, 211, 55124, '2024-09-30', 'paid'),
(112, 212, 63181, '2024-09-19', 'paid'),
(113, 213, 79044, '2024-09-08', 'paid'),
(114, 214, 89042, '2024-09-22', 'paid'),
(115, 215, 23159, '2024-09-02', 'pending'),
(116, 216, 90726, '2024-10-01', 'paid');
