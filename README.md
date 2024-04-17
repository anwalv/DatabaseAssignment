# Library Database📖
![tables](https://github.com/anwalv/DatabaseAssignment/blob/main/%D0%97%D0%BD%D1%96%D0%BC%D0%BE%D0%BA%20%D0%B5%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-04-16%20213935.png?raw=true)
## Generic info:

During the Database Fundamentals course, I created a database for a library. As part of the implementation of practical tasks, the database was developed and improved by me. It has main files: schemas.sql - for tables, populate_data.sql - for data population. There are also additional files such as: queries.sql, subqueries.sql etc. which contain database query templates, useful tools for working with the database, such as procedures. 
This database can be useful for the library. It will help to organize data well and will provide an opportunity to quickly and qualitatively obtain data upon request and work with them.


## Project structure:

All practical assignments are contained in the practical_assignments directory for good visualization and convenient search.

**PA1:** The directory *practical_assignments-> pa1* contains the main components of the database - tables and data for tables (in different files, respectively).

**PA2:** In the directory *practical_assignments-> pa2,* the files *populate_data_updates.sql, queries.sql, schema_updates.sql* are added, which contain changes due to the addition of many to many relationships between tables and several queries.

**PA3:** In the directory *practical_assignments-> pa3,* the file *subqueries.sql* is added, which contains 30 subqueries (delete, select, update) and 4 queries for union/union all/intersect/except, which we wrote in order to get a general understanding of queries and subqueries and practice writing them.

**PA4:** In the directory *practical_assignments-> pa4,* *procedures.sql* and *executions.sql* files are added, which contain procedures and their calls, respectively.

**PA5:** In the directory *practical_assignments-> pa5,* the files *views.sql* and *index.sql* are added, which contain views and creating indexes for effective database searches, respectively.

## How to deploy the project:

You must create a *my task* schema. In the file **schema.sql** and **schema_updates.sql** contains the main tables , in the file **populate_data.sql** you can find the data population for the tables. For the convenience of communication with the database in the file **procedures.sql** you can find stored procedures that will help you conveniently select and update the required data, for example:

- Information about the book and dates in loans taken by a specific customer.
- Change the return date in loans taken by clients from Kyiv and has an output of the number of changed lines.
- Adds the prices of books by a certain author to the given one.
- If it has no debts on books, it deletes the books of a certain author.

Also in the file **views.sql** you can find a view, after running which it displays table which have information about rented books.

## About author:

**Anna Oleksandrovych** is a student of *KSE -> ITBA27* who, as part of her studies, took the Database Fundamentals course, and who was lucky enough to get the practical variant closest to her heart - a database for the *library*.
