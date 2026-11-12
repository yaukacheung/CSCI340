-- =====================================================================
-- CSCI 340: Database Systems & Forensics
-- Lab 07: Ledger Reconciliation & Set Operations
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
-- Task 7.1: Master Ledger of All Active Accounts (UNION)
-- Objective: Use UNION to compile a distinct list of all account identifiers that appear either as a source (account_from) or destination (account_to) in financial_transactions.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 7.1 BELOW:



-- ---------------------------------------------------------------------
-- Task 7.2: Dual-Purpose Accounts: Vendors vs Wire Destinations (INTERSECT)
-- Objective: Use INTERSECT to find account numbers that appear simultaneously in the vendors table (as bank_account_no) AND as destination accounts (account_to) in financial_transactions.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 7.2 BELOW:



-- ---------------------------------------------------------------------
-- Task 7.3: Detecting Ghost Employees via Physical Access (EXCEPT)
-- Objective: Use EXCEPT to find all active employees in the employees table who have ZERO recorded badge swipes in security_badge_logs during the entire year of 2023. Who is receiving a salary without entering any corporate facility?
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 7.3 BELOW:



-- ---------------------------------------------------------------------
-- Task 7.4: Procurement Bypasses: Direct Wires with No PO (EXCEPT)
-- Objective: Use EXCEPT to identify vendors that have received direct financial remittances in financial_transactions but have NO corresponding records in procurement_orders.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 7.4 BELOW:



-- ---------------------------------------------------------------------
-- Task 7.5: Forensic Finding: Ghost Employee Confirmation
-- Objective: Confirm the identity and salary of the ghost employee discovered in Task 7.3, and document who hired/manages them.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 7.5 BELOW:



