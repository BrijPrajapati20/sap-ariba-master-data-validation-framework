# Relation Entry MG Subcategory Validation

## Overview

This module validates Material Group Subcategory relationship mappings between SAP ITK Extract and SAP Ariba Export.

The objective is to ensure Country + Material Group combinations are correctly linked with Material Group Subcategories.

---

# Business Purpose

This relationship drives:

* Category hierarchy
* Guided Buying taxonomy
* Commodity classification
* Spend reporting
* Sourcing analytics
* Procurement governance

---

# Validation Scope

| ITK Field | Description                | Validation Required |
| --------- | -------------------------- | ------------------- |
| RightKey1 | Country + Material Group   | Yes                 |
| LeftKey1  | Material Group Subcategory | Yes                 |
| LeftId    | Material Group Subcategory | Yes                 |
| RightId   | Country + Material Group   | Yes                 |

---

# Validation Coverage

* Missing Records
* Extra Records
* Duplicate Records
* Blank Records
* Relationship Integrity
* Hierarchy Validation
* Taxonomy Governance
* Reporting Consistency

---

# Future Enhancements

* Category Hierarchy Dashboard
* Taxonomy Analytics
* Spend Classification Analytics
* Power BI Governance Dashboard
