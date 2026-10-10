# Assessment structure and database provenance

## Assessment 1 — Database queries

Four SQL queries retrieve shopper details, order history, seller-product aggregates and product/category average comparisons. Query 02 requires the named parameter `shopper_id`.

The aggregate CSV files in `results/` were regenerated from the repository database on 10 October 2026. This database contains 59 orders and 78 ordered-product records. It reproduces the report benchmarks checked: shopper 10000 (6 orders, 10 lines), shopper 10019 (4 orders, 5 lines), seller 200000/product 3000000 (£1,233.98), and Audio and Hifi (12 non-cancelled lines, 58 units, mean 4.83).

Query 01 calculates age using the current date, so its age values can differ from historical assessment screenshots.

## Assessment 2 — Database design, implementation and development

Part 1 extends the model with product and seller reviews. The extracted DDL is provided in `queries/05_review_tables.sql`. Review tables are absent from the repository database and were validated separately during portfolio preparation.

Part 2 implements the Python shopping application against the supplied existing tables. The brief requires persistent baskets and checkout changes in a single transaction. These operations modify database records.

A separately supplied working copy contains 62 orders, 82 ordered-product records and additional baskets. Its schema and master data match the repository database. The additions are consistent with application testing, although their exact origin has not been established.

## Reproduction and interpretation

Use a copy of the repository database for application testing. The CSV files represent its fixed state before further application operations. `results/verification.json` records its SHA-256 fingerprint and counts.

Seller-product ordered values include cancelled orders and should not be interpreted as collected revenue. The category comparison excludes cancelled order lines and measures average quantity per line.

The original assessment documents and supplied database copies are preserved separately. Dataset redistribution permission has not been established; no additional database is included in this update.
