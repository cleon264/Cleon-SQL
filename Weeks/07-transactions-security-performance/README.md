# Group 2 – PostgreSQL Transactions

## Topic
BEGIN, COMMIT, ROLLBACK and SAVEPOINT

## Group Members
- Cleon Sequeira
- Jashant

## 1. Research Questions

### What does BEGIN do?
BEGIN starts a new database transaction.

### What is the difference between COMMIT and ROLLBACK?
COMMIT permanently saves transaction changes.
ROLLBACK cancels uncommitted changes.

### What is a SAVEPOINT?
SAVEPOINT creates a checkpoint inside a transaction.
It allows partial rollback.

### What happens when an SQL statement fails?
PostgreSQL marks the transaction as aborted.
The transaction must be rolled back or recovered
using an earlier savepoint.

## 2. Practical Demonstrations

1. BEGIN and COMMIT
2. BEGIN and ROLLBACK
3. SAVEPOINT and partial ROLLBACK

## 3. Conclusion

Transactions help maintain database consistency
by allowing users to save, cancel or partially
undo database operations.

