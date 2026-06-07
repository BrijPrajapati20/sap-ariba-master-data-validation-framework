/*=============================================================
CONSOLIDATED REPORT
Module : Users Child Validation
=============================================================*/

SELECT * FROM (

SELECT
ariba_id,
'Missing In Ariba'
FROM itk_users_child itk
LEFT JOIN ariba_users_child ar
ON itk.ariba_id = ar.ariba_id
WHERE ar.ariba_id IS NULL

UNION ALL

SELECT
ariba_id,
'Duplicate User'
FROM itk_users_child
GROUP BY ariba_id
HAVING COUNT(*) > 1

UNION ALL

SELECT
ariba_id,
'Purchase Org Mismatch'
FROM itk_users_child itk
JOIN ariba_users_child ar
ON itk.ariba_id = ar.ariba_id
WHERE ISNULL(itk.purchase_org,'')
<> ISNULL(ar.purchase_org,'')

) users_child_validation_report;
