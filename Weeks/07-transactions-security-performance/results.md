# Practical Results – Group 2

## Initial Inventory

| Product | Quantity |
|---|---:|
| Laptop | 20 |
| Phone | 30 |
| Headphones | 50 |

## Scenario 1 – COMMIT

- Updated Laptop quantity from 20 to 40.
- Executed COMMIT.
- Result: Laptop quantity permanently became 40.

## Scenario 2 – ROLLBACK

- Updated Phone quantity from 30 to 10.
- Executed ROLLBACK.
- Result: Phone quantity returned to 30.

## Scenario 3 – SAVEPOINT

- Updated Laptop quantity from 40 to 50.
- Created a savepoint.
- Updated Headphones quantity from 50 to 100.
- Rolled back to the savepoint.
- Executed COMMIT.

Result:
- Laptop: 50
- Phone: 30
- Headphones: 50

## Scenario 4 – SQL Error (Additional Test)

- Started a transaction.
- Updated Laptop quantity to 60.
- Executed a query on a nonexistent table.
- PostgreSQL returned an error.
- The transaction entered an aborted state.
- Executed ROLLBACK.

Result: Laptop quantity remained 50.

## Observations

- COMMIT saves changes.
- ROLLBACK cancels uncommitted changes.
- SAVEPOINT allows partial rollback.
- PostgreSQL prevents normal operations from
  continuing in an aborted transaction.
