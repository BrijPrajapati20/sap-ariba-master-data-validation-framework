# Relation Entries - Plant Validation

## Overview

Validation framework for Plant Relation Entries between:

- SAP ITK Extract
- SAP Ariba Export

This validation ensures correct Plant and Company Code relationships are maintained during SAP Ariba integration and migration activities.

---

# Validation Scope

| ITK Field | Description | Validation Required |
|---|---|---|
| RightId | Company Code | Yes |
| LeftId | Plant ID | Yes |
| RightKey1 | Additional Mapping Key | No |
| RelationType.UniqueName | Relation Type | No |
| LeftKey1 | Additional Plant Key | No |

---

# Special Processing Logic

- DNU (Do Not Use) records must be removed
- Delete files must be processed before validation
- Relationship integrity validation required

---

# Validation Coverage

- Missing Relation Validation
- Extra Relation Validation
- Duplicate Relation Validation
- NULL Validation
- DNU Cleansing Validation
- Relationship Integrity Validation
- Company Code Mapping Validation
- Consolidated Reporting

---

# SQL Modules

- create_tables.sql
- import_data.sql
- validation_queries.sql
- dnu_cleanup.sql
- consolidated_report.sql

---

# Database Support

- SQL Server (SSMS)
- MySQL

---

# Future Enhancements

- Hierarchy visualization
- Automated DNU cleansing
- Power BI migration analytics
- Historical relationship tracking
