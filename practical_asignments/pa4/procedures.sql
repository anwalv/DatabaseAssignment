use myTask;
/*shows information about the book and dates in loans taken by a specific customer*/
DELIMITER //
CREATE PROCEDURE get_client_loans(IN clientID INT)
BEGIN
    SELECT
        books.title AS Book_Title,
        loan.loan_date AS Loan_Date,
        loan.due_date AS Due_Date
    FROM books
        INNER JOIN book_loan ON books.id = book_loan.book_id
        INNER JOIN loan ON book_loan.loan_id = loan.id
    WHERE loan.client_id = clientID;
END//
DELIMITER ;
/*changes the return date in loans taken by clients from Kyiv and has an output of the number of changed lines*/
DELIMITER //
CREATE PROCEDURE update_due_date(OUT rows_updated INT)
BEGIN
    DECLARE rows_affected INT;
    UPDATE loan l
    SET l.due_date = '2024-05-08'
    WHERE l.client_id IN (
        SELECT c.id
        FROM clients c
        WHERE c.address LIKE '%Kyiv%'
    );
    SET rows_affected = ROW_COUNT();
    SELECT rows_affected INTO rows_updated;
END//
DELIMITER ;

/*adds the prices of books by a certain author to the given one*/
DELIMITER //

CREATE PROCEDURE add_books_prices_by_author(IN author_name VARCHAR(255), INOUT total_price DECIMAL(10, 2))
BEGIN
    DECLARE book_price DECIMAL(10, 2);

    SELECT SUM(b.price) INTO book_price
    FROM books b
    INNER JOIN book_author ba ON b.id = ba.book_id
    INNER JOIN author a ON a.id = ba.author_id
    WHERE a.name = author_name;
    SET total_price = total_price + book_price;
END//
DELIMITER ;

/*if he has no debts on books, he deletes the books of a certain author*/
DELIMITER //

CREATE PROCEDURE delete_books(IN author_id INT)
BEGIN
    DECLARE books_not_returned INT DEFAULT 0;
    START TRANSACTION;

    DELETE FROM book_author WHERE book_id IN (SELECT book_id FROM book_author WHERE author_id = author_id);
    DELETE FROM book_genre WHERE book_id IN (SELECT book_id FROM book_author WHERE author_id = author_id);
    DELETE FROM book_loan WHERE book_id IN (SELECT book_id FROM book_author WHERE author_id = author_id);
    DELETE FROM books WHERE id IN (SELECT book_id FROM mytask.book_author WHERE author_id = author_id);

    SELECT COUNT(*)
    INTO books_not_returned
    FROM loan l
    INNER JOIN book_loan bl ON l.id = bl.loan_id
    INNER JOIN books b ON bl.book_id = b.id
    INNER JOIN book_author ba ON b.id = ba.book_id
    WHERE ba.author_id = author_id AND l.return_date IS NULL;
    
    IF books_not_returned > 0 THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END//
DELIMITER ;

