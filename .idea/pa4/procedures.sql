use myTask;
/*shows information about the book and dates in loans taken by a specific customer*/
DELIMITER //
CREATE PROCEDURE get_client_loans(IN clientID INT)
BEGIN
    START TRANSACTION;
    SELECT
        books.title AS Book_Title,
        loan.loan_date AS Loan_Date,
        loan.due_date AS Due_Date
    FROM books
        INNER JOIN book_loan ON books.id = book_loan.book_id
        INNER JOIN loan ON book_loan.loan_id = loan.id
    WHERE loan.client_id = clientID;
    COMMIT;
END//
/*changes the return date in loans taken by clients from Kyiv and has an output of the number of changed lines*/
CREATE PROCEDURE update_due_date(OUT rows_updated INT)
BEGIN
    DECLARE rows_affected INT;
    START TRANSACTION;
    UPDATE loan l
    SET l.due_date = '2024-05-08'
    WHERE l.client_id IN (
        SELECT c.id
        FROM clients c
        WHERE c.address LIKE '%Kyiv%'
    );
    SET rows_affected = ROW_COUNT();
    SELECT rows_affected INTO rows_updated;
    COMMIT;
END//

/*increases the price by the specified percentage and displays the new sum of all prices*/
CREATE PROCEDURE increase_book_price(IN percent_increase int, INOUT total_price DECIMAL(10, 2))
BEGIN
    DECLARE total_updated_price DECIMAL(10, 2);
    START TRANSACTION;
    UPDATE books
    SET price = price * (1 + percent_increase / 100);
    SELECT SUM(price) INTO total_updated_price FROM books;
    SET total_price = total_updated_price;
    COMMIT;
END//

/**/
CREATE PROCEDURE delete_books(IN author_id INT)
BEGIN
    DECLARE books_not_returned INT DEFAULT 0;
    START TRANSACTION;
    SELECT COUNT(*)
    INTO books_not_returned
    FROM loan l
        JOIN book_loan bl ON l.id = bl.loan_id
        JOIN books b ON bl.book_id = b.id
        JOIN book_author ba ON b.id = ba.book_id
    WHERE ba.author_id = author_id AND l.return_date IS NULL;
    IF books_not_returned > 0 THEN
        ROLLBACK;
        SELECT 'Deletion of author books canceled due to presence of unretrieved books.';
    ELSE
        DELETE FROM book_author WHERE book_id IN (SELECT id FROM books WHERE author_id = author_id);
        DELETE FROM book_genre WHERE book_id IN (SELECT id FROM books WHERE author_id = author_id);
        DELETE FROM book_loan WHERE book_id IN (SELECT id FROM books WHERE author_id = author_id);
        DELETE FROM books WHERE author_id = author_id;
        COMMIT;
        SELECT 'Author books successfully deleted.';
    END IF;
END//

