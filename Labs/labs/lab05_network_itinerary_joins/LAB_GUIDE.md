# Lab 05: Surveillance Correlation, Self-Joins & Network Maps
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** SELF JOIN, Complex Multi-Way Joins, Timestamp Correlations, Graph Modeling
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
Conspiracies require communication and coordination. In this lab, you will explore corporate hierarchies using Self-Joins on the employee tree, and correlate communication metadata from intercepted phone records against executive identities and cell tower locations on the night Dr. Rostova died.

---

### 📋 Investigative Tasks & Questions

#### Task 5.1: Organizational Hierarchy Self-Join
**Objective:** Execute a SELF JOIN on the employees table to list every employee alongside their direct manager's full name, role, and department.

> **Investigative Tip / Hint:** `FROM employees emp LEFT JOIN employees mgr ON emp.manager_id = mgr.employee_id`

#### Task 5.2: Subordinates Out-Earning Their Managers
**Objective:** Use a SELF JOIN to find all employees whose annual salary is strictly greater than their direct manager's salary. Display employee name, employee salary, manager name, and manager salary.

> **Investigative Tip / Hint:** `FROM employees emp JOIN employees mgr ON emp.manager_id = mgr.employee_id WHERE emp.salary > mgr.salary`

#### Task 5.3: Executive Satellite & Encrypted Communications
**Objective:** Join phone_records with employees to identify all calls made by personnel holding 'TOP_SECRET' clearance where the call_type is 'SATELLITE' or 'ENCRYPTED_VOIP'. Display caller name, role, receiver_number, call_timestamp, duration, and cell tower.

> **Investigative Tip / Hint:** `JOIN employees e ON p.caller_employee_id = e.employee_id WHERE e.security_clearance = 'TOP_SECRET' AND p.call_type IN ('SATELLITE', 'ENCRYPTED_VOIP')`

#### Task 5.4: Midnight Call Correlation (Nov 14-15, 2023)
**Objective:** Filter phone records for calls initiated between 2023-11-14 20:00:00 and 2023-11-15 06:00:00 (the critical 10-hour window surrounding Dr. Rostova's death). Display the caller details, duration, and destination number.

> **Investigative Tip / Hint:** `WHERE call_timestamp BETWEEN '2023-11-14 20:00:00' AND '2023-11-15 06:00:00'`

#### Task 5.5: Forensic Finding: The Shared Burner Number
**Objective:** Identify the external burner number that received calls from BOTH CEO Victor Vance and CFO Marcus Sterling on the night of November 14, 2023.

> **Investigative Tip / Hint:** `Look for the receiver_number common to employee_id 1001 and 1004: '+1 345 555 9011'.`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
