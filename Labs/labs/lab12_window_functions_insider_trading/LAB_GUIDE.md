# Lab 12: Financial Trajectory & Window Functions
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** Window Functions, OVER(), PARTITION BY, ORDER BY, ROW_NUMBER(), RANK(), LEAD(), LAG(), Cumulative Sums
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
Whistleblower Dr. Rostova was killed on November 15, 2023. Did OmniCorp executives know the Aegis project was compromised before the news broke? In this lab, you will use SQL analytical window functions to analyze stock dumping trends, rank insider trades, and trace the sequential movement of capital.

---

### 📋 Investigative Tasks & Questions

#### Task 12.1: Ranking Insider Stock Dumps (RANK & DENSE_RANK)
**Objective:** Using the stock_trades table, rank all 'SELL' trades across the company by total_trade_val descending using both RANK() and DENSE_RANK() OVER (ORDER BY total_trade_val DESC). Display the top 10 largest dumps.

> **Investigative Tip / Hint:** `SELECT trade_id, employee_id, shares, total_trade_val, RANK() OVER (ORDER BY total_trade_val DESC) AS rnk FROM stock_trades WHERE trade_type = 'SELL';`

#### Task 12.2: Partitioned Trading Sequence (ROW_NUMBER)
**Objective:** Assign a sequential transaction number to each trade partitioned by employee_id and ordered by trade_timestamp: ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY trade_timestamp).

> **Investigative Tip / Hint:** `SELECT employee_id, trade_timestamp, trade_type, total_trade_val, ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY trade_timestamp) AS trade_seq FROM stock_trades;`

#### Task 12.3: Price Drift Detection (LAG)
**Objective:** Use LAG(price_per_share, 1) OVER (PARTITION BY employee_id ORDER BY trade_timestamp) to calculate the difference between the price at which an employee sold stock versus their prior sale price.

> **Investigative Tip / Hint:** `SELECT employee_id, price_per_share, LAG(price_per_share, 1) OVER (PARTITION BY employee_id ORDER BY trade_timestamp) AS prev_price FROM stock_trades;`

#### Task 12.4: Cumulative Liquidation Volume (Running Sum)
**Objective:** Compute the cumulative running total of stock liquidated by each executive throughout November 2023: SUM(total_trade_val) OVER (PARTITION BY employee_id ORDER BY trade_timestamp).

> **Investigative Tip / Hint:** `SELECT employee_id, trade_timestamp, total_trade_val, SUM(total_trade_val) OVER (PARTITION BY employee_id ORDER BY trade_timestamp) AS cumulative_dump FROM stock_trades WHERE trade_type = 'SELL';`

#### Task 12.5: Forensic Finding: The Pre-Murder Dump (Nov 10-12, 2023)
**Objective:** Filter stock dumps between 2023-11-09 and 2023-11-13. Identify the three executives who liquidated over $50,000,000 in equity 72 hours before Dr. Rostova's death.

> **Investigative Tip / Hint:** `Examine Victor Vance ($27.6M), Marcus Sterling ($15.5M), and Chloe Dupont ($7.3M).`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
