/*-------SELECTS--------*/
    
/*.1.Select information about the author whose book is the cheapest. (non correlated, =)*/
SELECT a.name AS author_name, biography
FROM author a
INNER JOIN book_author ba ON a.id = ba.author_id
INNER JOIN books ON ba.book_id = books.id
WHERE books.price = (
    SELECT MIN(price)
    FROM books 
);

/*.2.Select books in which the same price occurs more than once. (non correlated,IN)*/
SELECT b.title AS book_title, b.price AS book_price
FROM books b
WHERE b.price IN (
    SELECT  b1.price
    FROM books b1
    GROUP BY price
    HAVING COUNT(*) > 1
);

/*.3.Select authors whose books have never been picked up by users. (non correlated, NOT IN)*/
SELECT a.name AS author_name
FROM author a
INNER JOIN book_author ba ON a.id = ba.author_id
WHERE ba.book_id NOT IN (
    SELECT bl.book_id
    FROM book_loan bl
);

/*.4.Chooses books that are available. (non correlated, NOT IN)*/
SELECT b.title
FROM books b
WHERE b.id NOT IN (
    SELECT bl.book_id 
    FROM book_loan bl
    WHERE bl.loan_id IN (
        SELECT l.id 
        FROM loan l 
        WHERE l.return_date IS NULL));


/*.5.Selects authors who have books in the horror genre. (non correlated, EXISTS)*/
SELECT a.name AS author_name
FROM author a
INNER JOIN book_author ba ON a.id = ba.author_id
INNER JOIN books b ON ba.book_id = b.id
WHERE EXISTS (
    SELECT 1
    FROM book_genre bg
    JOIN genres g ON bg.genre_id = g.id
    WHERE g.genre = 'Horror'
);

/*.6.Books that were not borrowed. (correlated, NOT EXISTS)*/
SELECT title
FROM books b
WHERE NOT EXISTS (
    SELECT 1
    FROM loan l
    INNER JOIN book_loan bl ON l.id = bl.loan_id
);

/*.7.Selects authors whose books are not written in the drama genre. (correlated, NOT IN)*/
SELECT a.name AS author_name
FROM author a
JOIN book_author ba ON a.id = ba.author_id
WHERE NOT EXISTS (
          SELECT 1
          FROM books b
            INNER JOIN book_genre bg ON b.id = bg.book_id
            INNER JOIN genres g ON bg.genre_id = g.id
          WHERE b.id = ba.book_id AND g.genre = 'Drama'
);

/*.8.Selects information about books with a given author. (correlated, =)*/ 
SELECT title, publication_year, price
FROM books b
INNER JOIN book_author ba ON b.id = ba.book_id
INNER JOIN author a ON ba.author_id = a.id
WHERE ba.author_id = (
    SELECT ba1.author_id
    FROM book_author ba1
    WHERE ba1.book_id = b.id AND a.name = 'Natalia Shcherba'
);

/*.9.Chooses books that have been taken more than once. (correlated, IN)*/
SELECT b.title
FROM books b
WHERE (
    SELECT COUNT 1
    FROM book_loan bl
    WHERE bl.book_id = b.id
) > 1;

/*.10.Chooses books borrowed from the thriller genre. (correlated, EXIST)*/
SELECT b.title, b.publication_year, b.price
FROM books b
WHERE EXISTS (
    SELECT 1
    FROM book_loan bl
    INNER JOIN book_genre bg ON bg.book_id = b.id
    INNER JOIN genres g ON bg.genre_id = g.id
    WHERE b.id = bl.book_id AND g.genre = 'Thriller'
);


/*----------UPDATE----------*/

    
/*.1.Increases the price of books by 10%, for books that have not been borrowed. (non-correlated, NOT IN)*/
UPDATE books b
SET b.price = b.price * 1.1
WHERE b.id NOT IN (
    SELECT bl.book_id
    FROM book_loan bl
);

/*.2. A 30% price increase for books that have been borrowed at least once. (correlated, EXISTS)*/
UPDATE books b
SET b.price = b.price * 1.3
WHERE EXISTS (
    SELECT 1
    FROM book_loan bl
    WHERE bl.book_id = b.id
);

/*.3. A reduction in the price of books by a specific author that have not been borrowed. (correlated, NOT EXISTS)*/
UPDATE books b
SET b.price = b.price * 0.9
WHERE NOT EXISTS (
    SELECT 1
    FROM book_author ba
    INNER JOIN book_loan bl ON ba.book_id = bl.book_id
    WHERE ba.author_id = 3 AND b.id = ba.book_id
);

/*.4.The date of return of books is being updated, due to the closure of the library in Zhytomyr. (non-correlated, IN)*/
UPDATE loan l
SET l.due_date = '2024-05-08'
WHERE l.client_id IN (
    SELECT c.id
    FROM clients c
    WHERE c.address LIKE '%Zhytomyr%'
);

/*.5.The price of books published by Vivat increases by 40%. (non- correlated, =)*/
UPDATE books b
SET b.price = b.price * 1.4
WHERE b.publisher_id = (
    SELECT p.id
    FROM publisher p
    WHERE p.name = 'Vivat'
);

/*.6. A note is attached about the contribution to the genre, in the biography of the authors who wrote fantasy. (correlated,IN)*/
UPDATE author a
SET a.biography = CONCAT(a.biography, ' [Note: Contributed to the fantasy genre.]')
WHERE a.id IN (
    SELECT author_id
    FROM book_author ba
    INNER JOIN book_genre bg ON ba.book_id = bg.book_id
    WHERE ba.author_id = a.id
      AND bg.genre_id = (
        SELECT g.id
        FROM genres g
        WHERE g.genre = 'Fantasy'
    )
);

/*.7 Updates the publication year of books that were published by a certain publisher if these books are on loan. (non correlated, exists)*/
UPDATE books b
SET b.publication_year = 2023
WHERE b.publisher_id = 2
  AND EXISTS (
    SELECT 1
    FROM book_author ba
    INNER JOIN author a ON ba.author_id = a.id
    WHERE a.nationality = 'Ukraine'
);

/*.8.Information about inactive users is updated. (correlated, NOT IN)*/
UPDATE clients c
SET c.name = CONCAT(c.name, ' [Inactive User]')
WHERE c.id NOT IN (
    SELECT l.client_id
    FROM loan l
    WHERE l.client_id = c.id
);

/*9. Updates the book return date to the current date for credits that have not yet been returned and that are overdue. (correlated,=)*/
UPDATE loan l
SET return_date = CURRENT_DATE
WHERE l.return_date IS NULL
  AND l.due_date < CURRENT_DATE
  AND l.id = (
    SELECT bl.loan_id
    FROM book_loan AS bl
    INNER JOIN books AS b ON bl.book_id = b.id
    WHERE bl.loan_id = l.id
);

/*.10.Updates the publication year of books to 2016 that were published by a publisher with id 4 and that are not on loan. (non-correlated, NOT EXIST)*/
UPDATE books b 
SET b.publication_year = 2016
WHERE b.publisher_id = 4
  AND NOT EXISTS (
    SELECT 1
    FROM book_author ba
    INNER JOIN author a ON ba.author_id = a.id
    WHERE ba.book_id = b.id
      AND a.nationality = 'America'
);


/*--------DELETE-------*/

  
/*.1.We remove those books with the highest price. (non-correlated, =)*/
DELETE FROM books
WHERE price = (
    SELECT MAX(price)
    FROM books
);

/*.2.We remove books with the horror genre. (non-correlated, IN)*/
DELETE FROM books
WHERE id IN (
    SELECT b.id
    FROM books b
    INNER JOIN book_genre bg ON b.id = bg.book_id
    INNER JOIN genres g ON bg.genre_id = g.id
    WHERE g.genre = 'Horror'
);

/*.3.We remove books that are not thrillers by genre. (non-correlated,NOT IN)*/
DELETE FROM books
WHERE id NOT IN (
    SELECT b.id
    FROM books b
    INNER JOIN book_genre bg ON b.id = bg.book_id
    INNER JOIN genres g ON bg.genre_id = g.id
    WHERE g.genre = 'Thriller'
);

/*.4. We remove books that belong to genres with less than 3 books. (correlated,IN)*/
DELETE FROM books b 
WHERE EXISTS (
    SELECT 1
    FROM book_author ba
    WHERE ba.book_id = b.id
      AND ba.author_id IN (
        SELECT a.id
        FROM author a
        WHERE a.name = 'Donna Tartt'
    )
);

/*.5.We delete books that have more than one author. (correlated, NOT IN)*/
DELETE FROM books b 
WHERE b.id IN (
    SELECT ba.book_id
    FROM book_author ba
    WHERE ba.book_id = b.id
    GROUP BY ba.book_id
    HAVING COUNT 1 > 1
);

/*.6.Removes books that are priced higher than the average price of books in their genre. (correlated NOT EXIST)*/
DELETE FROM books b1
WHERE NOT EXISTS (
    SELECT 1
    FROM books b2
    INNER JOIN book_genre bg1 ON b2.id = bg1.book_id
    INNER JOIN book_genre bg2 ON bg1.genre_id = bg2.genre_id
    WHERE b1.id = b2.id
    GROUP BY bg2.genre_id, b2.price
    HAVING AVG(b2.price) < b1.price
);

/*.7.Deletes records in which books were returned. (correlated,  EXIST)*/
DELETE FROM loan l
WHERE EXISTS (
    SELECT 1
    FROM book_loan bl
    WHERE bl.loan_id = l.id
      AND EXISTS (
        SELECT 1
        FROM loan AS returned_loan
        WHERE returned_loan.id = l.id
        AND returned_loan.return_date IS NOT NULL 
    )
);

/*.8.Deletes books borrowed in Lviv. (non-correlated,  EXIST)*/
DELETE FROM books
WHERE EXISTS (
    SELECT 1
    FROM loan l
    INNER JOIN clients c ON l.client_id = c.id
    WHERE c.address LIKE '%Львів%' 
);

/*.9.Deletes customers who did not buy books from the fantasy genre. (non-correlated,  NOT EXIST)*/
DELETE FROM clients
WHERE NOT EXISTS (
    SELECT 1
    FROM loan l, book_loan bl
    INNER JOIN book_genre bg ON bl.book_id = bg.book_id
    INNER JOIN genres g ON bg.genre_id = g.id
    WHERE l.client_id = clients.id
      AND g.genre = 'Fantasy'
);

/*.10.Deletes an entry from the books if at least one customer with the name "Ivan Petrov" borrowed this book. (correlated, =)*/
DELETE FROM books
WHERE EXISTS (
    SELECT 1
    FROM book_loan bl, loan l
    INNER JOIN clients c ON l.client_id = c.id
    WHERE bl.book_id = books.id
      AND c.name = 'Ivan Petrov'
);


/*-----union-----*/

    
/* Brings books from those two genres, only unique results*/
SELECT b.id, b.title
FROM books b
INNER JOIN book_genre bg ON b.id = bg.book_id
INNER JOIN genres g ON bg.genre_id = g.id
WHERE g.genre = 'Thriller' 

UNION

SELECT b.id, b.title
FROM books b
INNER JOIN book_genre bg ON b.id = bg.book_id
INNER JOIN genres g ON bg.genre_id = g.id
WHERE g.genre = 'Mystery' ;


/*------union all------*/
    
    
/* Authors who are Americans or classics, displays duplicates*/
SELECT a.id, a.name
FROM author a
WHERE a.nationality = 'America'

UNION ALL

SELECT a.id, a.name
FROM author a
INNER JOIN book_author ba ON a.id = ba.author_id
INNER JOIN books b ON ba.book_id = b.id
INNER JOIN book_genre bg ON b.id = bg.book_id
INNER JOIN genres g ON bg.genre_id = g.id
WHERE g.genre = 'Classic';


/*-------INTERSECT------*/
    
    
/*The result will only include those authors who have books published by both 'Vivat' and 'Folio' publishers*/
SELECT a.id, a.name
FROM author a
INNER JOIN book_author ba ON a.id = ba.author_id
INNER JOIN books b ON ba.book_id = b.id
INNER JOIN publisher p ON b.publisher_id = p.id
WHERE p.name = 'Vivat'

INTERSECT

SELECT a.id, a.name
FROM author a
INNER JOIN book_author ba ON a.id = ba.author_id
INNER JOIN books b ON ba.book_id = b.id
INNER JOIN publisher p ON b.publisher_id = p.id
WHERE p.name = 'Folio';


/*--------EXCEPT-------*/
    
    
/*Selects books that are published by a publisher with the name 'Vivat', but excludes books that belong to the genre 'Fantasy'*/
SELECT b.title
FROM books b
INNER JOIN publisher p ON b.publisher_id = p.id
WHERE p.name = 'Vivat'

EXCEPT

SELECT b.title
FROM books b
INNER JOIN book_genre bg ON b.id = bg.book_id
INNER JOIN genres g ON bg.genre_id = g.id
WHERE g.genre = 'Fantasy';
