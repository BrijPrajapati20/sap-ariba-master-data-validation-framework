# ERP Commodity Code Validation

## Overview

Validation framework for ERP Commodity Code (Material Group) master data between:

- SAP ITK Extract
- SAP Ariba Export

This validation ensures procurement material categorization remains consistent across sourcing and procurement integrations.

---

# Validation Scope

| ITK Field | Description | Validation Required |
|---|---|---|
| MATKL | Material Group ID | Yes |
| WGBEZ | Material Group Description | Yes |

---

# Validation Coverage

- Missing Records
- Extra Records
- Duplicate Validation
- NULL Validation
- Description Mismatch Validation
- Category Integrity Validation
- Length Validation
- Consolidated Reporting

---

# SQL Modules

- create_tables.sql
- import_data.sql
- validation_queries.sql
- category_integrity_validation.sql
- consolidated_report.sql

---

# Database Support

- SQL Server (SSMS)
- MySQL

---

# Future Enhancements

- Spend analytics dashboard
- Category hierarchy visualization
- Procurement intelligence reporting
- Power BI sourcing analytics
