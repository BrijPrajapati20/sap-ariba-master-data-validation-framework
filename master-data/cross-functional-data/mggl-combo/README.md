# MGGL Combo Validation

## Overview

Validation framework for Material Group and General Ledger combinations between:

- SAP ITK Extract
- SAP Ariba Export

This validation ensures procurement categories are correctly mapped to financial accounting structures.

---

# Validation Scope

| ITK Field | Description | Validation Required |
|---|---|---|
| UniqueName | Material Group ID | Yes |
| GL_Number | General Ledger Number | Yes |

---

# Validation Coverage

- Missing Records
- Extra Records
- Duplicate Validation
- NULL Validation
- Material Group Validation
- GL Mapping Validation
- Spend Governance Validation
- Cross-Functional Integrity Validation
- Consolidated Reporting

---

# SQL Modules

- create_tables.sql
- import_data.sql
- validation_queries.sql
- spend_governance_validation.sql
- consolidated_report.sql

---

# Database Support

- SQL Server (SSMS)
- MySQL

---

# Future Enhancements

- Spend category analytics
- Material-to-GL reporting
- Procurement accounting dashboards
- Power BI spend governance
