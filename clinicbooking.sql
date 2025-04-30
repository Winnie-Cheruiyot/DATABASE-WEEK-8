-- create a database
CREATE DATABASE clinicbooking;
USE clinicbooking;
-- create table patients
CREATE TABLE patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    address TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- insert sample data into patients table

INSERT INTO patients (first_name, last_name, email, phone_number, date_of_birth, gender, address, created_at, updated_at) VALUES
('William', 'Doe', 'willy.doe@example.com', '1234567890', '1990-05-12', 'Male', '123 Main St', NOW(), NOW()),
('Faith', 'Smith', 'faith.smith@example.com', '2345678901', '1985-08-23', 'Female', '456 Elm St', NOW(), NOW()),
('Lake', 'Brown', 'lake.brown@example.com', '3456789012', '1992-11-30', 'Female', '789 Oak St', NOW(), NOW()),
('Bob', 'Johnson', 'bob.johnson@example.com', '4567890123', '1988-01-17', 'Male', '101 Pine St', NOW(), NOW()),
('Emily', 'Clark', 'emily.clark@example.com', '5678901234', '1995-04-09', 'Female', '202 Maple St', NOW(), NOW());

-- create table doctors
CREATE TABLE doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    specialty VARCHAR(255),
    room_number VARCHAR(20),
    is_available BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- insert sample data into doctors table
INSERT INTO doctors (first_name, last_name, email, phone_number, specialty, room_number, is_available, created_at, updated_at) VALUES
('Dr. Sarah', 'Lee', 'sarah.lee@clinic.com', '6001234567', 'Cardiology', '101A', TRUE, NOW(), NOW()),
('Dr. Tom', 'Harris', 'tom.harris@clinic.com', '6002345678', 'Pediatrics', '202B', TRUE, NOW(), NOW()),
('Dr. Priya', 'Rao', 'priya.rao@clinic.com', '6003456789', 'Dermatology', '303C', FALSE, NOW(), NOW()),
('Dr. Daniel', 'Nguyen', 'daniel.nguyen@clinic.com', '6004567890', 'Orthopedics', '404D', TRUE, NOW(), NOW()),
('Dr. Maria', 'Gomez', 'maria.gomez@clinic.com', '6005678901', 'Neurology', '505E', TRUE, NOW(), NOW());

-- create table appointments
CREATE TABLE appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    notes TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);
-- insert sample data into appointments table
INSERT INTO appointments (patient_id, doctor_id, appointment_date, status, notes, created_at, updated_at) VALUES
(1, 1, '2025-05-01 10:00:00', 'Scheduled', 'Chest pain consultation', NOW(), NOW()),
(2, 2, '2025-05-02 11:30:00', 'Completed', 'Routine check-up', NOW(), NOW()),
(3, 3, '2025-05-03 14:00:00', 'Cancelled', 'Skin allergy', NOW(), NOW()),
(4, 4, '2025-05-04 09:30:00', 'Scheduled', 'Knee injury', NOW(), NOW()),
(5, 5, '2025-05-05 13:15:00', 'Scheduled', 'Migraine issues', NOW(), NOW());

-- create table treatments
-- This table will store information about treatments associated with appointments
CREATE TABLE treatments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT,
    description TEXT,
    treatment_date DATETIME,
    cost DECIMAL(10,2),
    FOREIGN KEY (appointment_id) REFERENCES appointments(id)
);
-- insert sample data into treatments table
INSERT INTO treatments (appointment_id, description, treatment_date, cost) VALUES
(1, 'EKG and blood tests performed', '2025-05-01', 150.00),
(2, 'General consultation and vaccination', '2025-05-02', 100.00),
(3, 'Prescribed antihistamines', '2025-05-03', 75.00),
(4, 'X-ray and knee brace recommended', '2025-05-04', 200.00),
(5, 'Neurological exam and MRI scheduled', '2025-05-05', 300.00);
