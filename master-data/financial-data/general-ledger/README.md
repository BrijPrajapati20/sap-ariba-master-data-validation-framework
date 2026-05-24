# General Ledger Validation

## Overview

Validation framework for General Ledger (GL) master data between:

- SAP ITK Extract
- SAP Ariba Export

This validation ensures accounting structures and financial governance remain accurate across SAP procurement and finance integrations.

---

# Validation Scope

| ITK Field | Description | Validation Required |
|---|---|---|
| SAKNR | G/L Account Number | Yes |
| BUKRS | Company Code | Yes |
| FSTAG | Field Status Group | No |
| XLOEB | Mark for Deletion | No |
| XSPEB | Blocked for Posting | No |
| TXT50 | G/L Description | No |

---

# Validation Coverage

- Missing Records
- Extra Records
- Duplicate Validation
- NULL Validation
- Company Code Validation
- Financial Control Validation
- Posting Block Validation
- Deletion Flag Validation
- Consolidated Reporting

---

# SQL Modules

- create_tables.sql
- import_data.sql
- validation_queries.sql
- financial_control_validation.sql
- consolidated_report.sql

---

# Database Support

- SQL Server (SSMS)
- MySQL

---

# Future Enhancements

- Financial governance dashboards
- GL hierarchy reporting
- Automated audit reconciliation
- Power BI finance analytics
