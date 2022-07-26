create database clinic-database;
create table medical_histories (
    id serial primary key not null,
    admitted_at timestamp,
    patient_id int,
    status varchar(50),
    constraint fk_patient foreign key(patient_id) references patients(id)
);

create table patients (
    id serial primary key not null,
    name varchar(80),
    date_of_birth date
);

-----Create table named invoices----
CREATE TABLE invoices (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_histories_id INT,
    FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id)
    ON UPDATE CASCADE
);

----Create table named invoices_items-----
CREATE TABLE invoices_items(
    id INT PRIMARY KEY ALWAYS GENERATED AS IDENTITY,
    unit_price decimal,
    quantity INT,
    total_price decimal,
    invoice_id INT,
    treatement_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
    ON UPDATE CASCADE,
    FOREIGN KEY (treatement_id) REFERENCES treatements(id)
    ON UPDATE CASCADE
);
