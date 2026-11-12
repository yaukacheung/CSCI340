# Lab 04: Multi-Table Link Analysis & Relational Joins
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** Relational Integrity, INNER JOIN, LEFT JOIN, Multi-Table Joins, Aliases
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
A database is only as powerful as the relationships between its tables. In this lab, you will perform multi-table link analysis to bridge the gap between financial outflows, procurement orders, rogue approving executives, and shadowy shell vendors. You will uncover who inside OmniCorp signed off on millions of dollars in fraudulent contracts.

---

### 📋 Investigative Tasks & Questions

#### Task 4.1: Procurement Orders Linked to Vendors
**Objective:** Perform an INNER JOIN between procurement_orders and vendors. Display po_id, order_date, total_amount, vendor_name, registration_country, and is_approved. Filter for orders over $50,000.

> **Investigative Tip / Hint:** `FROM procurement_orders p JOIN vendors v ON p.vendor_id = v.vendor_id`

#### Task 4.2: Tracing Requesters of Unapproved Vendor Contracts
**Objective:** Join procurement_orders, vendors, and employees (as the requester). Find all orders placed with unapproved vendors (is_approved = 0). Display po_id, vendor_name, total_amount, requester full name, role, and department.

> **Investigative Tip / Hint:** `JOIN employees e ON p.requester_id = e.employee_id WHERE v.is_approved = 0`

#### Task 4.3: The Sign-Off: Linking Approving Executives
**Objective:** Execute a 4-table join connecting procurement_orders, vendors, employees (as requester), and employees (as approver). Isolate orders placed to 'Apex Global Horizon Ltd' and 'CypherTech Holdings BVI'. Who requested them, and who approved them?

> **Investigative Tip / Hint:** `JOIN employees req ON p.requester_id = req.employee_id JOIN employees app ON p.approver_id = app.employee_id`

#### Task 4.4: Audit Inactive Personnel via LEFT JOIN
**Objective:** Perform a LEFT JOIN between employees and procurement_orders to identify all employees in the Global Procurement department (dept_id = 7) who have NEVER requested a procurement order.

> **Investigative Tip / Hint:** `FROM employees e LEFT JOIN procurement_orders p ON e.employee_id = p.requester_id WHERE e.dept_id = 7 AND p.po_id IS NULL`

#### Task 4.5: Total Spend Analysis by Approver
**Objective:** Aggregate total procurement dollars approved by each executive approver. Display approver_id, approver full name, count of approved orders, and total sum. Order by total sum approved descending.

> **Investigative Tip / Hint:** `JOIN employees app ON p.approver_id = app.employee_id GROUP BY p.approver_id ORDER BY SUM(p.total_amount) DESC`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
