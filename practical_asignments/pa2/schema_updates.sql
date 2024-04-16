CREATE TABLE book_author (
                             book_id INT NOT NULL ,
                             author_id INT NOT NULL ,
                             FOREIGN KEY(book_id) REFERENCES books(id),
                             FOREIGN KEY(author_id) REFERENCES author(id)

);

CREATE TABLE book_genre(
                           book_id INT NOT NULL ,
                           genre_id INT NOT NULL,
                           FOREIGN KEY(book_id) REFERENCES books(id),
                           FOREIGN KEY(genre_id) REFERENCES genres(id)

);

CREATE TABLE book_loan(
                          book_id INT NOT NULL,
                          loan_id INT NOT NULL,
                          FOREIGN KEY(book_id) REFERENCES books(id),
                          FOREIGN KEY(loan_id) REFERENCES loan(id)

);