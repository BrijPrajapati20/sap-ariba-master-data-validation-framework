/*=============================================================
VALIDATION FRAMEWORK
Module : Account Category Field Status Combo Validation
=============================================================*/

---------------------------------------------------------------
-- Missing In Ariba
---------------------------------------------------------------

SELECT
CONCAT(
itk.company_code,'|',
itk.field_status_group,'|',
itk.account_category
) AS object_id,
'ERROR' AS validation_status,
'Combination Missing In Ariba'
AS error_message
FROM itk_account_category_combo itk
LEFT JOIN ariba_account_category_combo ar
ON itk.company_code = ar.company_code
AND itk.field_status_group = ar.field_status_group
AND itk.account_category = ar.account_category
WHERE ar.company_code IS NULL;

---------------------------------------------------------------
-- Extra In Ariba
---------------------------------------------------------------

SELECT
CONCAT(
ar.company_code,'|',
ar.field_status_group,'|',
ar.account_category
) AS object_id,
'ERROR' AS validation_status,
'Extra Combination Found In Ariba'
AS error_message
FROM ariba_account_category_combo ar
LEFT JOIN itk_account_category_combo itk
ON ar.company_code = itk.company_code
AND ar.field_status_group = itk.field_status_group
AND ar.account_category = itk.account_category
WHERE itk.company_code IS NULL;

---------------------------------------------------------------
-- Field Status Mismatch
---------------------------------------------------------------

SELECT
itk.company_code,
'ERROR' AS validation_status,
'Field Status Group mismatch'
AS error_message
FROM itk_account_category_combo itk
JOIN ariba_account_category_combo ar
ON itk.company_code = ar.company_code
AND itk.account_category = ar.account_category
WHERE ISNULL(itk.field_status_group,'')
<> ISNULL(ar.field_status_group,'');
