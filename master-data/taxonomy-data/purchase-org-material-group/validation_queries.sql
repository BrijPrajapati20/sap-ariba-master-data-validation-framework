/*=========================================================
VALIDATION FRAMEWORK
Module : Purchase Org Material Group
=========================================================*/

---

## -- Missing in Ariba

SELECT
itk.uniq_name,
'ERROR' AS validation_status,
'Combination missing in Ariba'
AS error_message
FROM itk_purchase_org_material_group itk
LEFT JOIN ariba_purchase_org_material_group ar
ON itk.uniq_name = ar.unique_name
WHERE ar.unique_name IS NULL;

---

## -- Extra in Ariba

SELECT
ar.unique_name,
'ERROR' AS validation_status,
'Extra Combination found in Ariba'
AS error_message
FROM ariba_purchase_org_material_group ar
LEFT JOIN itk_purchase_org_material_group itk
ON ar.unique_name = itk.uniq_name
WHERE itk.uniq_name IS NULL;

---

## -- Duplicate in ITK

SELECT
uniq_name,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate Combination found in ITK'
AS error_message
FROM itk_purchase_org_material_group
GROUP BY uniq_name
HAVING COUNT(*) > 1;

---

## -- Duplicate in Ariba

SELECT
unique_name,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate Combination found in Ariba'
AS error_message
FROM ariba_purchase_org_material_group
GROUP BY unique_name
HAVING COUNT(*) > 1;

---

## -- Blank Combination Validation

SELECT
uniq_name,
'ERROR' AS validation_status,
'Combination is NULL or Blank'
AS error_message
FROM itk_purchase_org_material_group
WHERE uniq_name IS NULL
OR LTRIM(RTRIM(uniq_name)) = '';
