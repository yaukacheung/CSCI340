-- =====================================================================
-- CSCI 340: Database Systems & Forensics
-- Lab 06: Deep Surveillance & Subquery Forensics
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
-- Task 6.1: Salaries Exceeding Departmental Averages (Scalar Subquery)
-- Objective: Write a query to find all employees whose salary exceeds the overall corporate average salary. Then, modify it using a correlated subquery to find employees who earn more than the average salary of their specific department.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 6.1 BELOW:



-- ---------------------------------------------------------------------
-- Task 6.2: Vendors Winning Orders Above Average (Multi-Row Subquery)
-- Objective: Use a subquery with IN to find all vendors that have supplied procurement orders whose total_amount is strictly greater than the average procurement order amount across all orders.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 6.2 BELOW:



-- ---------------------------------------------------------------------
-- Task 6.3: Shipments Carrying High-Value Contraband (EXISTS)
-- Objective: Use a correlated subquery with EXISTS to find all shipments that contain at least one manifest item with declared_value > $10,000,000. Display shipment_id, tracking_number, origin_port, destination_port, and responsible_officer_id.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 6.3 BELOW:



-- ---------------------------------------------------------------------
-- Task 6.4: Unmanifested Cargo Containers (NOT EXISTS)
-- Objective: Use NOT EXISTS to identify any shipments currently marked as 'IN_TRANSIT' or 'CUSTOMS_HOLD' that have zero corresponding records in the shipment_manifest table.
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 6.4 BELOW:



-- ---------------------------------------------------------------------
-- Task 6.5: Forensic Finding: Container CT-9042
-- Objective: Inspect shipment #7001 (tracking number 'TRK-AEGIS-9042'). Query its manifest records and compute the difference between actual_weight_kg and declared_weight_kg. What is concealed inside?
-- ---------------------------------------------------------------------
-- WRITE YOUR QUERY FOR TASK 6.5 BELOW:



