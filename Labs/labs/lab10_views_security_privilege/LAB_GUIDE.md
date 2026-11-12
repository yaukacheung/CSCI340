# Lab 10: Virtual Evidence Lockers: Views & Security Access Control
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** CREATE VIEW, Security Abstraction, Column Masking, Row-Level Filtering, Least Privilege
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
Federal prosecutors and the Grand Jury have issued subpoenas for OmniCorp's financial and logistics data. However, due to national security regulations, raw defense blueprints and sensitive employee PII (such as personal banking info) must be masked. In this lab, you will design secure views providing tailored, masked access for external investigators.

---

### 📋 Investigative Tasks & Questions

#### Task 10.1: Grand Jury Procurement Audit View
**Objective:** Create a view named v_grand_jury_procurement joining procurement_orders, vendors, and employees. Mask the vendor bank_account_no so only the last 4 digits are visible ('****' || SUBSTR(bank_account_no, -4)). Include order details and approver name.

> **Investigative Tip / Hint:** `CREATE VIEW v_grand_jury_procurement AS SELECT po_id, vendor_name, '****' || SUBSTR(bank_account_no, -4) AS masked_account ...;`

#### Task 10.2: Offshore Capital Flight Monitoring View
**Objective:** Create a view named v_offshore_capital_flight that selects all financial_transactions routed to accounts starting with 'KY-', 'PA-', 'VG-', or 'SC-'. Include transaction amount, currency, timestamp, and authorizing executive.

> **Investigative Tip / Hint:** `CREATE VIEW v_offshore_capital_flight AS SELECT ... WHERE account_to LIKE 'KY-%' OR account_to LIKE 'PA-%' ...;`

#### Task 10.3: Executive Communications Surveillance View
**Objective:** Create a view named v_executive_surveillance combining phone records with caller employee details, filtering exclusively for calls where caller security_clearance is 'TOP_SECRET' or role contains 'Chief' or 'VP'.

> **Investigative Tip / Hint:** `CREATE VIEW v_executive_surveillance AS SELECT ...;`

#### Task 10.4: Querying and Validating View Abstraction
**Objective:** Run analytical queries against v_offshore_capital_flight to calculate total funds funneled into each jurisdiction prefix. Verify that underlying sensitive tables are protected.

> **Investigative Tip / Hint:** `SELECT SUBSTR(account_to, 1, 2) AS jurisdiction, SUM(amount), COUNT(*) FROM v_offshore_capital_flight GROUP BY 1;`

#### Task 10.5: Auditing Privilege Escalation in Network Logs
**Objective:** Query network_access_logs to find sessions where non-IT employees (employees outside dept_id 6) accessed 'srv-db-audit.zurich.internal' or executed actions containing 'TAMPER' or 'PURGE'.

> **Investigative Tip / Hint:** `JOIN employees e ON n.employee_id = e.employee_id WHERE e.dept_id != 6 AND n.action_performed LIKE '%TAMPER%';`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
