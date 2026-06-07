/*=============================================================
GOVERNANCE VALIDATION
Module : Account Category Validation
=============================================================*/

---------------------------------------------------------------
-- Blank Category Code
---------------------------------------------------------------

SELECT
account_category_code,
'ERROR' AS validation_status,
'Account Category Code is blank'
AS error_message
FROM itk_account_category
WHERE account_category_code IS NULL
OR LTRIM(RTRIM(account_category_code))='';

---------------------------------------------------------------
-- Blank Category Description
---------------------------------------------------------------

SELECT
account_category_code,
'ERROR' AS validation_status,
'Account Category Description is blank'
AS error_message
FROM itk_account_category
WHERE account_category_description IS NULL
OR LTRIM(RTRIM(account_category_description))='';

---------------------------------------------------------------
-- Duplicate Category Code
---------------------------------------------------------------

SELECT
account_category_code,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate Account Category Found'
AS error_message
FROM itk_account_category
GROUP BY account_category_code
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- Duplicate Description
---------------------------------------------------------------

SELECT
account_category_description,
COUNT(*) AS duplicate_count,
'WARNING' AS validation_status,
'Duplicate Account Category Description Found'
AS error_message
FROM itk_account_category
GROUP BY account_category_description
HAVING COUNT(*) > 1;
