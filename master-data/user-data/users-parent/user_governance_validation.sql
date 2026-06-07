/*=============================================================
USER GOVERNANCE VALIDATION
Module : Users Parent Validation
=============================================================*/

---------------------------------------------------------------
-- Blank Ariba ID
---------------------------------------------------------------

SELECT
ariba_id,
'ERROR' AS validation_status,
'Ariba ID is blank'
AS error_message
FROM itk_users_parent
WHERE ariba_id IS NULL
OR LTRIM(RTRIM(ariba_id))='';

---------------------------------------------------------------
-- Blank Email
---------------------------------------------------------------

SELECT
ariba_id,
'ERROR' AS validation_status,
'Email Address is blank'
AS error_message
FROM itk_users_parent
WHERE email_address IS NULL
OR LTRIM(RTRIM(email_address))='';

---------------------------------------------------------------
-- Invalid Email Format
---------------------------------------------------------------

SELECT
ariba_id,
email_address,
'ERROR' AS validation_status,
'Invalid Email Format'
AS error_message
FROM itk_users_parent
WHERE email_address NOT LIKE '%@%.%';

---------------------------------------------------------------
-- Duplicate User
---------------------------------------------------------------

SELECT
ariba_id,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate User Found'
AS error_message
FROM itk_users_parent
GROUP BY ariba_id
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- Duplicate Personnel ID
---------------------------------------------------------------

SELECT
personnel_id,
COUNT(*) AS duplicate_count,
'WARNING' AS validation_status,
'Duplicate Personnel ID Found'
AS error_message
FROM itk_users_parent
GROUP BY personnel_id
HAVING COUNT(*) > 1;
