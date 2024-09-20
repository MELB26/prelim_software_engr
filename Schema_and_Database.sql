create table Users (
    user_id int primary key,
    name text not null,
    phone_number int,
    role text not null check (role in ('patient', 'doctor', 'nurse', 'admin'))
);

create table MedicalResources (
    resource_id int primary key,
    resource_name text not null, 
    status text not null check (status in ('available', 'reserved', 'maintenance')) default 'available'
);

create table Reservations (
    reservation_id int primary key,
    user_id int,
    resource_id int,
    reservation_start datetime not null,
    reservation_end datetime not null,
    status text not null check (status in ('pending', 'confirmed', 'completed', 'canceled')) default 'pending'
);

create table Payments (
    payment_id int primary key,
    reservation_id int,
    amount DECIMAL(10, 2) not null,
    payment_method text not null check (payment_method in ('cash', 'insurance', 'credit')),
    payment_status text not null check (payment_status in ('pending', 'completed', 'failed')) default 'pending',
    payment_date datetime default (current_timestamp)
);

create table ResourceAvailability (
    availability_id int primary key,
    resource_id int,
    available_date date not null,
    available_start time not null,
    available_end time not null
);



insert into Users (user_id, name, phone_number, role) values
(1, 'Dr. Aling Kuring', '09561234562', 'doctor'),
(2, 'Nurse Bugoy', '09491234561', 'nurse'),
(3, 'Alice Guo', '09481234569', 'patient'),
(4, 'Dr. Quiboloy', '09151234568', 'doctor'),
(5, 'Patient Diwata', '09451234563', 'patient'),
(6, 'Nurse Rosmar', '09561234566', 'nurse'),
(7, 'Patient Speed', '09091234565', 'patient'),
(8, 'Dr. Cassandra Ong', '09151234561', 'doctor'),
(9, 'Patient Riza Hontiveroz', '09491234564', 'patient'),
(10, 'Patient Jinggoy Estrada', '09091234567', 'patient');

insert into MedicalResources (resource_id, resource_name, status) values
(1, 'MRI Machine', 'reserved'),
(2, 'Operating Room 1', 'available'),
(3, 'X-ray Room', 'available'),
(4, 'Patient Room 101', 'maintenance'),
(5, 'ICU Bed 5', 'available');

insert into Payments (payment_id, reservation_id, amount, payment_method, payment_status) values
(2, 1, 500.00, 'cash', 'completed'),
(3, 2, 1000.00, 'insurance', 'pending'),
(4, 3, 300.00, 'credit', 'completed'),
(5, 4, 700.00, 'cash', 'completed'),
(6, 5, 0.00, 'insurance', 'failed'),
(7, 6, 400.00, 'insurance', 'pending'),
(8, 7, 1500.00, 'credit', 'pending'),
(9, 8, 200.00, 'insurance', 'completed'),
(10, 9, 150.00, 'insurance', 'failed'),
(1, 1, 0.00, 'cash', 'failed');

insert into Reservations (reservation_id, user_id, resource_id, reservation_start, reservation_end, status) values
(2, 1, 1, '2024-09-20 10:00:00', '2024-09-20 11:00:00', 'confirmed'),
(3, 2, 2, '2024-09-20 10:00:00', '2024-09-20 13:00:00', 'pending'),
(4, 3, 3, '2024-09-21 11:00:00', '2024-09-21 13:00:00', 'confirmed'),
(5, 4, 4, '2024-09-21 00:00:00', '2024-09-21 00:00:00', 'canceled'),
(6, 5, 5, '2024-09-22 14:00:00', '2024-09-22 18:00:00', 'pending'),
(7, 6, 1, '2024-09-22 11:00:00', '2024-09-22 18:00:00', 'confirmed'),
(8, 7, 2, '2024-09-23 18:00:00', '2024-09-23 19:00:00', 'pending'),
(9, 8, 3, '2024-09-23 19:00:00', '2024-09-23 20:00:00', 'completed'),
(10, 9, 4, '2024-09-24 00:00:00', '2024-09-24 00:00:00', 'canceled');

insert into ResourceAvailability (availability_id, resource_id, available_date, available_start, available_end) values
(1, 1, '2024-09-20', '19:00:00', '24:00:00'),
(2, 2, '2024-09-20', '14:00:00', '17:00:00'),
(3, 3, '2024-09-21', '14:00:00', '18:00:00'),
(4, 4, '2024-09-21', '10:00:00', '00:00:00'),
(5, 5, '2024-09-22', '10:00:00', '14:00:00'),
(6, 1, '2024-09-22', '10:00:00', '24:00:00'),
(7, 2, '2024-09-23', '19:00:00', '24:00:00'),
(8, 3, '2024-09-23', '20:00:00', '24:00:00'),
(9, 4, '2024-09-24', '00:00:00', '00:00:00'),
(10, 5, '2024-09-24', '10:00:00', '24:00:00');
