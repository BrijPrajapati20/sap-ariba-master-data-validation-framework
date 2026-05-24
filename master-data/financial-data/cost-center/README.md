# Cost Center Validation

## Overview

Validation framework for Cost Center master data between:

- SAP ITK Extract
- SAP Ariba Export

This validation ensures controlling structures and procurement-finance mappings remain accurate across enterprise integrations.

---

# Validation Scope

| ITK Field | Description | Validation Required |
|---|---|---|
| KOSTL | Cost Center ID | Yes |
| BUKRS | Company Code | Yes |
| VERAK_USER | Responsible User | No |
| WAERS | Currency | No |
| KTEXT | Short Text | No |
| LTEXT | Long Text | No |
| PurchasingUnit | Purchasing Unit | No |
| ZZALIAS | Alias | No |
| cus_ServiceArea | Service Area | No |
| cus_ServiceLine | Service Line | No |

---

# Special Mapping Logic

- ARIBA.KTEXT must match ITK.LTEXT

---

# Validation Coverage

- Missing Records
- Extra Records
- Duplicate Validation
- NULL Validation
- Company Code Validation
- Currency Validation
- Service Area Validation
- Service Line Validation
- Text Mapping Validation
- Controlling Governance Validation
- Consolidated Reporting

---

# SQL Modules

- create_tables.sql
- import_data.sql
- validation_queries.sql
- controlling_validation.sql
- consolidated_report.sql

---

# Database Support

- SQL Server (SSMS)
- MySQL

---

# Future Enhancements

- Cost center hierarchy reporting
- Budget ownership governance
- Service area analytics
- Power BI controlling dashboards
