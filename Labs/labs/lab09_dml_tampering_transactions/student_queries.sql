-- =====================================================================
-- CSCI 340: Database Systems & Forensics
-- Lab 09: Catching Data Tampering & DML Transactions
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
-- Task 9.1: Interrogating the Audit Tamper Log
-- Objective: Query audit_tamper_log to review all operations performed by user 'lbader_dba' and 'dcroft_admin'. Examine what tables, records, and values were altered.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 9.1 BELOW:



-- ---------------------------------------------------------------------
-- Task 9.2: Inspecting Tampered Record in Shipments
-- Objective: Review shipment 7001 in the shipments table. Compare declared_weight_kg against prior_state in the audit log.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 9.2 BELOW:



-- ---------------------------------------------------------------------
-- Task 9.3: Atomic Recovery Transaction with ACID Guarantees
-- Objective: Write an atomic transaction: BEGIN TRANSACTION; 1) Update shipment 7001 declared_weight_kg back to 13850.0 and set status to 'SEIZED'; 2) Insert an audit entry recording the court-ordered correction; 3) COMMIT;
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 9.3 BELOW:



-- ---------------------------------------------------------------------
-- Task 9.4: Transaction Rollback Demonstration
-- Objective: Demonstrate transaction safety: BEGIN TRANSACTION; execute an erroneous UPDATE that accidentally sets all employee salaries to 0; execute ROLLBACK; verify that data is completely restored.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 9.4 BELOW:



-- ---------------------------------------------------------------------
-- Task 9.5: Immediate Suspension of Rogue DBA
-- Objective: Write a transaction to update the status of employee 1012 (Lukas Bader) to 'SUSPENDED' and record the action in the audit log.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 9.5 BELOW:



