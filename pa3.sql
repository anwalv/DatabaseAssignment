/*-------SELECTS--------*/
    
/*.1. виводить інформацію про автора у якого найдешевша книга(non corelated, =)*/
SELECT a.name AS author_name, biography
FROM author a
JOIN book_author ba ON a.id = ba.author_id
JOIN books ON ba.book_id = books.id
WHERE books.price = (
    SELECT MIN(price)
    FROM books 
);


/*.2.вибирає книги в яких однакова ціна зустічається більше ніж один раз (non corelated,IN)*/
SELECT b.title AS book_title, b.price AS book_price
FROM books b
WHERE b.price IN (
    SELECT  b1.price
    FROM books b1
    GROUP BY price
    HAVING COUNT(*) > 1
);

/*.3.вибирає авторів чиї книги ніколи не брали користувачі (non corelated, NOT IN)*/
SELECT a.name AS author_name
FROM author a
JOIN book_author ba ON a.id = ba.author_id
WHERE ba.book_id NOT IN (
    SELECT bl.book_id
    FROM book_loan bl
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
        WHERE l.return_date IS NULL));


/*.5.вибирає авторів в яких існують книги в жанрі горор(non corelated, EXISTS)*/
SELECT a.name AS author_name
FROM author a
JOIN book_author ba ON a.id = ba.author_id
JOIN books b ON ba.book_id = b.id
WHERE EXISTS (
    SELECT 1
    FROM book_genre bg
    JOIN genres g ON bg.genre_id = g.id
    WHERE g.genre = 'Horror'
);

/*.6.книги які не були взяті в позику(corelated, NOT EXISTS)*/
SELECT title
FROM books b
WHERE NOT EXISTS (
    SELECT 1
    FROM loan l
    JOIN book_loan bl ON l.id = bl.loan_id
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
    JOIN book_genre bg ON bg.book_id = b.id
    JOIN genres g ON bg.genre_id = g.id
    WHERE b.id = bl.book_id AND g.genre = 'Thriller'
);




/*----------UPDATE----------*/

    
/*.1.Збільшує ціну книг на 10%, на книги які не брали в борг(non-correlated, NOT IN)*/
UPDATE books b
SET b.price = b.price * 1.1
WHERE b.id NOT IN (
    SELECT bl.book_id
    FROM book_loan bl
);

/*.2. Збільшення ціни на 30% у книг які хоч раз були взяті в борг(correlated, EXISTS)*/
UPDATE books b
SET b.price = b.price * 1.3
WHERE EXISTS (
    SELECT 1
    FROM book_loan bl
    WHERE bl.book_id = b.id
);

/*.3. Зменшення ціни книг конкретного автора які не були взяті в борг(correlated, NOT EXISTS)*/
UPDATE books b
SET b.price = b.price * 0.9
WHERE NOT EXISTS (
    SELECT 1
    FROM book_author ba
    JOIN book_loan bl ON ba.book_id = bl.book_id
    WHERE ba.author_id = 3 AND b.id = ba.book_id
);

/*.4.Оновлюється дата повернення книг, через закриття бібліотеки в Житомирі(non-correlated, IN)*/
UPDATE loan l
SET l.due_date = '2024-05-08'
WHERE l.client_id IN (
    SELECT c.id
    FROM clients c
    WHERE c.address LIKE '%Zhytomyr%'
);
/*.5.Ціна книг які були видані віватом вбільшується на 40% *зажрались* (non- correlated, =)*/
UPDATE books b
SET b.price = b.price * 1.4
WHERE b.publisher_id = (
    SELECT p.id
    FROM publisher p
    WHERE p.name = 'Vivat'
);

/*.6. Додається примітка про внесок в жанр, в біографію авторів як писали фентезі(correlated,IN)*/
UPDATE author a
SET a.biography = CONCAT(a.biography, ' [Note: Contributed to the fantasy genre.]')
WHERE a.id IN (
    SELECT author_id
    FROM book_author ba
    JOIN book_genre bg ON ba.book_id = bg.book_id
    WHERE ba.author_id = a.id
      AND bg.genre_id = (
        SELECT g.id
        FROM genres g
        WHERE g.genre = 'Fantasy'
    )
);
/*.7 оновлює рік публікації книг, які були видані певним видавцем якщо ці книги в позиках(не дуже make sense але фантація закінчилась)(non correlated, exists)*/
UPDATE books b
SET b.publication_year = 2023
WHERE b.publisher_id = 2
  AND EXISTS (
    SELECT 1
    FROM book_author ba
    JOIN author a ON ba.author_id = a.id
    WHERE a.nationality = 'Ukraine'
);

/*.8.Оновлюється інформація про неактивних користувачів(correlated, NOT IN)*/
UPDATE clients c
SET c.name = CONCAT(c.name, ' [Inactive User]')
WHERE c.id NOT IN (
    SELECT l.client_id
    FROM loan l
    WHERE l.client_id = c.id
);

/*9. Оновлює дату повернення книги на поточну дату для кредитів, які ще не повернуті і які прострочені(correlated,=)*/
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

/*.10.оновлює рік публікації книг на 2016, які були видані видавцем з id 4, і яких немає в позиках.(non-correlated, NOT EXIST)*/
UPDATE books b 
SET b.publication_year = 2016
WHERE b.publisher_id = 4
  AND NOT EXISTS (
    SELECT 1
    FROM book_author ba
    JOIN author a ON ba.author_id = a.id
    WHERE ba.book_id = b.id
      AND a.nationality = 'America'
);



/*--------DELETE-------/*

  
/*.1.видаляємо ті книги де найвища ціна(non-correlated, =)*/
DELETE FROM books
WHERE price = (
    SELECT MAX(price)
    FROM books
);
/*.2.Видаляємо книги з жанром горор(non-correlated, IN)*/
DELETE FROM books
WHERE id IN (
    SELECT b.id
    FROM books b
             JOIN book_genre bg ON b.id = bg.book_id
             JOIN genres g ON bg.genre_id = g.id
    WHERE g.genre = 'Horror'
);

/*.3.Видаляємо книги які за жанром не триллер(non-correlated,NOT IN)*/
DELETE FROM books
WHERE id NOT IN (
    SELECT b.id
    FROM books b
             JOIN book_genre bg ON b.id = bg.book_id
             JOIN genres g ON bg.genre_id = g.id
    WHERE g.genre = 'Thriller'
);

/*.4. Видаляємо книги, які належать жанрам з менш ніж 3 книгами(correlated,IN)*/
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

/*.5.Видаляємо книги, які мають більше одного автора(correlated, NOT IN)*/
DELETE FROM books b 
WHERE b.id IN (
    SELECT ba.book_id
    FROM book_author ba
    WHERE ba.book_id = b.id
    GROUP BY ba.book_id
    HAVING COUNT(*) > 1
);

/*.6.Видаляє книги, які мають ціну вищу за середню ціну книг у їхньому жанрі.(correlated NOT EXIST)*/

DELETE FROM books b1
WHERE NOT EXISTS (
    SELECT 1
    FROM books b2
    JOIN book_genre bg1 ON b2.id = bg1.book_id
    JOIN book_genre bg2 ON bg1.genre_id = bg2.genre_id
    WHERE b1.id = b2.id
    GROUP BY bg2.genre_id, b2.price
    HAVING AVG(b2.price) < b1.price
);


/*.7.Видаляє записи,у яких книги були повернені(correlated,  EXIST)*/
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
/*.8.Видаляє книги які були взяті у позику у Льовові(non-correlated,  EXIST)*/
DELETE FROM books
WHERE EXISTS (
    SELECT 1
    FROM loan l
    JOIN clients c ON l.client_id = c.id
    WHERE c.address LIKE '%Львів%' 
);

/*.9.Видаляє клієнтів які не брали книги з жанру фентезі(бо як вони могли, не мають права бути тепер клієнтами)(non-correlated,  NOT EXIST)*/
DELETE FROM clients
WHERE NOT EXISTS (
    SELECT 1
    FROM loan l, book_loan bl
    JOIN book_genre bg ON bl.book_id = bg.book_id
    JOIN genres g ON bg.genre_id = g.id
    WHERE l.client_id = clients.id
      AND g.genre = 'Fantasy'
);



/*.10.Видаляє запис з книг, якщо хоча б один клієнт з іменем "Іван Петров" позичив цю книгу(вкрав напевно)(correlated, =)*/
DELETE FROM books
WHERE EXISTS (
    SELECT 1
    FROM book_loan bl, loan l
    JOIN clients c ON l.client_id = c.id
    WHERE bl.book_id = books.id
      AND c.name = 'Ivan Petrov'
);


/*-----union-----*/

/* Виводить книги з тих двох жанрів лише унікальні результати*/
SELECT b.id, b.title
FROM books b
JOIN book_genre bg ON b.id = bg.book_id
JOIN genres g ON bg.genre_id = g.id
WHERE g.genre = 'Thriller' 

UNION

SELECT b.id, b.title
FROM books b
JOIN book_genre bg ON b.id = bg.book_id
JOIN genres g ON bg.genre_id = g.id
WHERE g.genre = 'Mystery' ;


/*------union all------*/
/* Авторів які є американцями або класиками, виводить дублікати*/

SELECT a.id, a.name
FROM author a
WHERE a.nationality = 'America'

UNION ALL

SELECT a.id, a.name
FROM author a
JOIN book_author ba ON a.id = ba.author_id
JOIN books b ON ba.book_id = b.id
JOIN book_genre bg ON b.id = bg.book_id
JOIN genres g ON bg.genre_id = g.id
WHERE g.genre = 'Classic';



/*-------INTERSECT------*/
/*Результат буде включати тільки тих авторів, які мають книги, опубліковані як видавцями 'Vivat' і 'Folio' одночасно*/

SELECT a.id, a.name
FROM author a
JOIN book_author ba ON a.id = ba.author_id
JOIN books b ON ba.book_id = b.id
JOIN publisher p ON b.publisher_id = p.id
WHERE p.name = 'Vivat'

INTERSECT

SELECT a.id, a.name
FROM author a
JOIN book_author ba ON a.id = ba.author_id
JOIN books b ON ba.book_id = b.id
JOIN publisher p ON b.publisher_id = p.id
WHERE p.name = 'Folio';

/*--------EXCEPT-------*/
/*Вибирає книги, які опубліковані видавцем з назвою 'Vivat', але при цьому виключає ті книги, які належать до жанру 'Fantasy'.*/

SELECT b.title
FROM books b
JOIN publisher p ON b.publisher_id = p.id
WHERE p.name = 'Vivat'

EXCEPT

SELECT b.title
FROM books b
JOIN book_genre bg ON b.id = bg.book_id
JOIN genres g ON bg.genre_id = g.id
WHERE g.genre = 'Fantasy';

/*---*/