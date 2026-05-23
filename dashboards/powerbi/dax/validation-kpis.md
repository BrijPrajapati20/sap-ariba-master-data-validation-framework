# Power BI DAX Calculations

## Validation Accuracy %

```DAX
Validation Accuracy % =
DIVIDE(
    SUM(validation_audit_log[passed_records]),
    SUM(validation_audit_log[total_records])
) * 100
```

---

## Failed Records

```DAX
Failed Records =
SUM(validation_audit_log[failed_records])
```

---

## Duplicate Records

```DAX
Duplicate Records =
CALCULATE(
    COUNTROWS(validation_error_report),
    validation_error_report[validation_type] = "Duplicate"
)
```

---

## Missing Records

```DAX
Missing Records =
CALCULATE(
    COUNTROWS(validation_error_report),
    validation_error_report[validation_type] = "Missing"
)
```
