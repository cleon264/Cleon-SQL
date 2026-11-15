-- =====================================================
-- GROUP 2: POSTGRESQL TRANSACTIONS
-- Members: Cleon and Jashant
-- Topic: BEGIN, COMMIT, ROLLBACK and SAVEPOINT
-- =====================================================


-- =====================================================
-- STEP 1: CREATE DEMONSTRATION TABLE
-- =====================================================

-- WARNING: Only use this with our demonstration table.
DROP TABLE IF EXISTS demo_inventory;

CREATE TABLE demo_inventory (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity >= 0)
);

-- Insert sample data
INSERT INTO demo_inventory (product_name, quantity)
VALUES
    ('Laptop', 20),
    ('Phone', 30),
    ('Headphones', 50);

-- Show initial inventory
SELECT * FROM demo_inventory
ORDER BY product_id;


-- =====================================================
-- SCENARIO 1: BEGIN AND COMMIT
-- =====================================================

-- Show data before transaction
SELECT * FROM demo_inventory
ORDER BY product_id;

-- Start transaction
BEGIN;

-- Change laptop quantity from 20 to 40
UPDATE demo_inventory
SET quantity = 40
WHERE product_name = 'Laptop';

-- Show updated data before COMMIT
SELECT * FROM demo_inventory
ORDER BY product_id;

-- Save changes permanently
COMMIT;

-- Show data after COMMIT
SELECT * FROM demo_inventory
ORDER BY product_id;


-- =====================================================
-- SCENARIO 2: BEGIN AND ROLLBACK
-- =====================================================

-- Show data before transaction
SELECT * FROM demo_inventory
ORDER BY product_id;

-- Start new transaction
BEGIN;

-- Change phone quantity from 30 to 10
UPDATE demo_inventory
SET quantity = 10
WHERE product_name = 'Phone';

-- Show temporary changes
SELECT * FROM demo_inventory
ORDER BY product_id;

-- Undo the transaction
ROLLBACK;

-- Show data after ROLLBACK
SELECT * FROM demo_inventory
ORDER BY product_id;


-- =====================================================
-- SCENARIO 3: SAVEPOINT
-- =====================================================

-- Show data before transaction
SELECT * FROM demo_inventory
ORDER BY product_id;

-- Start transaction
BEGIN;

-- First update: Laptop from 40 to 50
UPDATE demo_inventory
SET quantity = 50
WHERE product_name = 'Laptop';

-- Create a savepoint
SAVEPOINT inventory_checkpoint;

-- Second update: Headphones from 50 to 100
UPDATE demo_inventory
SET quantity = 100
WHERE product_name = 'Headphones';

-- Show both changes
SELECT * FROM demo_inventory
ORDER BY product_id;

-- Undo changes after the savepoint
ROLLBACK TO SAVEPOINT inventory_checkpoint;

-- Show data after partial rollback
SELECT * FROM demo_inventory
ORDER BY product_id;

-- Save the remaining laptop update
COMMIT;

-- Show final inventory
SELECT * FROM demo_inventory
ORDER BY product_id;


-- =====================================================
-- FINAL RESULT
-- =====================================================

SELECT * FROM demo_inventory
ORDER BY product_id;
