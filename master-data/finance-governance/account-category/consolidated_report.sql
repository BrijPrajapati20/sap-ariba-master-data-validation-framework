/*=============================================================
CONSOLIDATED REPORT
Module : Account Category Validation
=============================================================*/

SELECT * FROM (

SELECT
account_category_code,
'Missing In Ariba'
FROM itk_account_category itk
LEFT JOIN ariba_account_category ar
ON itk.account_category_code = ar.account_category_code
WHERE ar.account_category_code IS NULL

UNION ALL

SELECT
account_category_code,
'Extra In Ariba'
FROM ariba_account_category ar
LEFT JOIN itk_account_category itk
ON ar.account_category_code = itk.account_category_code
WHERE itk.account_category_code IS NULL

UNION ALL

SELECT
account_category_code,
'Duplicate Category'
FROM itk_account_category
GROUP BY account_category_code
HAVING COUNT(*) > 1

) account_category_validation_report;
