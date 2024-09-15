CREATE TABLE Users (
    user_id int primary key,
    name text not null,
    phone_number text
);
CREATE TABLE BilliardTables (
    table_id int primary key,
    table_name text not null,
    status text not null check (status IN ('available', 'reserved', 'maintenance')) default 'available'
);
CREATE TABLE Reservations (
    reservation_id int primary key,
    user_id int,
    table_id int,
    reservation_start datetime not null,
    reservation_end datetime not null,
    status text not null check (status IN ('pending', 'confirmed', 'completed', 'canceled')) default 'pending'
);
CREATE TABLE Payments (
    payment_id int primary key,
    reservation_id int,
    amount DECIMAL(10, 2) not null,
    payment_method text not null check (payment_method IN ('cash', 'gcash')),
    payment_status text not null check (payment_status IN ('pending', 'completed', 'failed')) default 'pending',
    payment_date datetime default (CURRENT_TIMESTAMP)
);
CREATE TABLE TableAvailability (
    availability_id int primary key,
    table_id int,
    available_date date not null,
    available_start time not null,
    available_end time not null
);




INSERT INTO Users (user_id, name, phone_number) VALUES
(1, 'Aling Kuring', '09561234562'),
(2, 'Bugoy', '09491234561'),
(3, 'Alice Guo', '09481234569'),
(4, 'Quiboloy', '09151234568'),
(5, 'Diwata Pares Overload', '09451234563'),
(6, 'Rosmar', '09561234566'),
(7, 'iShowSpeed', '09091234565'),
(8, 'Cassandra Ong', '09151234561'),
(9, 'Riza Hontiveroz', '09491234564'),
(10, 'Jinggoy Estrada', '09091234567');

INSERT INTO BilliardTables (table_id, table_name, status) VALUES
(1, 'Table 1', 'reserved'),
(2, 'Table 2', 'available'),
(3, 'Table 3', 'available'),
(4, 'Table 4', 'maintenance'),
(5, 'Table 5', 'available');

INSERT INTO Payments (payment_id, reservation_id, amount, payment_method, payment_status) VALUES
(2, 1, 100.00, 'cash', 'completed'),
(3, 2, 100.00, 'gcash', 'pending'),
(4, 3, 300.00, 'gcash', 'completed'),
(5, 4, 200.00, 'cash', 'completed'),
(6, 5, 0.00, 'gcash', 'failed'),
(7, 6, 400.00, 'gcash', 'pending'),
(8, 7, 700.00, 'cash', 'pending'),
(9, 8, 100.00, 'gcash', 'completed'),
(10, 9, 100.00, 'gcash', 'failed'),
(1, 1, 0.00, 'cash', 'failed');

INSERT INTO Reservations (reservation_id, user_id, table_id, reservation_start, reservation_end, status) VALUES
(2, 1, 1, '2024-09-20 10:00:00', '2024-09-20 11:00:00', 'confirmed'),
(3, 2, 2, '2024-09-20 10:00:00', '2024-09-20 13:00:00', 'pending'),
(4, 3, 3, '2024-09-21 11:00:00', '2024-09-21 13:00:00', 'confirmed'),
(5, 4, 4, '2024-09-21 00:00:00', '2024-09-21 00:00:00', 'canceled'),
(6, 5, 5, '2024-09-22 14:00:00', '2024-09-22 18:00:00', 'pending'),
(7, 6, 1, '2024-09-22 11:00:00', '2024-09-22 18:00:00', 'confirmed'),
(8, 7, 2, '2024-09-23 18:00:00', '2024-09-23 19:00:00', 'pending'),
(9, 8, 3, '2024-09-23 19:00:00', '2024-09-23 20:00:00', 'completed'),
(10, 9, 4, '2024-09-24 00:00:00', '2024-09-24 00:00:00', 'canceled');

INSERT INTO TableAvailability (availability_id, table_id, available_date, available_start, available_end) VALUES
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
