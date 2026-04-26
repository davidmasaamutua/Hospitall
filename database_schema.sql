-- Kenya HMS Database Schema
-- PostgreSQL/MySQL Compatible

-- Users and Authentication
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('admin', 'doctor', 'nurse', 'receptionist', 'pharmacist', 'lab_technician') NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Hospitals/Branches
CREATE TABLE hospitals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    type ENUM('public', 'private') NOT NULL,
    nhif_registered BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Patients
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    hospital_id INT REFERENCES hospitals(id),
    national_id VARCHAR(20) UNIQUE,
    passport_number VARCHAR(20) UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender ENUM('male', 'female', 'other'),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    emergency_contact VARCHAR(100),
    nhif_number VARCHAR(20),
    nhif_status ENUM('active', 'inactive', 'pending') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Staff
CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    hospital_id INT REFERENCES hospitals(id),
    employee_id VARCHAR(20) UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100),
    license_number VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Appointments
CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(id),
    doctor_id INT REFERENCES staff(id),
    hospital_id INT REFERENCES hospitals(id),
    appointment_date DATETIME NOT NULL,
    status ENUM('scheduled', 'confirmed', 'completed', 'cancelled', 'no_show') DEFAULT 'scheduled',
    type ENUM('consultation', 'follow_up', 'emergency'),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Wards and Beds
CREATE TABLE wards (
    id SERIAL PRIMARY KEY,
    hospital_id INT REFERENCES hospitals(id),
    name VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    type VARCHAR(50)
);

CREATE TABLE beds (
    id SERIAL PRIMARY KEY,
    ward_id INT REFERENCES wards(id),
    bed_number VARCHAR(10) NOT NULL,
    status ENUM('available', 'occupied', 'maintenance') DEFAULT 'available'
);

-- Inpatient Admissions
CREATE TABLE admissions (
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(id),
    ward_id INT REFERENCES wards(id),
    bed_id INT REFERENCES beds(id),
    admitting_doctor_id INT REFERENCES staff(id),
    admission_date DATETIME NOT NULL,
    discharge_date DATETIME,
    diagnosis TEXT,
    status ENUM('active', 'discharged', 'transferred') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- EMR - Medical Records
CREATE TABLE medical_records (
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(id),
    doctor_id INT REFERENCES staff(id),
    visit_date DATETIME NOT NULL,
    chief_complaint TEXT,
    history_of_present_illness TEXT,
    physical_examination TEXT,
    diagnosis TEXT,
    treatment_plan TEXT,
    prescriptions TEXT,
    follow_up_instructions TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Pharmacy
CREATE TABLE drugs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    generic_name VARCHAR(100),
    dosage_form VARCHAR(50),
    strength VARCHAR(50),
    manufacturer VARCHAR(100),
    nhif_covered BOOLEAN DEFAULT FALSE
);

CREATE TABLE drug_inventory (
    id SERIAL PRIMARY KEY,
    drug_id INT REFERENCES drugs(id),
    hospital_id INT REFERENCES hospitals(id),
    batch_number VARCHAR(50),
    quantity INT NOT NULL,
    expiry_date DATE,
    unit_cost DECIMAL(10,2),
    selling_price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE prescriptions (
    id SERIAL PRIMARY KEY,
    medical_record_id INT REFERENCES medical_records(id),
    drug_id INT REFERENCES drugs(id),
    dosage VARCHAR(100),
    frequency VARCHAR(50),
    duration VARCHAR(50),
    quantity_prescribed INT,
    dispensed BOOLEAN DEFAULT FALSE,
    dispensed_date DATETIME,
    dispensed_by INT REFERENCES staff(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Laboratory
CREATE TABLE lab_tests (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    normal_range TEXT,
    unit VARCHAR(20),
    cost DECIMAL(10,2),
    nhif_covered BOOLEAN DEFAULT FALSE
);

CREATE TABLE lab_orders (
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(id),
    doctor_id INT REFERENCES staff(id),
    test_ids JSON, -- Array of test IDs
    order_date DATETIME NOT NULL,
    status ENUM('ordered', 'collected', 'processing', 'completed', 'cancelled') DEFAULT 'ordered',
    priority ENUM('routine', 'urgent', 'emergency') DEFAULT 'routine',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lab_results (
    id SERIAL PRIMARY KEY,
    lab_order_id INT REFERENCES lab_orders(id),
    test_id INT REFERENCES lab_tests(id),
    result_value VARCHAR(100),
    result_text TEXT,
    interpretation TEXT,
    technician_id INT REFERENCES staff(id),
    result_date DATETIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Billing
CREATE TABLE bills (
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(id),
    hospital_id INT REFERENCES hospitals(id),
    bill_date DATE NOT NULL,
    due_date DATE,
    total_amount DECIMAL(10,2) NOT NULL,
    paid_amount DECIMAL(10,2) DEFAULT 0,
    balance DECIMAL(10,2),
    status ENUM('pending', 'partially_paid', 'paid', 'overdue', 'cancelled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE bill_items (
    id SERIAL PRIMARY KEY,
    bill_id INT REFERENCES bills(id),
    item_type ENUM('consultation', 'lab_test', 'drug', 'ward_stay', 'procedure'),
    item_id INT, -- References different tables based on type
    description VARCHAR(200),
    quantity INT DEFAULT 1,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    nhif_covered BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Payments
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    bill_id INT REFERENCES bills(id),
    patient_id INT REFERENCES patients(id),
    amount DECIMAL(10,2) NOT NULL,
    payment_method ENUM('cash', 'mpesa', 'card', 'nhif', 'insurance'),
    mpesa_transaction_id VARCHAR(50),
    payment_date DATETIME NOT NULL,
    received_by INT REFERENCES staff(id),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- NHIF Integration
CREATE TABLE nhif_claims (
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(id),
    bill_id INT REFERENCES bills(id),
    claim_number VARCHAR(50) UNIQUE,
    claim_type ENUM('outpatient', 'inpatient'),
    amount_claimed DECIMAL(10,2),
    amount_approved DECIMAL(10,2),
    status ENUM('submitted', 'approved', 'rejected', 'paid') DEFAULT 'submitted',
    submission_date DATE,
    approval_date DATE,
    payment_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Audit Logs
CREATE TABLE audit_logs (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    action VARCHAR(100) NOT NULL,
    table_name VARCHAR(50),
    record_id INT,
    old_values JSON,
    new_values JSON,
    ip_address VARCHAR(45),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for performance
CREATE INDEX idx_patients_national_id ON patients(national_id);
CREATE INDEX idx_patients_nhif_number ON patients(nhif_number);
CREATE INDEX idx_appointments_date ON appointments(appointment_date);
CREATE INDEX idx_appointments_patient ON appointments(patient_id);
CREATE INDEX idx_admissions_patient ON admissions(patient_id);
CREATE INDEX idx_medical_records_patient ON medical_records(patient_id);
CREATE INDEX idx_bills_patient ON bills(patient_id);
CREATE INDEX idx_payments_bill ON payments(bill_id);