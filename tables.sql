create schema myTask;
use myTask;


CREATE TABLE author (
                        id INT PRIMARY KEY,
                        name VARCHAR(100) NOT NULL,
                        birthdate DATE NOT NULL,
                        nationality VARCHAR(100) NOT NULL,
                        biography TEXT (6000)
);

INSERT INTO author VALUES (1, 'Illarion Pavliuk', '1980-05-14', 'Ukraine', 'Writer, producer, head of the Press and Information Department of the Ministry of Defense [1], junior lieutenant of the Armed Forces of Ukraine (since 2023), participant in the Russian-Ukrainian war, journalist, documentarian, author of bestsellers "I See You Are Interested in Darkness," "White Ashes," "The Dance of the Ignorant." Father of many children.');
INSERT INTO author VALUES (2, 'Penelope Douglas', '1977-02-01', 'America', 'American writer who works in the genre of contemporary romance and romantic prose. Penelope Douglas works are characterized by a deep immersion into the character and inner world of the main heroes who have to overcome difficult life challenges.');
INSERT INTO author VALUES (3, 'George Orwell', '1903-06-23', 'England', 'English writer, journalist, essayist, literary critic. He wrote journalistic sketches and political and literary essays. He became world famous thanks to two works written in the last years of his life: the political allegory "Animal Farm" and the dystopian novel "1984," in which he depicted a totalitarian society. He introduced the term "cold war" into political language.');
INSERT INTO author VALUES (4, 'Gabrielle Zevin', '1977-10-24', 'America', 'Contemporary American writer from New York, author of New York Times bestsellers, whose books have been translated into almost 40 languages!');
INSERT INTO author VALUES (5, 'Illarion Pavliuk', '1980-05-14', 'Ukraine', 'Writer, producer, head of the Press and Information Department of the Ministry of Defense [1], junior lieutenant of the Armed Forces of Ukraine (since 2023), participant in the Russian-Ukrainian war, journalist, documentarian, author of bestsellers "I See You Are Interested in Darkness," "White Ashes," "The Dance of the Ignorant." Father of many children.');
INSERT INTO author VALUES (6, 'Anastasia Levkova', '1986-08-01', 'Ukraine', 'Ukrainian writer, editor, journalist, manager of literary projects. A member of the Ukrainian PEN Club.');
INSERT INTO author VALUES (7, 'Kerstin Gier', '1966-10-09', 'Germany', 'German writer, most often works in the genre of contemporary womens literature. She also published under the pseudonyms: Sophie Bernard and Julie Brand. Her popular youth book "Ruby Red" is the first in a trilogy of books about time travel.');
INSERT INTO author VALUES (8, 'Daniel Keyes', '1927-08-09', 'America', 'American writer. Primarily known as the author of the science fiction novel "Flowers for Algernon." In 2001, he was awarded the title of "Distinguished Author of Science Fiction" by the "American Society of Science Fiction Writers."');
INSERT INTO author VALUES (9, 'Ivan Bahriany', '1964-08-24', 'Ukraine', 'Ukrainian poet, prose writer, playwright, publicist, journalist, and politician. Chairman of the Ukrainian National Council. Laureate of the Taras Shevchenko National Prize (1992, posthumously), nominee for the Nobel Prize in Literature (1962).');
INSERT INTO author VALUES (10, 'Ivan Kotliarevsky', '1769-08-11', 'Ukraine', 'Ukrainian writer, military officer, classic of the new Ukrainian literature, public figure. His poem "Eneida" became a great work of national importance in the new Ukrainian literature, written in the vernacular.');
INSERT INTO author VALUES (11, 'Donna Tartt', '1963-12-23', 'America', 'Contemporary American writer and author of novels "The Secret History" (1992), "The Little Friend" (2002), "The Goldfinch" (2013) [3]. In 2003, Tartt received the WH Smith Literary Award for the novel "The Little Friend" and the Pulitzer Prize for the novel "The Goldfinch" in 2014. Donna Tartt was included in Time 100: 100 Most Influential People of 2014');
INSERT INTO author VALUES (12, 'Gabrielle Zevin', '1977-10-24', 'America', 'Contemporary American writer from New York, author of New York Times bestsellers, whose books have been translated into almost 40 languages!');
INSERT INTO author VALUES (13, 'Valerian Pidmohylny', '1901-01-20', 'Ukraine', 'Ukrainian writer and translator, one of the most prominent prose writers of the Ukrainian "Executed Renaissance." A victim of Stalinist repression.');
INSERT INTO author VALUES (14, 'Larysa Kosach', '1871-02-13', 'Ukraine', 'Ukrainian writer, translator, and cultural figure, co-founder of the literary group "Pleiad" and the Ukrainian Social Democratic Party group. In modern Ukrainian tradition, she is included in the list of the most famous women of ancient and modern Ukraine');
INSERT INTO author VALUES (15, 'Stephen King', '1947-09-21', 'America', 'American writer, author of over 200 works, including over 50 bestsellers in the genres of horror, fantasy, thriller, and mystery. He is called the "King of Horror," echoing his surname, and also wrote under the pseudonym Richard Bachman');
INSERT INTO author VALUES (16, 'Max Kidruk', '1980-05-14', 'Ukraine', 'Ukrainian writer, author of novels "Until the Light Fades Forever," "Where There Is No God," "Look Into My Dreams," "Do not Look Back and Be Silent," "Cruel Sky," "Fortress," as well as a number of travelogues. He is an energy engineer by education.');
INSERT INTO author VALUES (17, 'Iryna Hrabovska', '1987-05-17', 'Ukraine', 'Ukrainian writer, author of books in the fantasy and steampunk genres.');
INSERT INTO author VALUES (18, 'Natalia Shcherba', '1981-07-21', 'Ukraine', 'Ukrainian writer. She writes her works in the genre of young adult fantasy and fantasy. She has been living in Slovakia since 2020, before the full-scale Russian invasion of Ukraine she lived in Ivano-Frankivsk[2]. Her most famous works are the cycle of young adult novels "Timehunters," "Spellbinder," "Moonstars," and "Finist."');
INSERT INTO author VALUES (19, 'Ivan Nechuy-Levytsky', '1769-08-11', 'Ukraine', 'Ukrainian writer, ethnographer, folklorist, and educator.');

CREATE TABLE publisher (
                           id INT PRIMARY KEY,
                           name CHAR (100) NOT NULL,
                           address VARCHAR(100) ,
                           phone VARCHAR(50),
                           website VARCHAR(300)
);

INSERT INTO publisher VALUES(1,'VSL', 'spilnota@starlev.com.ua','(067) 674 46 45', 'https://starylev.com.ua/');
INSERT INTO publisher VALUES(2,'School', 'sales.schoolbook@gmail.com', '(067) 766-00-77', 'https://schoolbook.com.ua/');
INSERT INTO publisher VALUES(3,'KSD', 'supports@bookclub.ua', '0 800 301 090', 'https://bookclub.ua/');
INSERT INTO publisher VALUES(4,'Masters of World Prose', 'zhupansky-publisher@ukr.net', '096 350 61 05','https://publisher.in.ua/category/books/world-masters/');
INSERT INTO publisher VALUES(5,'Vivat', 'ishop@vivat.factor.ua', '0-800-201-102', 'https://vivat-book.com.ua/');
INSERT INTO publisher VALUES(6,'Vikhol', 'publishinghouse@vikhola.com','380 (67) 599 56 77','https://www.vikhola.com/');
INSERT INTO publisher VALUES(7,'Laboratory', 'info@laboratoria.pro', '380979755223', 'https://laboratoria.pro/');
INSERT INTO publisher VALUES(8,'Folio', 'store@folio.com.ua', '38 (050)448-41-57', 'https://folio.com.ua/');
INSERT INTO publisher VALUES(9,'Educational Book - Bohdan', 'zbut@bohdan-books.com', '(0352) 52-06-07 ','https://bohdan-books.com/');
INSERT INTO publisher VALUES(10,'Vivat', 'ishop@vivat.factor.ua', '0-800-201-102', 'https://vivat-book.com.ua/');



CREATE TABLE genres (
                        id INT PRIMARY KEY,
                        genre VARCHAR(100) NOT NULL,
                        description TEXT NOT NULL
);

INSERT INTO genres VALUES(1, 'Thriller', 'A genre of film and literature in which specific techniques are used to evoke in viewers or readers a feeling of anxious anticipation, uncertainty, excitement, or fear');
INSERT INTO genres VALUES(2, 'Novel', 'Literary format, most common in the 18th-20th centuries; a large, complex epic work in which a wide range of life events is covered, and the history of the formation of the characters of many characters is deeply revealed.');
INSERT INTO genres VALUES(3, 'Science Fiction', 'Genre and method in artistic creativity; fiction based on extrapolation on the themes of science and technology.');
INSERT INTO genres VALUES(4, 'Dystopia', 'Representation in literary literature or cinematography of the dangerous consequences associated with experiments on humanity for its "improvement", certain, often intrusive, social ideals.');
INSERT INTO genres VALUES(5, 'Fantasy', 'A subgenre of fiction - one of the genres of contemporary art, the action of which takes place in an invented world, where wonders and inventions of our world are reality.');
INSERT INTO genres VALUES(6, 'Horror', 'A genre of literary fiction originally intended to evoke feelings of anxiety, fear, and related feelings in the reader. Subsequently, in the process of genre development, it contained elements of humor, conveyed the atmosphere of slasher action, etc.');
INSERT INTO genres VALUES(7, 'Adventure Literature', 'A work whose plot is based on a story of unusual adventures, exciting travels, geographic discoveries, etc.');
INSERT INTO genres VALUES(8, 'Drama', 'A literary genre, a play of social, historical, or domestic character with a sharp conflict that develops in constant tension.');
INSERT INTO genres VALUES(9, 'Classic', 'Works of this genre are examples for a certain national and world literature, music, fine arts, architecture, etc.');
INSERT INTO genres VALUES(10, 'Psychological Thriller', 'A genre that combines elements of thriller and psychological fiction. The term is usually used to describe literature or films that explore psychological thriller plots or intense, tense atmospheres.');
INSERT INTO genres VALUES(11, 'Mystery', 'Western European medieval religious drama, originating from liturgical action, based on biblical plots.');




CREATE TABLE books (
                       id INT PRIMARY KEY,
                       title VARCHAR(200) NOT NULL,
                       isbn VARCHAR(17),
                       publisher_id INT NOT NULL,
                       publication_year YEAR NOT NULL,
                       price DECIMAL(10, 2) NOT NULL,
                       FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

INSERT INTO books VALUES (1, 'I See You in the Dark','1234-567-123-13-7', 1, 2020, 465.50);
INSERT INTO books VALUES (2, 'Seven Men of Evelyn Hugo', '1234-567-123-17-7', 2, 2021, 504.32);
INSERT INTO books VALUES (3, 'Punk 57', '4580-384-973-87-9', 3, 2023, 350.00 );
INSERT INTO books VALUES (4, '1984', '3346-983-905-74-3', 4, 2015, 160.00 );
INSERT INTO books VALUES (5, 'White Ashes', '3894-098-583-95-2', 4, 2018, 250.00);
INSERT INTO books VALUES (6, 'Tomorrow, Tomorrow, Tomorrow', '3290-438-583-50-8', 5, 2022, 333.00);
INSERT INTO books VALUES (7, 'Dances with Bones', '9485-839-389-59-8', 6, 2022, 295.00);
INSERT INTO books VALUES (8, 'There is Land beyond the Dugout', '3904-200-494-35-4', 7, 2023, 399.00);
INSERT INTO books VALUES (9, 'Ruby Book', '8392-843-902-94-6', 2, 2017, 325.00);
INSERT INTO books VALUES (10, 'Sapphire Book', '5634-894-490-04-8', 2, 2022, 360.00);
INSERT INTO books VALUES (11, 'Emerald Book', '7393-894-439-09-4', 2, 2018, 440.00);
INSERT INTO books VALUES (12, 'Flowers for Algernon', '3294-894-985-34-7', 3, 2020, 210.00);
INSERT INTO books VALUES (13, 'Tiger Hunters', '3920-489-393-32-6', 8,  2021, 190.00);
INSERT INTO books VALUES (14, 'Aeneid', '9382-030-389-85-7', 9, 2022, 490.00);
INSERT INTO books VALUES (15, 'The Secret History', '3859-459-438-86-5', 3, 1995, 450.00);
INSERT INTO books VALUES (16, 'Walls in My Head', '9343-923-845-55-7', 6, 2020, 275.00);
INSERT INTO books VALUES (17, 'City','4589-879-585-58-6', 8, 2021, 220.00);
INSERT INTO books VALUES (18, 'A Small Drama',  '8938-438-839-48-5', 5, 2020, 199.00);
INSERT INTO books VALUES (19, 'Forest Song', '2309-480-932-00-8', 5, 2023, 240.00);
INSERT INTO books VALUES (20, 'Institute', '1929-373-147-74-1', 3, 2020, 400.00);
INSERT INTO books VALUES (21, 'Do Not Turn Around and Be Silent', '4730-738-934-70-4', 3, 2017, 280.00);
INSERT INTO books VALUES (22, 'Stars and Bones', '5424-493-884-39-4', 2, 2022, 370.00);
INSERT INTO books VALUES (23, 'Moontreys: Jump Over the Stars', '8430-384-906-45-7', 2, 2019, 385.00);
INSERT INTO books VALUES (24, 'Moontreys: Flight Through Stones', '9302-939-892-81-2', 2, 2019, 385.00);
INSERT INTO books VALUES (25, 'Moontreys: Steps into Infinity', '0322-488-120-13-0', 2, 2019, 385.00 );
INSERT INTO books VALUES (26, 'Moontreys: Dance of the White Dwarfs', '4819-111-391-19-1', 2, 2019, 385.00 );
INSERT INTO books VALUES (27, 'The Family of Kajdashevs','3929-399-439-10-2', 1, 2011, 140.00 );



CREATE TABLE book_author (
                             book_id INT NOT NULL ,
                             author_id INT NOT NULL ,
                             FOREIGN KEY(book_id) REFERENCES books(id),
                             FOREIGN KEY(author_id) REFERENCES author(id)

);
INSERT INTO book_author VALUES(1, 1);
INSERT INTO book_author VALUES(2, 2);
INSERT INTO book_author VALUES(3, 2);
INSERT INTO book_author VALUES(4, 3);
INSERT INTO book_author VALUES(5, 4);
INSERT INTO book_author VALUES(6, 4);
INSERT INTO book_author VALUES(7, 5);
INSERT INTO book_author VALUES(8, 6);
INSERT INTO book_author VALUES(9, 7);
INSERT INTO book_author VALUES(10, 7);
INSERT INTO book_author VALUES(11, 7);
INSERT INTO book_author VALUES(12, 8);
INSERT INTO book_author VALUES(13, 9);
INSERT INTO book_author VALUES(14, 10);
INSERT INTO book_author VALUES(15, 11);
INSERT INTO book_author VALUES(16, 12);
INSERT INTO book_author VALUES(17, 13);
INSERT INTO book_author VALUES(18, 13);
INSERT INTO book_author VALUES(19, 14);
INSERT INTO book_author VALUES(20, 15);
INSERT INTO book_author VALUES(21, 16);
INSERT INTO book_author VALUES(22, 17);
INSERT INTO book_author VALUES(23, 18);
INSERT INTO book_author VALUES(24, 18);
INSERT INTO book_author VALUES(25, 18);
INSERT INTO book_author VALUES(26, 18);
INSERT INTO book_author VALUES(27, 19);
INSERT INTO book_author VALUES(20, 4);



CREATE TABLE book_genre(
                           book_id INT NOT NULL ,
                           genre_id INT NOT NULL,
                           FOREIGN KEY(book_id) REFERENCES books(id),
                           FOREIGN KEY(genre_id) REFERENCES genres(id)

);
INSERT INTO book_genre VALUES(1, 1);
INSERT INTO book_genre VALUES(2, 2);
INSERT INTO book_genre VALUES(3, 3);
INSERT INTO book_genre VALUES(4, 4);
INSERT INTO book_genre VALUES(5, 5);
INSERT INTO book_genre VALUES(6, 3);
INSERT INTO book_genre VALUES(7, 6);
INSERT INTO book_genre VALUES(8, 7);
INSERT INTO book_genre VALUES(9, 2);
INSERT INTO book_genre VALUES(10, 2);
INSERT INTO book_genre VALUES(11, 2);
INSERT INTO book_genre VALUES(12, 8);
INSERT INTO book_genre VALUES(13, 7);
INSERT INTO book_genre VALUES(14, 9);
INSERT INTO book_genre VALUES(15, 11);
INSERT INTO book_genre VALUES(16, 10);
INSERT INTO book_genre VALUES(17, 8);
INSERT INTO book_genre VALUES(18, 8);
INSERT INTO book_genre VALUES(19, 7);
INSERT INTO book_genre VALUES(20, 6);
INSERT INTO book_genre VALUES(21, 1);
INSERT INTO book_genre VALUES(22, 4);
INSERT INTO book_genre VALUES(23, 3);
INSERT INTO book_genre VALUES(24, 9);
INSERT INTO book_genre VALUES(25, 10);
INSERT INTO book_genre VALUES(26, 11);
INSERT INTO book_genre VALUES(27, 6);
INSERT INTO book_genre VALUES(27, 8);




CREATE TABLE clients (
                         id INT PRIMARY KEY ,
                         name VARCHAR(100) NOT NULL,
                         address VARCHAR(255) NOT NULL,
                         phone VARCHAR(20) NOT NULL,
                         email VARCHAR(100) NOT NULL,
                         user_password VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(user_password) >= 6 AND CHAR_LENGTH(user_password) <= 30)
);

INSERT INTO clients VALUES(1,'Ivan Petrov', 'Shevchenko St., 10, Kyiv', '380951234567', 'ivan@example.com', 'password1');
INSERT INTO clients VALUES(2,'Maria Ivanova', 'Lesi Ukrainki St., 5, Lviv', '380981234567', 'maria@example.com', 'password2');
INSERT INTO clients VALUES(3,'Oleg Sidorenko', 'Peremohy Ave., 25, Kharkiv', '380931234567', 'oleg@example.com', 'password3');
INSERT INTO clients VALUES(4,'Natalia Kovalchuk', 'Gagarina St., 15, Dnipro', '380671234567', 'natalia@example.com', 'password4');
INSERT INTO clients VALUES(5,'Petro Hryhorenko', 'Pushkina St., 7, Odesa', '380501234567', 'petro@example.com', 'password5');
INSERT INTO clients VALUES(6,'Oksana Ignatieva', 'Kotsubynskoho St., 3, Zaporizhzhia', '380931234567', 'oksana@example.com', 'password6');
INSERT INTO clients VALUES(7,'Andrii Melnyk', 'Shevchenko St., 20, Chernihiv', '380501234567', 'andriy@example.com', 'password7');
INSERT INTO clients VALUES(8,'Tetiana Kravchenko', 'Stepana Bandery St., 12, Ivano-Frankivsk', '380961234567', 'tetiana@example.com', 'password8');
INSERT INTO clients VALUES(9,'Vitalii Shevchuk', 'Tarasivska St., 30, Lutsk', '380971234567', 'vitalii@example.com', 'password9');
INSERT INTO clients VALUES(10,'Iryna Lysenko', 'Starokyivska St., 8, Kropyvnytskyi', '380951234567', 'irina@example.com', 'password10');
INSERT INTO clients VALUES(11,'Olena Mykhailenko', 'Sumska St., 40, Poltava', '380501234567', 'olena@example.com', 'password11');
INSERT INTO clients VALUES(12,'Yevheniia Savchenko', 'Lenina St., 18, Sumy', '380931234567', 'yevgeniya@example.com', 'password12');
INSERT INTO clients VALUES(13,'Vasyl Shevchenko', 'Lermontova St., 22, Rivne', '380501234567', 'vasil@example.com', 'password13');
INSERT INTO clients VALUES(14,'Maksym Koval', 'Gagarina St., 33, Kherson', '380971234567', 'maksym@example.com', 'password14');
INSERT INTO clients VALUES(15,'Darina Tkachenko', 'Sadova St., 14, Cherkasy', '380981234567', 'darina@example.com', 'password15');
INSERT INTO clients VALUES(16,'Oleksandr Petrenko', 'Poltavska St., 5, Kremenchuk', '380951234567', 'oleksandr@example.com', 'password16');
INSERT INTO clients VALUES(17,'Svitlana Vasylenko', 'Hrushevskoho St., 16, Ivano-Frankivsk', '380501234567', 'svitlana@example.com', 'password17');
INSERT INTO clients VALUES(18,'Artem Kuzmin', 'Kirova St., 9, Kamianets-Podilskyi', '380931234567', 'artem@example.com', 'password18');
INSERT INTO clients VALUES(19,'Yulia Oliinyk', 'Zhytneva St., 7, Zhytomyr', '380971234567', 'yulia@example.com', 'password19');
INSERT INTO clients VALUES(20,'Mykhailo Semenov', 'Shevchenko St., 11, Ternopil', '380951234567', 'mikhailo@example.com', 'password20');



CREATE TABLE loan (
                      id INT PRIMARY KEY ,
                      client_id INT NOT NULL UNIQUE,
                      loan_date DATE NOT NULL,
                      due_date DATE NOT NULL,
                      return_date DATE,
                      FOREIGN KEY (client_id) REFERENCES clients(id)
);


INSERT INTO loan VALUES(1, 1, '2024-02-01', '2024-02-15', NULL);
INSERT INTO loan VALUES(2, 5, '2024-01-20', '2024-02-10', '2024-02-08');
INSERT INTO loan VALUES(3, 4, '2024-01-25', '2024-02-10', NULL);
INSERT INTO loan VALUES(4, 6, '2024-01-30', '2024-02-15', NULL);
INSERT INTO loan VALUES(5, 12, '2024-01-15', '2024-01-30', '2024-01-28');
INSERT INTO loan VALUES(6, 14, '2024-01-18', '2024-02-05', NULL);
INSERT INTO loan VALUES(7, 2, '2024-01-22', '2024-02-12', NULL);
INSERT INTO loan VALUES(8, 3, '2024-01-28', '2024-02-15', '2024-02-14');
INSERT INTO loan VALUES(9, 9, '2024-01-10', '2024-01-25', '2024-01-23');
INSERT INTO loan VALUES(10, 7, '2024-01-12', '2024-02-02', NULL);

CREATE TABLE book_loan(
                          book_id INT NOT NULL,
                          loan_id INT NOT NULL,
                          FOREIGN KEY(book_id) REFERENCES books(id),
                          FOREIGN KEY(loan_id) REFERENCES loan(id)
    
);
INSERT INTO book_loan VALUES(1, 3);
INSERT INTO book_loan VALUES(2, 8);
INSERT INTO book_loan VALUES(9, 2);
INSERT INTO book_loan VALUES(9, 6);
INSERT INTO book_loan VALUES(4, 2);
INSERT INTO book_loan VALUES(12, 1);
INSERT INTO book_loan VALUES(10, 5);
INSERT INTO book_loan VALUES(7, 7);
INSERT INTO book_loan VALUES(20, 4);
INSERT INTO book_loan VALUES(18, 9);


SELECT author.name, COUNT(books.id) AS book_count
FROM author
         JOIN book_author ON author.id = book_author.author_id
         JOIN books ON book_author.book_id = books.id
GROUP BY author.name
ORDER BY book_count DESC
LIMIT 3;

SELECT b.title AS book_title, a.name AS author_name, g.genre, p.name AS publisher_name
FROM books b
         JOIN book_author ba ON b.id = ba.book_id
         JOIN author a ON ba.author_id = a.id
         JOIN book_genre bg ON b.id = bg.book_id
         JOIN genres g ON bg.genre_id = g.id
         JOIN publisher p ON b.publisher_id = p.id
WHERE b.id IN (
    SELECT id
    FROM (
             SELECT b.id, COUNT(*) AS count_favorites
             FROM books b
                      JOIN book_loan bl ON b.id = bl.book_id
             GROUP BY b.id
             ORDER BY count_favorites DESC
             LIMIT 5
         ) AS favorite_books
);


SELECT * FROM book_loan;