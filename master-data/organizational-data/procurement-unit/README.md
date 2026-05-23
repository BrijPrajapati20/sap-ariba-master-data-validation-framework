# Procurement Unit Validation

## Overview

Validation framework for Procurement Unit master data between:

- SAP ITK Extract
- SAP Ariba Export

This validation ensures Procurement Unit consistency for respective countries and regions.

---

# Validation Scope

| ITK Field | Description | Validation Required |
|---|---|---|
| CoCode | Procurement Unit / Company Code | Yes |
| Text | Procurement Unit Name | Yes |
| Parent | Parent Relationship | No |

---

# Validation Coverage

- Missing Records
- Extra Records
- Duplicate Validation
- Null Validation
- Length Validation
- Name Mismatch Validation
- Region Validation
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

- Regional hierarchy validation
- Parent-child hierarchy checks
- Power BI dashboard integration
- Automated audit logging
