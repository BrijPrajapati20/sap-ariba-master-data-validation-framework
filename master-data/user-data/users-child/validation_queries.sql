/*=============================================================
VALIDATION FRAMEWORK
Module : Users Child Validation
=============================================================*/

---------------------------------------------------------------
-- Missing User In Ariba
---------------------------------------------------------------

SELECT
itk.ariba_id,
'ERROR' AS validation_status,
'User Missing In Ariba'
AS error_message
FROM itk_users_child itk
LEFT JOIN ariba_users_child ar
ON itk.ariba_id = ar.ariba_id
WHERE ar.ariba_id IS NULL;

---------------------------------------------------------------
-- Purchase Org Mismatch
---------------------------------------------------------------

SELECT
itk.ariba_id,
'ERROR' AS validation_status,
CONCAT(
'Purchase Org mismatch | ITK:',
itk.purchase_org,
' | Ariba:',
ar.purchase_org
)
AS error_message
FROM itk_users_child itk
JOIN ariba_users_child ar
ON itk.ariba_id = ar.ariba_id
WHERE ISNULL(itk.purchase_org,'')
<> ISNULL(ar.purchase_org,'');

---------------------------------------------------------------
-- Company Code Mismatch
---------------------------------------------------------------

SELECT
itk.ariba_id,
'ERROR' AS validation_status,
CONCAT(
'Company Code mismatch | ITK:',
itk.company_code,
' | Ariba:',
ar.company_code
)
AS error_message
FROM itk_users_child itk
JOIN ariba_users_child ar
ON itk.ariba_id = ar.ariba_id
WHERE ISNULL(itk.company_code,'')
<> ISNULL(ar.company_code,'');

---------------------------------------------------------------
-- Cost Center Mismatch
---------------------------------------------------------------

SELECT
itk.ariba_id,
'ERROR' AS validation_status,
CONCAT(
'Cost Center mismatch | ITK:',
itk.cost_center,
' | Ariba:',
ar.cost_center
)
AS error_message
FROM itk_users_child itk
JOIN ariba_users_child ar
ON itk.ariba_id = ar.ariba_id
WHERE ISNULL(itk.cost_center,'')
<> ISNULL(ar.cost_center,'');
