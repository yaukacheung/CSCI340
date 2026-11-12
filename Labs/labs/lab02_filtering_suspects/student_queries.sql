-- =====================================================================
-- CSCI 340: Database Systems & Forensics
-- Lab 02: Filtering Suspects & Masked Entities
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
-- Task 2.1: High-Clearance Operatives in Zurich
-- Objective: Query the employees table for all active employees stationed at the Zurich Headquarters (office_id = 1) who hold either 'SECRET' or 'TOP_SECRET' clearance and earn a salary exceeding $250,000.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 2.1 BELOW:



-- ---------------------------------------------------------------------
-- Task 2.2: Hunting the Ghost Employee
-- Objective: Identify all employees stationed in tax haven offices (offices in Cayman Islands, Panama, or BVI: office_id IN (6, 7, 15)) who have a salary over $200,000. Examine the record of Kaspar Hauser.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 2.2 BELOW:



-- ---------------------------------------------------------------------
-- Task 2.3: High-Risk Offshore Shell Vendors
-- Objective: Query the vendors table to find all vendors whose registration_country is 'Cayman Islands', 'Panama', 'British Virgin Islands', or 'Seychelles', or whose risk_rating is 'CRITICAL'.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 2.3 BELOW:



-- ---------------------------------------------------------------------
-- Task 2.4: Pattern Matching on Suspicious Entity Names
-- Objective: Use pattern matching (LIKE) to find vendors whose names contain keywords associated with shell corporations: '%Horizon%', '%Cypher%', '%Aegis%', or '%Strategic%'.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 2.4 BELOW:



-- ---------------------------------------------------------------------
-- Task 2.5: Flagged & High-Value Offshore Transfers
-- Objective: Filter financial_transactions for records where txn_type is 'OFFSHORE_REMITTANCE' OR flagged_by_system = 1, and the amount is strictly greater than $100,000. Order by amount descending.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 2.5 BELOW:



