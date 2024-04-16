CREATE VIEW rented_books_view AS
SELECT b.title                                  AS title,
       GROUP_CONCAT(a.name SEPARATOR ', ')      AS authors,
       CONCAT(p.name, ', ', b.publication_year) AS publisher_info,
       DATE_FORMAT(l.loan_date, '%b, %d %Y')    AS loan_date,
       DATEDIFF(l.due_date, l.loan_date)        AS days_to_end_term
FROM books AS b
         JOIN book_loan AS bl ON b.id = bl.book_id
         JOIN loan AS l ON bl.loan_id = l.id
         JOIN publisher AS p ON b.publisher_id = p.id
         JOIN book_author AS ba ON b.id = ba.book_id
         JOIN author AS a ON ba.author_id = a.id
GROUP BY b.title, p.name, b.publication_year, l.loan_date, l.due_date;

