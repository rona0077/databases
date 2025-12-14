-- 1 zadanie
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255),
    publisher_city VARCHAR(100)
);


CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_name VARCHAR(255),
    publisher_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);
-- publisher_name и publisher_city онинеключевые и  зависят не напрямую от первичного
-- 2зад
CREATE TABLE CarModels (
    car_model VARCHAR(100) PRIMARY KEY,
    car_manufacturer VARCHAR(100)
);

CREATE TABLE RaceResults (
    race_id INT,
    driver_id INT,
    car_model VARCHAR(100),
    finish_time TIME,
    PRIMARY KEY (race_id, driver_id),
    FOREIGN KEY (car_model) REFERENCES CarModels(car_model)
);
-- car_manufacturer зависит от car_model, а не напрямую от ключа 

-- 3задание
CREATE TABLE EventTypeRoom (
    event_type VARCHAR(50) PRIMARY KEY,
    room_name VARCHAR(100) NOT NULL
);


CREATE TABLE RoomBookings (
    booking_time DATETIME,
    event_name VARCHAR(255),
    event_type VARCHAR(50),
    PRIMARY KEY (booking_time, event_name),
    FOREIGN KEY (event_type) REFERENCES EventTypeRoom(event_type)
);
-- event_type  не является суперключом, так как он не определяет booking_time или event_name.
-- поэтмоу и нарушается нфбк