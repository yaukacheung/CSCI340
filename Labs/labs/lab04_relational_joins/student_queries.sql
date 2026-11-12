-- =====================================================================
-- CSCI 340: Database Systems & Forensics
-- Lab 04: Multi-Table Link Analysis & Relational Joins
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
-- Task 4.1: Procurement Orders Linked to Vendors
-- Objective: Perform an INNER JOIN between procurement_orders and vendors. Display po_id, order_date, total_amount, vendor_name, registration_country, and is_approved. Filter for orders over $50,000.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 4.1 BELOW:



-- ---------------------------------------------------------------------
-- Task 4.2: Tracing Requesters of Unapproved Vendor Contracts
-- Objective: Join procurement_orders, vendors, and employees (as the requester). Find all orders placed with unapproved vendors (is_approved = 0). Display po_id, vendor_name, total_amount, requester full name, role, and department.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 4.2 BELOW:



-- ---------------------------------------------------------------------
-- Task 4.3: The Sign-Off: Linking Approving Executives
-- Objective: Execute a 4-table join connecting procurement_orders, vendors, employees (as requester), and employees (as approver). Isolate orders placed to 'Apex Global Horizon Ltd' and 'CypherTech Holdings BVI'. Who requested them, and who approved them?
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 4.3 BELOW:



-- ---------------------------------------------------------------------
-- Task 4.4: Audit Inactive Personnel via LEFT JOIN
-- Objective: Perform a LEFT JOIN between employees and procurement_orders to identify all employees in the Global Procurement department (dept_id = 7) who have NEVER requested a procurement order.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 4.4 BELOW:



-- ---------------------------------------------------------------------
-- Task 4.5: Total Spend Analysis by Approver
-- Objective: Aggregate total procurement dollars approved by each executive approver. Display approver_id, approver full name, count of approved orders, and total sum. Order by total sum approved descending.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 4.5 BELOW:



