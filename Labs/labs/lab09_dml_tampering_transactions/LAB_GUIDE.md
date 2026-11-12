# Lab 09: Catching Data Tampering & DML Transactions
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** DML (INSERT, UPDATE, DELETE), Transactions (BEGIN, COMMIT, ROLLBACK), ACID Properties
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
Code Red! Surveillance reveals that Senior DBA Lukas Bader (employee 1012) is actively logged into the production database modifying shipment weight logs to conceal the Aegis hardware before customs inspection, and deleting audit logs. In this lab, you will audit the tamper logs, write atomic transactions to revert the tampering, and suspend the rogue insider.

---

### 📋 Investigative Tasks & Questions

#### Task 9.1: Interrogating the Audit Tamper Log
**Objective:** Query audit_tamper_log to review all operations performed by user 'lbader_dba' and 'dcroft_admin'. Examine what tables, records, and values were altered.

> **Investigative Tip / Hint:** `SELECT * FROM audit_tamper_log WHERE altered_by_user IN ('lbader_dba', 'dcroft_admin') ORDER BY timestamp;`

#### Task 9.2: Inspecting Tampered Record in Shipments
**Objective:** Review shipment 7001 in the shipments table. Compare declared_weight_kg against prior_state in the audit log.

> **Investigative Tip / Hint:** `SELECT shipment_id, tracking_number, declared_weight_kg, actual_weight_kg, status FROM shipments WHERE shipment_id = 7001;`

#### Task 9.3: Atomic Recovery Transaction with ACID Guarantees
**Objective:** Write an atomic transaction: BEGIN TRANSACTION; 1) Update shipment 7001 declared_weight_kg back to 13850.0 and set status to 'SEIZED'; 2) Insert an audit entry recording the court-ordered correction; 3) COMMIT;

> **Investigative Tip / Hint:** `BEGIN TRANSACTION; UPDATE shipments ...; INSERT INTO audit_tamper_log ...; COMMIT;`

#### Task 9.4: Transaction Rollback Demonstration
**Objective:** Demonstrate transaction safety: BEGIN TRANSACTION; execute an erroneous UPDATE that accidentally sets all employee salaries to 0; execute ROLLBACK; verify that data is completely restored.

> **Investigative Tip / Hint:** `BEGIN TRANSACTION; UPDATE employees SET salary = 0; ROLLBACK; SELECT AVG(salary) FROM employees;`

#### Task 9.5: Immediate Suspension of Rogue DBA
**Objective:** Write a transaction to update the status of employee 1012 (Lukas Bader) to 'SUSPENDED' and record the action in the audit log.

> **Investigative Tip / Hint:** `UPDATE employees SET status = 'SUSPENDED' WHERE employee_id = 1012;`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
