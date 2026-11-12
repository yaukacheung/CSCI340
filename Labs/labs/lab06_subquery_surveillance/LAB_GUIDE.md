# Lab 06: Deep Surveillance & Subquery Forensics
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** Scalar Subqueries, Multi-Row Subqueries (IN, ANY, ALL), Correlated Subqueries, EXISTS
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
Sophisticated financial crimes often evade simple join filters because the anomalies exist relative to contextual averages or in the absence of expected relational child records. In this lab, you will master scalar, multi-row, and correlated subqueries to isolate anomalous behavior across procurement, payroll, and maritime shipping manifests.

---

### 📋 Investigative Tasks & Questions

#### Task 6.1: Salaries Exceeding Departmental Averages (Scalar Subquery)
**Objective:** Write a query to find all employees whose salary exceeds the overall corporate average salary. Then, modify it using a correlated subquery to find employees who earn more than the average salary of their specific department.

> **Investigative Tip / Hint:** `WHERE salary > (SELECT AVG(salary) FROM employees WHERE dept_id = e.dept_id)`

#### Task 6.2: Vendors Winning Orders Above Average (Multi-Row Subquery)
**Objective:** Use a subquery with IN to find all vendors that have supplied procurement orders whose total_amount is strictly greater than the average procurement order amount across all orders.

> **Investigative Tip / Hint:** `WHERE vendor_id IN (SELECT vendor_id FROM procurement_orders WHERE total_amount > (SELECT AVG(total_amount) FROM procurement_orders))`

#### Task 6.3: Shipments Carrying High-Value Contraband (EXISTS)
**Objective:** Use a correlated subquery with EXISTS to find all shipments that contain at least one manifest item with declared_value > $10,000,000. Display shipment_id, tracking_number, origin_port, destination_port, and responsible_officer_id.

> **Investigative Tip / Hint:** `WHERE EXISTS (SELECT 1 FROM shipment_manifest sm WHERE sm.shipment_id = s.shipment_id AND sm.declared_value > 10000000)`

#### Task 6.4: Unmanifested Cargo Containers (NOT EXISTS)
**Objective:** Use NOT EXISTS to identify any shipments currently marked as 'IN_TRANSIT' or 'CUSTOMS_HOLD' that have zero corresponding records in the shipment_manifest table.

> **Investigative Tip / Hint:** `WHERE NOT EXISTS (SELECT 1 FROM shipment_manifest sm WHERE sm.shipment_id = s.shipment_id)`

#### Task 6.5: Forensic Finding: Container CT-9042
**Objective:** Inspect shipment #7001 (tracking number 'TRK-AEGIS-9042'). Query its manifest records and compute the difference between actual_weight_kg and declared_weight_kg. What is concealed inside?

> **Investigative Tip / Hint:** `SELECT actual_weight_kg - declared_weight_kg AS discrepancy FROM shipments WHERE shipment_id = 7001;`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
