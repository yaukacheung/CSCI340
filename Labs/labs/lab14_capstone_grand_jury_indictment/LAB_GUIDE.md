# Lab 14: Grand Jury Indictment & Capstone Forensic Dossier
## Course: CSCI 340 - Database Systems & Forensics
**Case Code:** `OP-ROGUE-HORIZON` | **Target:** OmniCorp Global Logistics & Technologies

### 🎯 Pedagogical & Technical Focus
- **Core SQL Concepts:** Comprehensive SQL Synthesis, Complex CTEs, Window Functions, Forensic Auditing, Indictment Report
- **Target Database:** `database/omnicorp_investigation.db`

---

### 🕵️‍♂️ Investigative Case Briefing
The Federal Grand Jury has convened. You take the witness stand as Chief Forensic Database Investigator. You must present incontrovertible SQL proof linking all facets of the criminal enterprise: physical vault infiltration, network CAD exfiltration, maritime smuggling, offshore money laundering, and insider stock dumping.

---

### 📋 Investigative Tasks & Questions

#### Task 14.1: Evidence Vector 1: Physical Vault Breach
**Objective:** Write a query synthesizing security badge logs and employee records to prove the unauthorized midnight entry into Vault-7B on Nov 15, 2023, identifying the exact operatives and master key overrides.

> **Investigative Tip / Hint:** `SELECT b.scan_time, b.door_name, b.auth_method, b.access_result, e.employee_id, e.first_name || ' ' || e.last_name AS operative, e.role FROM security_badge_logs b JOIN employees e ON b.employee_id = e.employee_id WHERE b.door_name LIKE '%Vault-7B%' AND b.scan_time BETWEEN '2023-11-15 01:00:00' AND '2023-11-15 03:00:00' ORDER BY b.scan_time;`

#### Task 14.2: Evidence Vector 2: Cyber Exfiltration of Project Aegis
**Objective:** Write a query on network_access_logs and employees showing the massive 52 GB unauthorized CAD exfiltration by Damien Croft on Nov 14, 2023, prior to the physical vault breach.

> **Investigative Tip / Hint:** `SELECT n.session_start, n.session_end, n.ip_address, n.bytes_transferred / (1024*1024*1024.0) AS gbytes_exfiltrated, n.server_name, n.action_performed, e.first_name || ' ' || e.last_name AS suspect FROM network_access_logs n JOIN employees e ON n.employee_id = e.employee_id WHERE n.bytes_transferred > 10000000000;`

#### Task 14.3: Evidence Vector 3: Maritime Smuggling & Weight Tampering
**Objective:** Write a query joining shipments, shipment_manifest, and audit_tamper_log proving that shipment 7001 (Container CT-9042) had an unmanifested cryo-unit containing stolen quantum processors and altered declared weight.

> **Investigative Tip / Hint:** `SELECT s.shipment_id, s.tracking_number, s.origin_port, s.destination_port, s.declared_weight_kg, s.actual_weight_kg, sm.cargo_description, sm.declared_value, a.altered_by_user, a.prior_state FROM shipments s JOIN shipment_manifest sm ON s.shipment_id = sm.shipment_id LEFT JOIN audit_tamper_log a ON a.record_id = s.shipment_id WHERE s.shipment_id = 7001;`

#### Task 14.4: Evidence Vector 4: Money Laundering & Shell Flow CTE
**Objective:** Write a multi-CTE query tracing the flow of $15,000,000+ from OmniCorp corporate treasury through Chloe Dupont's split procurement orders into the shell companies owned by Victor Vance.

> **Investigative Tip / Hint:** `WITH kickback_pos AS (...), offshore_wires AS (...) SELECT ...;`

#### Task 14.5: Evidence Vector 5 & Final Grand Jury Indictment Dossier
**Objective:** Synthesize the entire investigation into a master indictment summary query naming the 6 principal co-conspirators, their roles, their illicit proceeds, and specific criminal charges.

> **Investigative Tip / Hint:** `Present final criminal indictment table: Victor Vance (RICO Mastermind), Marcus Sterling (Money Laundering), Klaus Richter (Smuggling), Damien Croft (Cyber Espionage), Chloe Dupont (Procurement Fraud), Erik Vogel (Physical Security Compromise).`

---

### 📤 Submission Deliverables
1. Save your completed SQL queries in [`student_queries.sql`](student_queries.sql).
2. Execute your script against `omnicorp_investigation.db` to verify syntax and outputs.
3. In the header comment of your SQL file, write a 2-3 sentence **Forensic Finding** explaining what clue you uncovered in this lab and how it advances the investigation against OmniCorp leadership.
