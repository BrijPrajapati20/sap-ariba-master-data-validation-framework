/*=============================================================
CONSOLIDATED REPORT
Module : Users Parent Validation
=============================================================*/

SELECT * FROM (

SELECT
ariba_id,
'Missing In Ariba'
FROM itk_users_parent itk
LEFT JOIN ariba_users_parent ar
ON itk.ariba_id = ar.ariba_id
WHERE ar.ariba_id IS NULL

UNION ALL

SELECT
ariba_id,
'Extra In Ariba'
FROM ariba_users_parent ar
LEFT JOIN itk_users_parent itk
ON ar.ariba_id = itk.ariba_id
WHERE itk.ariba_id IS NULL

UNION ALL

SELECT
ariba_id,
'Duplicate User'
FROM itk_users_parent
GROUP BY ariba_id
HAVING COUNT(*) > 1

) users_parent_validation_report;
