-- =====================================================================
-- CSCI 340: Database Systems & Forensics
-- Lab 03: Forensic Accounting & Aggregate Anomalies
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
-- Task 3.1: Global Transaction Baseline Metrics
-- Objective: Calculate the total number of financial transactions, the sum of all transaction amounts, the average transaction amount, the minimum amount, and the maximum amount across the entire enterprise.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 3.1 BELOW:



-- ---------------------------------------------------------------------
-- Task 3.2: Transaction Breakdown by Transfer Type
-- Objective: Group all transactions by txn_type. For each type, display the transaction type, count of transactions, total volume in USD, and average transfer size. Order by total volume descending.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 3.2 BELOW:



-- ---------------------------------------------------------------------
-- Task 3.3: Smurfing / Structuring Detection ($9,000 - $9,999)
-- Objective: Detect smurfing: Find all destination accounts (account_to) that have received 3 or more transactions with amounts between $9,000.00 and $9,999.99. Display account_to, the count of structured transfers, and the total structured amount.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 3.3 BELOW:



-- ---------------------------------------------------------------------
-- Task 3.4: Procurement Order Patterns by Risk Rating
-- Objective: Group procurement orders by the vendor's risk rating. Calculate the total order count and total spend. (Note: Join or aggregate on procurement orders total_amount).
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 3.4 BELOW:



-- ---------------------------------------------------------------------
-- Task 3.5: Forensic Finding: Identifying the Smurfed Recipient
-- Objective: Identify the primary recipient account receiving repeated $9,800 - $9,995 transfers and match it to a vendor bank account in the vendors table.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 3.5 BELOW:



