DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center


CREATE TABLE doctors(
    id SERIAL PRIMARY KEY, 
    doctor_first TEXT NOT NULL, 
    doctor_last TEXT NOT NULL
);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY, 
    patient_first TEXT NOT NULL,
    patient_last TEXT NOT NULL
);

CREATE TABLE diagnoses(
    id SERIAL PRIMARY KEY, 
    disease TEXT NULL
);

CREATE TABLE doctor_patient(
    id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL REFERENCES patients ON DELETE CASCADE,
    doctor_id INT NOT NULL REFERENCES doctors ON DELETE CASCADE,
    diagnosis_id INT NULL REFERENCES diagnoses
);

INSERT INTO doctors(doctor_first, doctor_last)
VALUES
    ('Milo', 'Menicucci'),
    ('Marvin', 'Lemor'),
    ('Mojo', 'Taylor');

INSERT INTO patients(patient_first, patient_last)
VALUES
    ('Mark', 'Zuckerberg'),
    ('Elon', 'Musk'),
    ('Dario', 'Amodei'),
    ('Lex', 'Fridman');

INSERT INTO diagnoses(disease)
VALUES
    ('Suds'),
    ('Pneumonia'),
    ('Asthma'),
    ('Lyme disease'),
    ('Arthritis');

INSERT INTO doctor_patient(patient_id, doctor_id, diagnosis_id)
VALUES
    (1, 3, 5),
    (4, 3, null),
    (2, 1, 3),
    (2, 1, 1),
    (3, 1, null),
    (4, 2, 1),
    (3, 2, 4),
    (3, 2, 2);


-- see all doctor/patient names with disease
 
-- SELECT doctor_last, patient_first, disease FROM doctor_patient JOIN patients ON  doctor_patient.patient_id = patients.id JOIN doctors ON doctor_patient.doctor_id = doctors.id JOIN diagnoses ON doctor_patient.diagnosis_id = diagnoses.id; 

