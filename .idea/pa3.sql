/*-------SELECTS--------*/
    
/*.1. виводить інформацію про автора у якого найдешевша книга(non corelated, =)*/
SELECT author.name AS author_name, biography
FROM author
JOIN book_author ON author.id = book_author.author_id
JOIN books ON book_author.book_id = books.id
WHERE books.price = (
    SELECT MIN(price)
    FROM books
);


/*.2.вибирає книги в яких однакова ціна зустічається більше ніж один раз (non corelated,IN)*/
SELECT b.title AS book_title, b.price AS book_price
FROM books b
WHERE b.price IN (
    SELECT  price
    FROM books
    GROUP BY price
    HAVING COUNT(*) > 1
);

/*.3.вибирає авторів чиї книги ніколи не брали користувачі (non corelated, NOT IN)*/
SELECT author.name AS author_name
FROM author
JOIN book_author ON author.id = book_author.author_id
WHERE book_author.book_id NOT IN (
    SELECT book_loan.book_id
    FROM book_loan
);


/*.4.вибирає книги які є в наявності(non corelated, NOT IN)*/
SELECT b.title
FROM books b
WHERE b.id NOT IN (
    SELECT bl.book_id 
    FROM book_loan bl
    WHERE bl.loan_id IN (
        SELECT l.id 
        FROM loan l 
        WHERE return_date IS NULL));


/*.5.вибирає авторів в яких існують книги в жанрі горор(non corelated, EXISTS)*/
SELECT author.name AS author_name
FROM author
JOIN book_author ON author.id = book_author.author_id
JOIN books ON book_author.book_id = books.id
WHERE EXISTS (
    SELECT 1
    FROM book_genre
    JOIN genres ON book_genre.genre_id = genres.id
    WHERE book_genre.book_id = books.id AND genres.genre = 'Horror'
);

/*.6.книги які не були взяті в позику(corelated, NOT EXISTS)*/
SELECT title
FROM books b
WHERE NOT EXISTS (
    SELECT 1
    FROM loan l
    JOIN book_loan bl ON l.id = bl.loan_id
    WHERE bl.book_id = b.id
);

/*.7.вибирає авторів чиї книги написані не в жанрі drama (corelated, NOT IN)*/
SELECT a.name AS author_name
FROM author a
         JOIN book_author ba ON a.id = ba.author_id
WHERE NOT EXISTS (
          SELECT 1
          FROM books b
                   JOIN book_genre bg ON b.id = bg.book_id
                   JOIN genres g ON bg.genre_id = g.id
          WHERE b.id = ba.book_id AND g.genre = 'Drama'
);
/*.8.вибирає інформацію про книги у яких заданий автор (corelated, =)*/ 
SELECT title, publication_year, price
FROM books b
JOIN book_author ba ON b.id = ba.book_id
JOIN author a ON ba.author_id = a.id
WHERE ba.author_id = (
    SELECT ba1.author_id
    FROM book_author ba1
    WHERE ba1.book_id = b.id AND a.name = 'Natalia Shcherba'
);
/*.9.вибирає книги які брали більше 1 разу(corelated, IN)*/
SELECT b.title
FROM books b
WHERE (
    SELECT COUNT(*)
    FROM book_loan bl
    WHERE bl.book_id = b.id
) > 1;

/*.10.вибирає книги які позичали з жанром триллер(corelated, EXIST)*/
SELECT b.title, b.publication_year, b.price
FROM books b
WHERE EXISTS (
    SELECT 1
    FROM book_loan bl
    JOIN books ON bl.book_id = b.id
    JOIN book_genre bg ON bg.book_id = b.id
    JOIN genres g ON bg.genre_id = g.id
    WHERE b.id = bl.book_id AND g.genre = 'Thriller'
);




