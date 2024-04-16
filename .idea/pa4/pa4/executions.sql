CALL get_client_loans(1);
--
CALL update_due_date(@rows_updated);
SELECT @rows_updated;
--
CALL delete_books( 26);

--
SET @total_price = 10.0;
CALL add_books_prices_by_author('Kerstin Gier', @total_price);
SELECT @total_price;