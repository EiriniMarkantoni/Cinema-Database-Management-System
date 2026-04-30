# Cinema Database Management System

This project is a relational database system designed to manage the operations of a cinema.

It includes database design, implementation in SQL, sample data insertion, and analytical queries to extract useful insights from the system.

---

## Project Description

The system models a real-world cinema environment, including:

- Movies
- Cinema halls
- Tickets
- Employees (cashiers, cleaners, security, ushers)
- Payments (cash & card)
- Distribution companies
- Movie tributes/events

The project demonstrates how to transform an **Entity-Relationship (ER) model** into a **relational database schema**, and how to use SQL to manage and analyze data.



## Technologies Used

- SQL
- MySQL / MariaDB
- Relational Database Design



##  Database Structure

The database includes multiple interconnected tables such as:

- `tainies` (movies)
- `aithouses` (cinema halls)
- `eisithria` (tickets)
- `upallhlos` (employees)
- `tamies` (cashiers)
- `plhrwmh` (payments)
- `etairia_dianomhs` (distribution companies)

Relationships are enforced using **Primary Keys** and **Foreign Keys**.



##  ER Diagram

![ER Diagram](er-diagram.png)



##  How to Run

1. Create a new database:
```sql
CREATE DATABASE cinema_db;
USE cinema_db;
```
2. Run the schema file:
```sql
SOURCE schema.sql;
```
3. Insert sample data:
```sql
SOURCE data.sql;
```
4. Run example queries:
```sql
SOURCE queries.sql;
```

## Example Queries

This project includes SQL queries such as:

- Total tickets sold per movie
- Tickets sold per cinema hall
- Movies projected in each hall
- Payments handled by each cashier
- Employees working in each hall
- Payment method statistics

## What I Learned

Through this project, I gained experience in:

- Designing ER diagrams
- Mapping ER models to relational schemas
- Creating SQL tables with constraints
- Using primary and foreign keys
- Writing SQL queries with JOIN, GROUP BY, and UNION
- Modeling real-world systems using databases

## Future Improvements
- Add a backend application (Python / Node.js)
- Create a simple web interface
- Build a dashboard for data visualization
- Optimize queries and indexing

## Author
Eirini Markantoni




