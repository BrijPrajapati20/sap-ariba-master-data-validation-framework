/*=============================================================
VALIDATION FRAMEWORK
Module : Relation Entry MG Subcategory
=============================================================*/

---

## -- Missing In Ariba

SELECT
CONCAT(itk.right_key1,' | ',itk.left_key1) AS relationship_id,
'ERROR' AS validation_status,
'Relationship missing in Ariba'
AS error_message
FROM itk_relation_entry_mg_subcategory itk
LEFT JOIN ariba_relation_entry_mg_subcategory ar
ON itk.right_key1 = ar.right_key1
AND itk.left_key1 = ar.left_key1
WHERE ar.right_key1 IS NULL;

---

## -- Extra In Ariba

SELECT
CONCAT(ar.right_key1,' | ',ar.left_key1) AS relationship_id,
'ERROR' AS validation_status,
'Extra relationship found in Ariba'
AS error_message
FROM ariba_relation_entry_mg_subcategory ar
LEFT JOIN itk_relation_entry_mg_subcategory itk
ON ar.right_key1 = itk.right_key1
AND ar.left_key1 = itk.left_key1
WHERE itk.right_key1 IS NULL;

---

## -- RightId Mismatch

SELECT
itk.right_key1,
'ERROR' AS validation_status,
'RightId mismatch'
AS error_message
FROM itk_relation_entry_mg_subcategory itk
JOIN ariba_relation_entry_mg_subcategory ar
ON itk.right_key1 = ar.right_key1
WHERE ISNULL(itk.right_id,'')
<> ISNULL(ar.right_id,'');

---

## -- LeftId Mismatch

SELECT
itk.left_key1,
'ERROR' AS validation_status,
'LeftId mismatch'
AS error_message
FROM itk_relation_entry_mg_subcategory itk
JOIN ariba_relation_entry_mg_subcategory ar
ON itk.left_key1 = ar.left_key1
WHERE ISNULL(itk.left_id,'')
<> ISNULL(ar.left_id,'');
