# Company Code Validation

## Overview

Validation framework for Company Code master data between:

- SAP ITK Extract
- SAP Ariba Export

This validation ensures company structure consistency across procurement and financial integrations.

---

# Validation Scope

| ITK Field | Description | Validation Required |
|---|---|---|
| BUKRS | Company Code ID | Yes |
| BUTXT | Company Name | Yes |
| FSTVA | Field Status Variant | Yes |
| Purchasing Unit | Purchasing Unit ID | Yes |
| cus_Country_UniqueName | Country Name | Yes |

---

# Validation Coverage

- Missing Records
- Extra Records
- Duplicate Validation
- Null Validation
- Length Validation
- Company Name Mismatch
- Field Status Variant Validation
- Purchasing Unit Mapping Validation
- Country Validation
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

- Country hierarchy validation
- Regional analytics
- Financial governance dashboard
- Automated reconciliation framework
