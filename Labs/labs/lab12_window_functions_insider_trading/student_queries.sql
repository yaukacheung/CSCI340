-- =====================================================================
-- CSCI 340: Database Systems & Forensics
-- Lab 12: Financial Trajectory & Window Functions
-- Case File: Operation Rogue Horizon
-- Student Name: [ENTER YOUR NAME]
-- Date: [ENTER DATE]
-- =====================================================================

/*
FORENSIC INVESTIGATOR FINDINGS & SUMMARY:
[Write a brief 2-3 sentence summary of what your queries discovered below]
*/

.mode column
.headers on

-- ---------------------------------------------------------------------
-- Task 12.1: Ranking Insider Stock Dumps (RANK & DENSE_RANK)
-- Objective: Using the stock_trades table, rank all 'SELL' trades across the company by total_trade_val descending using both RANK() and DENSE_RANK() OVER (ORDER BY total_trade_val DESC). Display the top 10 largest dumps.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 12.1 BELOW:



-- ---------------------------------------------------------------------
-- Task 12.2: Partitioned Trading Sequence (ROW_NUMBER)
-- Objective: Assign a sequential transaction number to each trade partitioned by employee_id and ordered by trade_timestamp: ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY trade_timestamp).
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 12.2 BELOW:



-- ---------------------------------------------------------------------
-- Task 12.3: Price Drift Detection (LAG)
-- Objective: Use LAG(price_per_share, 1) OVER (PARTITION BY employee_id ORDER BY trade_timestamp) to calculate the difference between the price at which an employee sold stock versus their prior sale price.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 12.3 BELOW:



-- ---------------------------------------------------------------------
-- Task 12.4: Cumulative Liquidation Volume (Running Sum)
-- Objective: Compute the cumulative running total of stock liquidated by each executive throughout November 2023: SUM(total_trade_val) OVER (PARTITION BY employee_id ORDER BY trade_timestamp).
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 12.4 BELOW:



-- ---------------------------------------------------------------------
-- Task 12.5: Forensic Finding: The Pre-Murder Dump (Nov 10-12, 2023)
-- Objective: Filter stock dumps between 2023-11-09 and 2023-11-13. Identify the three executives who liquidated over $50,000,000 in equity 72 hours before Dr. Rostova's death.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 12.5 BELOW:



