/*=============================================================
VALIDATION FRAMEWORK
Module : Account Category Validation
=============================================================*/

---------------------------------------------------------------
-- Missing In Ariba
---------------------------------------------------------------

SELECT
itk.account_category_code,
'ERROR' AS validation_status,
'Account Category Missing In Ariba'
AS error_message
FROM itk_account_category itk
LEFT JOIN ariba_account_category ar
ON itk.account_category_code = ar.account_category_code
WHERE ar.account_category_code IS NULL;

---------------------------------------------------------------
-- Extra In Ariba
---------------------------------------------------------------

SELECT
ar.account_category_code,
'ERROR' AS validation_status,
'Extra Account Category Found In Ariba'
AS error_message
FROM ariba_account_category ar
LEFT JOIN itk_account_category itk
ON ar.account_category_code = itk.account_category_code
WHERE itk.account_category_code IS NULL;

---------------------------------------------------------------
-- Description Mismatch
---------------------------------------------------------------

SELECT
itk.account_category_code,
'ERROR' AS validation_status,
CONCAT(
'Description mismatch | ITK:',
itk.account_category_description,
' | Ariba:',
ar.account_category_description
)
AS error_message
FROM itk_account_category itk
JOIN ariba_account_category ar
ON itk.account_category_code = ar.account_category_code
WHERE ISNULL(itk.account_category_description,'')
<> ISNULL(ar.account_category_description,'');

---------------------------------------------------------------
-- Duplicate Records In Ariba
---------------------------------------------------------------

SELECT
account_category_code,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate Account Category Found In Ariba'
AS error_message
FROM ariba_account_category
GROUP BY account_category_code
HAVING COUNT(*) > 1;
