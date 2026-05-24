/*=============================================================
VALIDATION FRAMEWORK
Module : Relation Entries - Plant Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Missing Relations in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(itk.left_id, '-', itk.right_id) AS relation_id,
    'ERROR' AS validation_status,
    'Plant relation missing in Ariba'
    AS error_message
FROM itk_relation_entries_plant itk
LEFT JOIN ariba_relation_entries_plant ar
    ON itk.left_id = ar.plant_id
   AND itk.right_id = ar.company_code
WHERE ar.plant_id IS NULL;

---------------------------------------------------------------
-- 2. Extra Relations in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(ar.plant_id, '-', ar.company_code) AS relation_id,
    'ERROR' AS validation_status,
    'Extra Plant relation found in Ariba'
    AS error_message
FROM ariba_relation_entries_plant ar
LEFT JOIN itk_relation_entries_plant itk
    ON ar.plant_id = itk.left_id
   AND ar.company_code = itk.right_id
WHERE itk.left_id IS NULL;

---------------------------------------------------------------
-- 3. Duplicate Relations in ITK
---------------------------------------------------------------

SELECT
    CONCAT(left_id, '-', right_id) AS relation_id,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Plant relation found in ITK'
    AS error_message
FROM itk_relation_entries_plant
GROUP BY left_id, right_id
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 4. Duplicate Relations in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(plant_id, '-', company_code) AS relation_id,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Plant relation found in Ariba'
    AS error_message
FROM ariba_relation_entries_plant
GROUP BY plant_id, company_code
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 5. NULL Plant Validation
---------------------------------------------------------------

SELECT
    left_id,
    'ERROR' AS validation_status,
    'Plant ID is NULL or Blank'
    AS error_message
FROM itk_relation_entries_plant
WHERE left_id IS NULL
   OR TRIM(left_id) = '';

---------------------------------------------------------------
-- 6. NULL Company Code Validation
---------------------------------------------------------------

SELECT
    right_id,
    'ERROR' AS validation_status,
    'Company Code is NULL or Blank'
    AS error_message
FROM itk_relation_entries_plant
WHERE right_id IS NULL
   OR TRIM(right_id) = '';

---------------------------------------------------------------
-- 7. DNU Validation
---------------------------------------------------------------

SELECT
    left_id,
    'WARNING' AS validation_status,
    'DNU record still exists in active dataset'
    AS error_message
FROM itk_relation_entries_plant
WHERE left_id IN (
    SELECT left_id
    FROM itk_relation_entries_plant_delete
);

---------------------------------------------------------------
-- 8. Relationship Integrity Validation
---------------------------------------------------------------

SELECT
    CONCAT(left_id, '-', right_id) AS relation_id,
    'WARNING' AS validation_status,
    'Plant should be mapped to valid Company Code'
    AS error_message
FROM itk_relation_entries_plant;
