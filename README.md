# MySQL Analyst Practice | Retail Dataset

This first release contains SQL practice questions 1–50: foundations, joins, subqueries, CTEs and window functions. Later advanced case questions can be added in a future update after review.

## Skills and practices

- Filtering, grouping, aggregates and `CASE`
- Multi-table joins and grain awareness
- Subqueries, CTEs and window functions
- Defining metrics and denominators; avoiding duplicate counts; checking results
- Reproducible setup with a MySQL schema and CSV imports

## Dataset

The data is synthetic. Customer email values use the reserved `example.com` domain.

| Table | Rows |
|---|---:|
| customers | 30,000 |
| products | 800 |
| stores | 40 |
| employees | 220 |
| orders | 100,000 |
| order_items | 218,651 |
| payments | 96,934 |
| returns | 5,878 |

The source question sheet said “300,000+ order lines.” The supplied `order_items.csv` contains 218,651 data rows, excluding its header.

## Files

- `data/` — CSV inputs
- `sql/01_schema.sql` — creates/resets the practice database and tables
- `sql/02_load_data.sql` — loads CSVs with `LOAD DATA LOCAL INFILE`
- `questions/practice_questions.txt` — questions 1–50 only
- `solutions/01_foundations_and_join.sql` — supplied query answers for questions 1–8 and 11
- `solutions/02_joins.sql` — corrected per-store return-rate solution for question 20 from the practice-session history
- `docs/solution_status.md` — answer coverage and validation limits

## Run locally

Requirements: MySQL 8.0 or later. Enable `LOCAL INFILE` in your client and server. Run `sql/01_schema.sql` first, then from the `data/` directory run `sql/02_load_data.sql` (or adjust paths to your CSV files). The schema script drops and recreates its tables, so use it only for this practice database.

For each query, state the output grain, identify join keys and filters, calculate at the right level, and check row counts or totals for duplication.

## Business calculation notes

- Line gross = `quantity * unit_price`
- Discount = `quantity * unit_price * discount_pct / 100`
- Line net revenue = gross less discount
- Approximate margin = line net revenue less `quantity * products.unit_cost`
- Unless a question says otherwise, revenue questions use completed orders.
- Count distinct orders or customers when joining to line-level data.

## Scope and validation

This release stops at question 50. The supplied SQL files contain complete answers for questions 1–8, 11 and 20. They do not include the separate answer key mentioned in the source folder README or complete answers for every question through 50. Missing answers are left as practice work. The supplied queries have not been executed against MySQL as part of preparing this release; see `docs/solution_status.md`.



