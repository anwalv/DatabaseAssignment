create schema myTask;
use myTask;

CREATE TABLE author (
                        id INT PRIMARY KEY,
                        name VARCHAR(100) NOT NULL,
                        birthdate DATE NOT NULL,
                        nationality VARCHAR(100) NOT NULL,
                        biography TEXT (6000)
);


CREATE TABLE publisher (
                           id INT PRIMARY KEY,
                           name CHAR (100) NOT NULL,
                           address VARCHAR(100) ,
                           phone VARCHAR(50),
                           website VARCHAR(300)
);


CREATE TABLE genres (
                        id INT PRIMARY KEY,
                        genre VARCHAR(100) NOT NULL,
                        description TEXT NOT NULL
);


CREATE TABLE books (
                       id INT PRIMARY KEY,
                       title VARCHAR(200) NOT NULL,
                       isbn VARCHAR(17),
                       publisher_id INT NOT NULL,
                       publication_year YEAR NOT NULL,
                       price DECIMAL(10, 2) NOT NULL,
                       FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);



CREATE TABLE clients (
                         id INT PRIMARY KEY ,
                         name VARCHAR(100) NOT NULL,
                         address VARCHAR(255) NOT NULL,
                         phone VARCHAR(20) NOT NULL,
                         email VARCHAR(100) NOT NULL,
                         user_password VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(user_password) >= 6 AND CHAR_LENGTH(user_password) <= 30)
);


CREATE TABLE loan (
                      id INT PRIMARY KEY ,
                      client_id INT NOT NULL UNIQUE,
                      loan_date DATE NOT NULL,
                      due_date DATE NOT NULL,
                      return_date DATE,
                      FOREIGN KEY (client_id) REFERENCES clients(id)
); 



