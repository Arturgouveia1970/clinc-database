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