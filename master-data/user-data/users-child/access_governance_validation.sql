/*=============================================================
ACCESS GOVERNANCE VALIDATION
Module : Users Child Validation
=============================================================*/

---------------------------------------------------------------
-- Blank Purchase Org
---------------------------------------------------------------

SELECT
ariba_id,
'ERROR' AS validation_status,
'Purchase Org is blank'
AS error_message
FROM itk_users_child
WHERE purchase_org IS NULL
OR LTRIM(RTRIM(purchase_org))='';

---------------------------------------------------------------
-- Blank Company Code
---------------------------------------------------------------

SELECT
ariba_id,
'ERROR' AS validation_status,
'Company Code is blank'
AS error_message
FROM itk_users_child
WHERE company_code IS NULL
OR LTRIM(RTRIM(company_code))='';

---------------------------------------------------------------
-- Blank Cost Center
---------------------------------------------------------------

SELECT
ariba_id,
'ERROR' AS validation_status,
'Cost Center is blank'
AS error_message
FROM itk_users_child
WHERE cost_center IS NULL
OR LTRIM(RTRIM(cost_center))='';

---------------------------------------------------------------
-- Blank Plant
---------------------------------------------------------------

SELECT
ariba_id,
'ERROR' AS validation_status,
'Plant is blank'
AS error_message
FROM itk_users_child
WHERE plant IS NULL
OR LTRIM(RTRIM(plant))='';

---------------------------------------------------------------
-- Duplicate User
---------------------------------------------------------------

SELECT
ariba_id,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate User Found'
AS error_message
FROM itk_users_child
GROUP BY ariba_id
HAVING COUNT(*) > 1;
