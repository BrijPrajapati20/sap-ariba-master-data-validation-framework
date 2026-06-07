/*=============================================================
GOVERNANCE VALIDATION
Module : Account Category Field Status Combo Validation
=============================================================*/

---------------------------------------------------------------
-- Blank Company Code
---------------------------------------------------------------

SELECT
company_code,
'ERROR' AS validation_status,
'Company Code is blank'
AS error_message
FROM itk_account_category_combo
WHERE company_code IS NULL
OR LTRIM(RTRIM(company_code))='';

---------------------------------------------------------------
-- Blank Field Status Group
---------------------------------------------------------------

SELECT
company_code,
'ERROR' AS validation_status,
'Field Status Group is blank'
AS error_message
FROM itk_account_category_combo
WHERE field_status_group IS NULL
OR LTRIM(RTRIM(field_status_group))='';

---------------------------------------------------------------
-- Blank Account Category
---------------------------------------------------------------

SELECT
company_code,
'ERROR' AS validation_status,
'Account Assignment Category is blank'
AS error_message
FROM itk_account_category_combo
WHERE account_category IS NULL
OR LTRIM(RTRIM(account_category))='';

---------------------------------------------------------------
-- Duplicate Combination
---------------------------------------------------------------

SELECT
company_code,
field_status_group,
account_category,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate Combination Found'
AS error_message
FROM itk_account_category_combo
GROUP BY
company_code,
field_status_group,
account_category
HAVING COUNT(*) > 1;
