# Purchase Group Validation

## Overview

Validation framework for Purchase Group master data between:

- SAP ITK Extract
- SAP Ariba Export

This master data is global in nature and expected to remain consistent across all regions.

---

# Validation Scope

| ITK Field | Description | Validation Required |
|---|---|---|
| EKGRP | Purchase Group ID | Yes |
| EKNAM | Purchase Group Name | Yes |
| Purchasing Unit | Purchasing Unit ID | No |

---

# Validation Coverage

- Missing Records
- Extra Records
- Duplicate Validation
- Null Validation
- Length Validation
- Name Mismatch Validation
- Global Consistency Validation
- Consolidated Reporting

---

# SQL Modules

- create_tables.sql
- import_data.sql
- validation_queries.sql
- consolidated_report.sql

---

# Database Support

- SQL Server (SSMS)
- MySQL

---

# Future Enhancements

- Buyer hierarchy validation
- Procurement ownership analytics
- Region-wise consistency dashboard
- Automated governance checks
