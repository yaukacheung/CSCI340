# Lab 03: Forensic Accounting & Aggregate Anomalies
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** Aggregate Functions (COUNT, SUM, AVG, MIN, MAX), GROUP BY, HAVING, Smurfing Detection
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
Criminal syndicates avoid automatic bank reporting by 'smurfing' or structuring transactions—splitting large illegal transfers into smaller payments just below regulatory reporting thresholds (specifically $10,000). Furthermore, rogue division heads often inflate departmental procurement. In this lab, you will leverage SQL grouping and aggregate functions to uncover financial structuring and compute departmental budget variances.

---

### 📋 Investigative Tasks & Questions

#### Task 3.1: Global Transaction Baseline Metrics
**Objective:** Calculate the total number of financial transactions, the sum of all transaction amounts, the average transaction amount, the minimum amount, and the maximum amount across the entire enterprise.

> **Investigative Tip / Hint:** `SELECT COUNT(*), SUM(amount), AVG(amount), MIN(amount), MAX(amount) FROM financial_transactions;`

#### Task 3.2: Transaction Breakdown by Transfer Type
**Objective:** Group all transactions by txn_type. For each type, display the transaction type, count of transactions, total volume in USD, and average transfer size. Order by total volume descending.

> **Investigative Tip / Hint:** `SELECT txn_type, COUNT(*), SUM(amount), AVG(amount) FROM financial_transactions GROUP BY txn_type ORDER BY SUM(amount) DESC;`

#### Task 3.3: Smurfing / Structuring Detection ($9,000 - $9,999)
**Objective:** Detect smurfing: Find all destination accounts (account_to) that have received 3 or more transactions with amounts between $9,000.00 and $9,999.99. Display account_to, the count of structured transfers, and the total structured amount.

> **Investigative Tip / Hint:** `WHERE amount BETWEEN 9000 AND 9999.99 GROUP BY account_to HAVING COUNT(*) >= 3 ORDER BY COUNT(*) DESC;`

#### Task 3.4: Procurement Order Patterns by Risk Rating
**Objective:** Group procurement orders by the vendor's risk rating. Calculate the total order count and total spend. (Note: Join or aggregate on procurement orders total_amount).

> **Investigative Tip / Hint:** `SELECT risk_rating, COUNT(*), SUM(total_amount) FROM procurement_orders JOIN vendors USING(vendor_id) GROUP BY risk_rating;`

#### Task 3.5: Forensic Finding: Identifying the Smurfed Recipient
**Objective:** Identify the primary recipient account receiving repeated $9,800 - $9,995 transfers and match it to a vendor bank account in the vendors table.

> **Investigative Tip / Hint:** `Examine account_to = 'KY-APEX-9910-01' and match with bank_account_no in vendors.`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
