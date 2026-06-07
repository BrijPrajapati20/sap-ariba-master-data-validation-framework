/*=============================================================
HIERARCHY VALIDATION
Module : Relation Entry MG Subcategory
=============================================================*/

---

## -- Blank Right Key Validation

SELECT
right_key1,
'ERROR' AS validation_status,
'Country Material Group mapping is blank'
AS error_message
FROM itk_relation_entry_mg_subcategory
WHERE right_key1 IS NULL
OR LTRIM(RTRIM(right_key1))='';

---

## -- Blank Left Key Validation

SELECT
left_key1,
'ERROR' AS validation_status,
'Material Group Subcategory is blank'
AS error_message
FROM itk_relation_entry_mg_subcategory
WHERE left_key1 IS NULL
OR LTRIM(RTRIM(left_key1))='';

---

## -- Duplicate Relationship Validation

SELECT
right_key1,
left_key1,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate hierarchy relationship found'
AS error_message
FROM itk_relation_entry_mg_subcategory
GROUP BY right_key1,left_key1
HAVING COUNT(*) > 1;
