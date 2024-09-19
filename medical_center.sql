DROP DATABASE IF EXISTS medical_center_db;
CREATE DATABASE medical_center_db;

-- Hospital staff (could be doctors, nurses, etc.)
CREATE TABLE hospital(
    id SERIAL PRIMARY KEY,
    role TEXT NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

-- Patient table
CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INT NOT NULL
);

-- Doctor table (if you want to separate doctors from hospital staff)
CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT NOT NULL
);

-- Diseases table
CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

-- Relationship table for patients and diseases (many-to-many)
CREATE TABLE patient_disease(
    disease_id INTEGER REFERENCES disease(id) ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patient(id) ON DELETE CASCADE,
    PRIMARY KEY (disease_id, patient_id) 
);

-- Relationship table for doctors and patients (many-to-many)
CREATE TABLE doctor_patient(
    doctor_id INTEGER REFERENCES doctor(id) ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patient(id) ON DELETE CASCADE,
    PRIMARY KEY (doctor_id, patient_id)
);
