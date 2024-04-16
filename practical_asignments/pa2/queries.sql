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