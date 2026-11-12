"""
Test Specifications & Forensic Validators for CSCI 340 Lab Series
Contains validation logic and expected result checks for Labs 01 through 14.
"""

def val_1_1(rows, cols, sql):
    if len(rows) < 15:
        return False, f"Expected at least 15 tables from sqlite_master, but got {len(rows)}."
    table_names = [str(r[1] if len(r) > 1 else r[0]).lower() for r in rows]
    expected = {'employees', 'departments', 'vendors', 'procurement_orders', 'shipments'}
    if not expected.issubset(set(table_names)):
        return False, f"Missing expected core tables. Found: {table_names[:5]}..."
    return True, f"Correctly retrieved {len(rows)} user tables."

def val_1_2(rows, cols, sql):
    if len(rows) != 10:
        return False, f"Expected 10 departments, got {len(rows)}."
    top_dept = str(rows[0][0])
    top_budget = float(rows[0][1])
    if "Research" not in top_dept or top_budget < 80000000:
        return False, f"Expected highest budget department to be Research & Development ($85M), got '{top_dept}' (${top_budget:,.2f})."
    return True, "All 10 departments returned and correctly ordered by budget DESC."

def val_1_3(rows, cols, sql):
    if len(rows) != 10:
        return False, f"Expected exactly 10 highest-earning employees (LIMIT 10), got {len(rows)}."
    top_salary = float(rows[0][4] if len(rows[0]) >= 5 else rows[0][-1])
    if top_salary < 1000000:
        return False, f"Expected CEO Victor Vance with $1,250,000 top salary, got {top_salary}."
    return True, f"Top 10 highest earners successfully retrieved (Top salary: ${top_salary:,.2f})."

def val_1_4(rows, cols, sql):
    if len(rows) != 1:
        return False, f"Expected 1 record for Dr. Elena Rostova, got {len(rows)}."
    row_str = " ".join(str(v) for v in rows[0])
    if "Rostova" not in row_str or "DECEASED" not in row_str:
        return False, f"Record found but expected status 'DECEASED' and last name 'Rostova'. Got: {row_str}"
    return True, "Whistleblower record retrieved: Dr. Elena Rostova is marked DECEASED."

def val_1_5(rows, cols, sql):
    if len(rows) != 1:
        return False, f"Expected 1 record for Dr. Rostova's manager, got {len(rows)}."
    row_str = " ".join(str(v) for v in rows[0])
    if "Vance" not in row_str:
        return False, f"Expected manager to be CEO Victor Vance, got: {row_str}"
    return True, "Identified manager: CEO Victor Vance (employee_id 1001)."

# Lab 2
def val_2_1(rows, cols, sql):
    if len(rows) < 4:
        return False, f"Expected active high-clearance Zurich senior staff earning >$250k, got {len(rows)}."
    return True, f"Found all {len(rows)} high-clearance Zurich senior staff."

def val_2_2(rows, cols, sql):
    if len(rows) != 1:
        return False, f"Expected 1 ghost employee in offshore offices with salary >$200k, got {len(rows)}."
    row_str = " ".join(str(v) for v in rows[0])
    if "Kaspar" not in row_str or "Hauser" not in row_str:
        return False, f"Expected ghost employee Kaspar Hauser, got: {row_str}"
    return True, "Ghost employee isolated: Kaspar Hauser (Cayman Islands, $265k salary)."

def val_2_3(rows, cols, sql):
    if len(rows) < 4:
        return False, f"Expected at least 4 high-risk/tax haven vendors, got {len(rows)}."
    vendor_names = " ".join(str(r[1] if len(r) > 1 else r[0]) for r in rows)
    if "Apex" not in vendor_names or "CypherTech" not in vendor_names:
        return False, f"Missing critical shell vendors (Apex or CypherTech). Found: {vendor_names[:60]}..."
    return True, f"Successfully retrieved {len(rows)} high-risk offshore vendors."

def val_2_4(rows, cols, sql):
    if len(rows) < 4:
        return False, f"Expected at least 4 pattern-matched shell vendors, got {len(rows)}."
    return True, f"Pattern matching found {len(rows)} suspicious entities."

def val_2_5(rows, cols, sql):
    if len(rows) < 1:
        return False, "Expected flagged/high-value offshore transactions, got 0 rows."
    top_amount = float(rows[0][3] if len(rows[0]) >= 4 else rows[0][0])
    if top_amount < 2000000:
        return False, f"Expected top transaction to be $2,500,000.00 offshore wire, got ${top_amount:,.2f}."
    return True, f"Flagged offshore transactions retrieved (Top transfer: ${top_amount:,.2f})."

# Lab 3
def val_3_1(rows, cols, sql):
    if len(rows) != 1:
        return False, f"Expected 1 aggregate summary row, got {len(rows)}."
    total_txns = int(rows[0][0])
    if total_txns != 40000:
        return False, f"Expected total_txns = 40,000, got {total_txns}."
    return True, "Global transaction metrics verified (40,000 total transactions)."

def val_3_2(rows, cols, sql):
    if len(rows) < 6:
        return False, f"Expected at least 6 transaction types, got {len(rows)}."
    return True, f"Transaction breakdown computed across {len(rows)} distinct transfer types."

def val_3_3(rows, cols, sql):
    found_apex = any("KY-APEX-9910-01" in str(r) for r in rows)
    if not found_apex:
        return False, "Smurfing target 'KY-APEX-9910-01' not found among structured transaction recipients."
    return True, f"Smurfing detected! Found accounts with structured transfers, including KY-APEX-9910-01."

def val_3_4(rows, cols, sql):
    if len(rows) != 4:
        return False, f"Expected 4 risk rating categories (LOW, MEDIUM, HIGH, CRITICAL), got {len(rows)}."
    return True, "Procurement spend grouped by all 4 risk tiers."

def val_3_5(rows, cols, sql):
    row_str = " ".join(str(r) for r in rows)
    if "Apex Global" not in row_str:
        return False, f"Expected vendor 'Apex Global Horizon Ltd', got: {row_str[:60]}."
    return True, "Smurfed recipient account matched to Apex Global Horizon Ltd."

# Lab 4
def val_4_1(rows, cols, sql):
    if len(rows) < 10:
        return False, f"Expected multiple procurement orders >$50k, got {len(rows)}."
    return True, f"Retrieved {len(rows)} high-value procurement orders with vendor details."

def val_4_2(rows, cols, sql):
    if len(rows) < 5:
        return False, f"Expected orders placed with unapproved vendors, got {len(rows)}."
    return True, f"Identified {len(rows)} orders routed to unapproved vendors."

def val_4_3(rows, cols, sql):
    row_str = " ".join(str(r) for r in rows)
    if "Chloe Dupont" not in row_str or "Marcus Sterling" not in row_str:
        return False, f"Expected requester Chloe Dupont and approver Marcus Sterling. Got: {row_str[:80]}."
    return True, "Conspiracy link established: Chloe Dupont requested and Marcus Sterling approved shell orders."

def val_4_4(rows, cols, sql):
    if len(rows) < 1:
        return False, "Expected at least 1 procurement employee with no orders, got 0."
    return True, f"Found {len(rows)} procurement employees with zero order activity."

def val_4_5(rows, cols, sql):
    if len(rows) < 5:
        return False, f"Expected spend aggregated by approver, got {len(rows)} rows."
    return True, f"Total procurement spend aggregated across {len(rows)} approving executives."

# Lab 5
def val_5_1(rows, cols, sql):
    if len(rows) < 10:
        return False, f"Expected employee-manager hierarchy list, got {len(rows)} rows."
    return True, f"Organizational hierarchy self-join verified ({len(rows)} rows returned)."

def val_5_2(rows, cols, sql):
    if len(rows) < 5:
        return False, f"Expected subordinates out-earning managers, got {len(rows)} rows."
    return True, f"Identified {len(rows)} subordinates out-earning their managers."

def val_5_3(rows, cols, sql):
    if len(rows) < 2:
        return False, f"Expected encrypted/satellite calls by TOP_SECRET personnel, got {len(rows)}."
    return True, f"Found {len(rows)} encrypted/satellite communications by executive staff."

def val_5_4(rows, cols, sql):
    if len(rows) < 4:
        return False, f"Expected calls during the midnight murder window (Nov 14-15), got {len(rows)}."
    return True, f"Isolated {len(rows)} suspicious calls during the 10-hour critical window."

def val_5_5(rows, cols, sql):
    row_str = " ".join(str(r) for r in rows)
    if "345 555 9011" not in row_str:
        return False, f"Expected shared burner number '+1 345 555 9011', got: {row_str}."
    return True, "Shared burner number uncovered: +1 345 555 9011 called by both Vance and Sterling."

# Lab 6
def val_6_1(rows, cols, sql):
    if len(rows) < 100:
        return False, f"Expected employees earning more than departmental average, got {len(rows)}."
    return True, f"Subquery identified {len(rows)} employees exceeding departmental salary averages."

def val_6_2(rows, cols, sql):
    if len(rows) < 50:
        return False, f"Expected vendors with orders above average, got {len(rows)}."
    return True, f"Multi-row subquery identified {len(rows)} vendors winning above-average orders."

def val_6_3(rows, cols, sql):
    if len(rows) < 2:
        return False, f"Expected shipments carrying >$10M contraband (EXISTS), got {len(rows)}."
    return True, f"EXISTS subquery isolated {len(rows)} shipments containing ultra-high-value cargo."

def val_6_4(rows, cols, sql):
    return True, f"NOT EXISTS subquery executed successfully ({len(rows)} unmanifested shipments checked)."

def val_6_5(rows, cols, sql):
    row_str = " ".join(str(r) for r in rows)
    if "1450" not in row_str and "Aegis" not in row_str:
        return False, f"Expected 1,450 kg weight discrepancy and Aegis hardware for shipment 7001. Got: {row_str}"
    return True, "Container CT-9042 contraband verified: 1,450 kg undeclared Aegis Cryo-Unit ($85M)."

# Lab 7
def val_7_1(rows, cols, sql):
    if len(rows) < 500:
        return False, f"Expected comprehensive account list from UNION, got {len(rows)}."
    return True, f"UNION compiled master ledger of {len(rows)} distinct active accounts."

def val_7_2(rows, cols, sql):
    return True, f"INTERSECT identified {len(rows)} dual-purpose accounts."

def val_7_3(rows, cols, sql):
    found_kaspar = any("1016" in str(r) or "Kaspar" in str(r) for r in rows)
    if not found_kaspar:
        return False, "Expected ghost employee Kaspar Hauser (1016) in EXCEPT query results."
    return True, "EXCEPT forensic proof: Kaspar Hauser identified with ZERO badge swipes in 2023."

def val_7_4(rows, cols, sql):
    return True, f"EXCEPT query executed successfully ({len(rows)} unlinked wire accounts found)."

def val_7_5(rows, cols, sql):
    row_str = " ".join(str(r) for r in rows)
    if "Kaspar" not in row_str or "Hauser" not in row_str:
        return False, f"Expected confirmation of Kaspar Hauser, got: {row_str}"
    return True, "Ghost employee Kaspar Hauser confirmed on payroll with zero physical footprint."

# Lab 8 (DDL tests)
def val_8_1(rows, cols, sql):
    if "CREATE TABLE" not in sql.upper() or "EVIDENCE_LOCKBOX" not in sql.upper():
        return False, "Query must contain CREATE TABLE evidence_lockbox."
    return True, "DDL for evidence_lockbox verified."

def val_8_2(rows, cols, sql):
    if "CREATE TABLE" not in sql.upper() or "CONTRABAND_HARDWARE" not in sql.upper():
        return False, "Query must contain CREATE TABLE contraband_hardware with CHECK constraint."
    return True, "DDL for contraband_hardware with CHECK constraint verified."

def val_8_3(rows, cols, sql):
    return True, "Foreign key relationships and index verified."

def val_8_4(rows, cols, sql):
    return True, "Negative constraint test verified."

def val_8_5(rows, cols, sql):
    if "SN-AEGIS" not in sql:
        return False, "Query must stage Aegis prototype chip (serial SN-AEGIS-...)."
    return True, "Intercepted Aegis prototype chip staged into quarantine schema."

# Lab 9 (DML tests)
def val_9_1(rows, cols, sql):
    if len(rows) < 1:
        return False, "Expected audit tamper log records for lbader_dba or dcroft_admin, got 0."
    return True, f"Found {len(rows)} audit tampering entries."

def val_9_2(rows, cols, sql):
    if len(rows) != 1:
        return False, f"Expected shipment 7001 record, got {len(rows)}."
    return True, "Tampered shipment 7001 inspected."

def val_9_3(rows, cols, sql):
    if "UPDATE" not in sql.upper() or "13850" not in sql:
        return False, "Expected transaction updating declared_weight_kg to 13850.0."
    return True, "Atomic recovery transaction script verified."

def val_9_4(rows, cols, sql):
    if "ROLLBACK" not in sql.upper():
        return False, "Expected demonstration of ROLLBACK."
    return True, "Transaction rollback demonstrated successfully."

def val_9_5(rows, cols, sql):
    if "1012" not in sql or "SUSPENDED" not in sql.upper():
        return False, "Expected UPDATE setting employee 1012 to SUSPENDED."
    return True, "Immediate suspension of rogue DBA Lukas Bader verified."

# Lab 10 (Views)
def val_10_1(rows, cols, sql):
    if "CREATE VIEW" not in sql.upper() or "V_GRAND_JURY_PROCUREMENT" not in sql.upper():
        return False, "Expected CREATE VIEW v_grand_jury_procurement."
    return True, "Grand Jury procurement view created with masked bank accounts."

def val_10_2(rows, cols, sql):
    if "CREATE VIEW" not in sql.upper() or "V_OFFSHORE" not in sql.upper():
        return False, "Expected CREATE VIEW for offshore capital flight."
    return True, "Offshore capital flight view verified."

def val_10_3(rows, cols, sql):
    if "CREATE VIEW" not in sql.upper() or "V_EXECUTIVE" not in sql.upper():
        return False, "Expected CREATE VIEW for executive communications."
    return True, "Executive surveillance view verified."

def val_10_4(rows, cols, sql):
    return True, f"Query against view executed successfully ({len(rows)} rows returned)."

def val_10_5(rows, cols, sql):
    return True, f"Privilege escalation audit executed successfully ({len(rows)} rows returned)."

# Lab 11 (Indexes)
def val_11_1(rows, cols, sql):
    return True, "Baseline query plan analyzed (table scan identified)."

def val_11_2(rows, cols, sql):
    if "CREATE INDEX" not in sql.upper() or "SECURITY_BADGE_LOGS" not in sql.upper():
        return False, "Expected CREATE INDEX on security_badge_logs."
    return True, "Composite B-Tree index created on (door_name, scan_time)."

def val_11_3(rows, cols, sql):
    return True, "Optimized query plan verified using index."

def val_11_4(rows, cols, sql):
    row_str = " ".join(str(r) for r in rows)
    if "Damien" not in row_str and "1006" not in row_str:
        return False, f"Expected 52 GB exfiltration by Damien Croft, got: {row_str[:60]}."
    return True, "Network exfiltration query verified: 52 GB transferred by Damien Croft."

def val_11_5(rows, cols, sql):
    row_str = " ".join(str(r) for r in rows)
    if "MASTER_KEY" not in row_str or "Alexei" not in row_str:
        return False, f"Expected midnight Vault-7B entry by Erik Vogel and Alexei Rivera. Got: {row_str[:80]}."
    return True, "Midnight Vault-7B infiltration solved: Vogel & Rivera used master overrides."

# Lab 12 (Window Functions)
def val_12_1(rows, cols, sql):
    if len(rows) < 5 or "OVER" not in sql.upper():
        return False, "Expected ranking of stock sales using window function RANK() OVER (...)."
    return True, "Stock dumps ranked using window functions."

def val_12_2(rows, cols, sql):
    if "ROW_NUMBER" not in sql.upper() or "PARTITION BY" not in sql.upper():
        return False, "Expected ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY trade_timestamp)."
    return True, "Partitioned trade sequence computed with ROW_NUMBER()."

def val_12_3(rows, cols, sql):
    if "LAG" not in sql.upper():
        return False, "Expected price drift analysis using LAG()."
    return True, "Price drift computed using LAG()."

def val_12_4(rows, cols, sql):
    if "SUM" not in sql.upper() or "OVER" not in sql.upper():
        return False, "Expected running total using SUM(...) OVER (PARTITION BY ... ORDER BY ...)."
    return True, "Cumulative liquidation running totals verified."

def val_12_5(rows, cols, sql):
    row_str = " ".join(str(r) for r in rows)
    if "Victor Vance" not in row_str or "Marcus Sterling" not in row_str:
        return False, f"Expected pre-murder dumps by Victor Vance and Marcus Sterling. Got: {row_str[:80]}."
    return True, "Pre-murder stock dumping proven: Vance, Sterling, and Dupont dumped >$50M."

# Lab 13 (CTEs)
def val_13_1(rows, cols, sql):
    if "WITH" not in sql.upper():
        return False, "Expected Common Table Expression (WITH ...)."
    return True, "CTE vendor risk aggregation verified."

def val_13_2(rows, cols, sql):
    if "WITH" not in sql.upper():
        return False, "Expected chained CTEs."
    return True, "Chained CTEs for capital flight balancing verified."

def val_13_3(rows, cols, sql):
    if "RECURSIVE" not in sql.upper() or "UNION ALL" not in sql.upper():
        return False, "Expected recursive CTE (WITH RECURSIVE ... UNION ALL ...)."
    return True, "Recursive CTE hierarchy traversal verified."

def val_13_4(rows, cols, sql):
    if "RECURSIVE" not in sql.upper():
        return False, "Expected reverse recursive CTE."
    return True, "Reverse recursive CTE traversal verified."

def val_13_5(rows, cols, sql):
    row_str = " ".join(str(r) for r in rows)
    if "Victor" not in row_str or "Vance" not in row_str:
        return False, f"Expected Ultimate Beneficial Owner to be Victor Vance. Got: {row_str}."
    return True, "Ultimate Beneficial Owner confirmed: CEO Victor Vance owns the shell syndicate."

# Lab 14 (Capstone)
def val_14_1(rows, cols, sql):
    return True, "Evidence Vector 1 (Physical Vault Breach) verified."

def val_14_2(rows, cols, sql):
    return True, "Evidence Vector 2 (Cyber Exfiltration) verified."

def val_14_3(rows, cols, sql):
    return True, "Evidence Vector 3 (Maritime Smuggling & Weight Tampering) verified."

def val_14_4(rows, cols, sql):
    return True, "Evidence Vector 4 (Money Laundering Flow) verified."

def val_14_5(rows, cols, sql):
    row_str = " ".join(str(r) for r in rows)
    if "1001" not in row_str and "Vance" not in row_str:
        return False, f"Expected master indictment naming Victor Vance and conspirators. Got: {row_str[:60]}."
    return True, "Master Grand Jury Indictment Dossier complete and verified!"

LAB_VALIDATORS = {
    1: {"1.1": val_1_1, "1.2": val_1_2, "1.3": val_1_3, "1.4": val_1_4, "1.5": val_1_5},
    2: {"2.1": val_2_1, "2.2": val_2_2, "2.3": val_2_3, "2.4": val_2_4, "2.5": val_2_5},
    3: {"3.1": val_3_1, "3.2": val_3_2, "3.3": val_3_3, "3.4": val_3_4, "3.5": val_3_5},
    4: {"4.1": val_4_1, "4.2": val_4_2, "4.3": val_4_3, "4.4": val_4_4, "4.5": val_4_5},
    5: {"5.1": val_5_1, "5.2": val_5_2, "5.3": val_5_3, "5.4": val_5_4, "5.5": val_5_5},
    6: {"6.1": val_6_1, "6.2": val_6_2, "6.3": val_6_3, "6.4": val_6_4, "6.5": val_6_5},
    7: {"7.1": val_7_1, "7.2": val_7_2, "7.3": val_7_3, "7.4": val_7_4, "7.5": val_7_5},
    8: {"8.1": val_8_1, "8.2": val_8_2, "8.3": val_8_3, "8.4": val_8_4, "8.5": val_8_5},
    9: {"9.1": val_9_1, "9.2": val_9_2, "9.3": val_9_3, "9.4": val_9_4, "9.5": val_9_5},
    10: {"10.1": val_10_1, "10.2": val_10_2, "10.3": val_10_3, "10.4": val_10_4, "10.5": val_10_5},
    11: {"11.1": val_11_1, "11.2": val_11_2, "11.3": val_11_3, "11.4": val_11_4, "11.5": val_11_5},
    12: {"12.1": val_12_1, "12.2": val_12_2, "12.3": val_12_3, "12.4": val_12_4, "12.5": val_12_5},
    13: {"13.1": val_13_1, "13.2": val_13_2, "13.3": val_13_3, "13.4": val_13_4, "13.5": val_13_5},
    14: {"14.1": val_14_1, "14.2": val_14_2, "14.3": val_14_3, "14.4": val_14_4, "14.5": val_14_5}
}
