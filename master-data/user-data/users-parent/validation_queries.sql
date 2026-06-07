/*=============================================================
VALIDATION FRAMEWORK
Module : Users Parent Validation
=============================================================*/

---------------------------------------------------------------
-- Missing In Ariba
---------------------------------------------------------------

SELECT
itk.ariba_id,
'ERROR' AS validation_status,
'User Missing In Ariba'
AS error_message
FROM itk_users_parent itk
LEFT JOIN ariba_users_parent ar
ON itk.ariba_id = ar.ariba_id
WHERE ar.ariba_id IS NULL;

---------------------------------------------------------------
-- Extra In Ariba
---------------------------------------------------------------

SELECT
ar.ariba_id,
'ERROR' AS validation_status,
'Extra User Found In Ariba'
AS error_message
FROM ariba_users_parent ar
LEFT JOIN itk_users_parent itk
ON ar.ariba_id = itk.ariba_id
WHERE itk.ariba_id IS NULL;

---------------------------------------------------------------
-- Email Mismatch
---------------------------------------------------------------

SELECT
itk.ariba_id,
'ERROR' AS validation_status,
CONCAT(
'Email mismatch | ITK:',
itk.email_address,
' | Ariba:',
ar.email_address
)
AS error_message
FROM itk_users_parent itk
JOIN ariba_users_parent ar
ON itk.ariba_id = ar.ariba_id
WHERE ISNULL(itk.email_address,'')
<> ISNULL(ar.email_address,'');

---------------------------------------------------------------
-- Role Mismatch
---------------------------------------------------------------

SELECT
itk.ariba_id,
'ERROR' AS validation_status,
'Role Mismatch'
AS error_message
FROM itk_users_parent itk
JOIN ariba_users_parent ar
ON itk.ariba_id = ar.ariba_id
WHERE ISNULL(itk.role_name,'')
<> ISNULL(ar.role_name,'');
