/*=============================================================
CONSOLIDATED REPORT
Module : Account Category Field Status Combo Validation
=============================================================*/

SELECT * FROM (

SELECT
CONCAT(
company_code,'|',
field_status_group,'|',
account_category
),
'Missing In Ariba'
FROM itk_account_category_combo itk
LEFT JOIN ariba_account_category_combo ar
ON itk.company_code = ar.company_code
AND itk.field_status_group = ar.field_status_group
AND itk.account_category = ar.account_category
WHERE ar.company_code IS NULL

UNION ALL

SELECT
CONCAT(
company_code,'|',
field_status_group,'|',
account_category
),
'Duplicate Combination'
FROM itk_account_category_combo
GROUP BY
company_code,
field_status_group,
account_category
HAVING COUNT(*) > 1

) account_category_combo_validation_report;
