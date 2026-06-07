/*=============================================================
CONSOLIDATED REPORT
Module : Relation Entry MG Subcategory
=============================================================*/

SELECT * FROM (

SELECT
CONCAT(itk.right_key1,' | ',itk.left_key1),
'Missing In Ariba'
FROM itk_relation_entry_mg_subcategory itk
LEFT JOIN ariba_relation_entry_mg_subcategory ar
ON itk.right_key1 = ar.right_key1
AND itk.left_key1 = ar.left_key1
WHERE ar.right_key1 IS NULL

UNION ALL

SELECT
CONCAT(ar.right_key1,' | ',ar.left_key1),
'Extra In Ariba'
FROM ariba_relation_entry_mg_subcategory ar
LEFT JOIN itk_relation_entry_mg_subcategory itk
ON ar.right_key1 = itk.right_key1
AND ar.left_key1 = itk.left_key1
WHERE itk.right_key1 IS NULL

UNION ALL

SELECT
CONCAT(right_key1,' | ',left_key1),
'Duplicate Relationship'
FROM itk_relation_entry_mg_subcategory
GROUP BY right_key1,left_key1
HAVING COUNT(*) > 1

) relation_entry_mg_subcategory_validation_report;
