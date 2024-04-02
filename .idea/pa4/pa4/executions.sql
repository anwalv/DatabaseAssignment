CALL get_client_loans(1);
--
CALL update_due_date(@rows_updated);
SELECT @rows_updated;
--
CALL increase_book_price(15, @total_price);
SELECT @total_price;
--
CALL delete_books(1)