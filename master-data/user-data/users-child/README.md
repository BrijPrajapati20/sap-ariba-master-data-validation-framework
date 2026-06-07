# Users Child Validation

## Overview

This module validates User Child master data between SAP ITK Extract and SAP Ariba Export.

User Child records represent operational users configured within procurement realms and define purchasing access, company code access, plant access, cost center access, and approval routing.

---

# Business Purpose

User Child data drives:

- Purchase Requisitions
- Purchase Orders
- Approval Workflows
- Cost Center Access
- Plant Access
- Purchase Organization Access
- Reporting

Incorrect user setup may result in:

- Workflow failures
- Access issues
- Compliance risks
- Incorrect reporting

---

# Validation Scope

| ITK Field | Description | Validation Required |
|------------|------------|---------------------|
| UniqueName | Ariba ID | Yes |
| OriginalUniqueName | SAP ID | Yes |
| Name | User Name | Yes |
| EmailAddress | Email ID | Yes |
| SAPBillingAddress | Default Ship To | Yes |
| SAPPlant | Default Plant | Yes |
| SAPCostCenter | Cost Center | Yes |
| SAPPurchaseOrg | Purchase Org | Yes |
| SAPCompanyCode | Company Code | Yes |
| SAPPurchaseGroup | Purchase Group | Yes |
| Role Name | Role | Yes |

---

# Validation Coverage

## Record Validation

- Missing Records
- Extra Records
- Duplicate Records

## Access Validation

- Plant Access Validation
- Purchase Org Validation
- Company Code Validation
- Cost Center Validation

## Governance Validation

- Access Governance
- Authorization Governance
- Reporting Consistency

---

# Future Enhancements

- User Access Dashboard
- Procurement Access Dashboard
- SoD Analytics
- Power BI User Governance Dashboard
