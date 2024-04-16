CREATE INDEX idx_author_name ON author (name);
CREATE INDEX idx_book_title ON books (title);
CREATE INDEX idx_publisher_name ON publisher (name);
CREATE INDEX idx_publication_year ON books (publication_year);
CREATE INDEX idx_loan_date ON loan (loan_date);
CREATE INDEX idx_due_date ON loan (due_date);

