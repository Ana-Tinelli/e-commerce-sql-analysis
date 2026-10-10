# E-commerce SQL Analysis and Database Integrity

An academic project combining SQL analysis, relational database design and a Python command-line application for an e-commerce scenario.

## Project objectives

- Analyse shopper orders and seller-product activity.
- Compare average quantities ordered with category benchmarks.
- Extend the database to support product and seller reviews.
- Apply constraints to protect data quality.
- Implement shopping-basket and checkout operations using Python and SQLite.

## Tools and techniques

- SQL and SQLite.
- Python with the sqlite3 module.
- Relational modelling and entity-relationship diagrams.
- Joins, aggregation, subqueries and filtering.
- Primary keys, foreign keys, UNIQUE and CHECK constraints.
- Parameterised queries and transaction handling.

## SQL analysis

Four assessment queries explore shopper and order information, seller-product summaries and comparisons with category averages.

Interpretation matters:

- Ordered item value is not equivalent to revenue received.
- The seller-product value summary includes cancelled orders.
- The category comparison excludes cancelled orders and measures average quantity per order line.
- These results describe the supplied assessment dataset; they do not establish customer demand or business performance.

## Database integrity

The proposed database extension defines product and seller reviews with validation rules for:

- Relationships with existing shoppers, products and sellers.
- Integer ratings between 1 and 5.
- Review text length and empty content.
- Valid calendar dates and timestamps.
- Duplicate submissions under the defined uniqueness rule.

## Python application

The command-line application supports shopper, order and basket operations.

The implementation uses parameterised SQL and transactions to keep checkout changes consistent. A successful checkout creates the order and clears the basket; a failed transaction should preserve the basket.

## Validation

Portfolio preparation checks included:

- Executing all four analysis queries against the supplied database.
- Testing the extracted review-table definitions in an isolated database copy.
- Confirming rejection of 18 invalid review cases.
- Checking acceptance of a valid leap-day date.
- Checking successful checkout and rollback after a forced failure.

These checks cover selected database and transaction behaviours, rather than a complete end-to-end test of every menu option.

## My contribution

I developed the SQL queries, review-table design and Python application as part of my university database assessments.

For this portfolio, the two assessments are presented together to show how analytical queries, data integrity and application logic relate to each other.

## Assessment structure

### Assessment 1 — SQL analysis

Four queries cover shopper selection, order history, seller-product summaries and product/category comparisons.

The aggregate CSV results were generated from the database included in this repository, containing 59 orders and 78 ordered-product records.

### Assessment 2 — Database integrity and Python application

The review-table definitions are provided separately in `queries/05_review_tables.sql`. They were validated in an isolated database copy and are not present in the included application database.

The Python application implements persistent shopping baskets and checkout operations using the existing database tables.

## Repository contents

- `queries/`: four analysis queries and the review-table definitions.
- `results/`: two aggregate CSV outputs and a database verification record.
- `docs/ASSESSMENT_STRUCTURE.md`: assessment scope, database provenance and interpretation notes.
- `20054375_parana_python.py`: original Python application.
- `20054375_parana_python_working.db`: application database and reference for the published aggregate results.

The original application commit history is retained.

See [assessment structure and database provenance](docs/ASSESSMENT_STRUCTURE.md) for further details.
## Running the Python application

Python 3 is required. The application uses the built-in sqlite3 module; no additional packages are needed.

1. Download or clone this repository.
2. Open a terminal in the repository folder.
3. Keep these files together:
   - `20054375_parana_python.py`
   - `20054375_parana_python_working.db`
4. Run:

```bash
python 20054375_parana_python.py
```

On Windows, you can also use:

```powershell
py 20054375_parana_python.py
```

Use a copy of the database for testing, because basket and checkout operations modify its contents.

The database filename matches the application configuration. The repository database passed SQLite integrity and foreign-key checks and was used to generate the published aggregate CSV results.

## Limitations

- The project uses an academic e-commerce scenario.
- Validation used the available base database, with review tables created separately for testing.
- The aggregate CSV outputs represent the included database before further application operations; basket and checkout activity can change subsequent query results.
- Query 01 calculates ages using the current date, so these can differ from historical assessment screenshots.
- Publication of the complete assessment dataset remains subject to a redistribution review.

## AI assistance

AI tools supported explanation, troubleshooting and portfolio documentation. The project is presented with its validation scope and limitations stated explicitly.

## Author

Ana Tinelli

- [GitHub](https://github.com/Ana-Tinelli)
- [LinkedIn](https://www.linkedin.com/in/ana-paula-tinelli-a90706131/)
