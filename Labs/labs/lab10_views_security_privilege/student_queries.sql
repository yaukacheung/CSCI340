-- =====================================================================
-- CSCI 340: Database Systems & Forensics
-- Lab 10: Virtual Evidence Lockers: Views & Security Access Control
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
-- Task 10.1: Grand Jury Procurement Audit View
-- Objective: Create a view named v_grand_jury_procurement joining procurement_orders, vendors, and employees. Mask the vendor bank_account_no so only the last 4 digits are visible ('****' || SUBSTR(bank_account_no, -4)). Include order details and approver name.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 10.1 BELOW:



-- ---------------------------------------------------------------------
-- Task 10.2: Offshore Capital Flight Monitoring View
-- Objective: Create a view named v_offshore_capital_flight that selects all financial_transactions routed to accounts starting with 'KY-', 'PA-', 'VG-', or 'SC-'. Include transaction amount, currency, timestamp, and authorizing executive.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 10.2 BELOW:



-- ---------------------------------------------------------------------
-- Task 10.3: Executive Communications Surveillance View
-- Objective: Create a view named v_executive_surveillance combining phone records with caller employee details, filtering exclusively for calls where caller security_clearance is 'TOP_SECRET' or role contains 'Chief' or 'VP'.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 10.3 BELOW:



-- ---------------------------------------------------------------------
-- Task 10.4: Querying and Validating View Abstraction
-- Objective: Run analytical queries against v_offshore_capital_flight to calculate total funds funneled into each jurisdiction prefix. Verify that underlying sensitive tables are protected.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 10.4 BELOW:



-- ---------------------------------------------------------------------
-- Task 10.5: Auditing Privilege Escalation in Network Logs
-- Objective: Query network_access_logs to find sessions where non-IT employees (employees outside dept_id 6) accessed 'srv-db-audit.zurich.internal' or executed actions containing 'TAMPER' or 'PURGE'.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 10.5 BELOW:



