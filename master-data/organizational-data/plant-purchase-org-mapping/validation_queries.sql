/*=============================================================
VALIDATION FRAMEWORK
Module : Plant to Purchase Organization Mapping Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Missing Plant-Purchase Org Mapping in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(itk.werks, '-', itk.ekorg) AS mapping_id,
    'ERROR' AS validation_status,
    'Plant to Purchase Org mapping missing in Ariba'
    AS error_message
FROM itk_plant_purchase_org itk
LEFT JOIN ariba_plant_purchase_org ar
    ON itk.werks = ar.plant_id
   AND itk.ekorg = ar.purchase_org_id
WHERE ar.plant_id IS NULL;

---------------------------------------------------------------
-- 2. Extra Mapping in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(ar.plant_id, '-', ar.purchase_org_id) AS mapping_id,
    'ERROR' AS validation_status,
    'Extra Plant to Purchase Org mapping found in Ariba'
    AS error_message
FROM ariba_plant_purchase_org ar
LEFT JOIN itk_plant_purchase_org itk
    ON ar.plant_id = itk.werks
   AND ar.purchase_org_id = itk.ekorg
WHERE itk.werks IS NULL;

---------------------------------------------------------------
-- 3. Duplicate Mapping in ITK
---------------------------------------------------------------

SELECT
    CONCAT(werks, '-', ekorg) AS mapping_id,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Plant to Purchase Org mapping in ITK'
    AS error_message
FROM itk_plant_purchase_org
GROUP BY werks, ekorg
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 4. Duplicate Mapping in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(plant_id, '-', purchase_org_id) AS mapping_id,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Plant to Purchase Org mapping in Ariba'
    AS error_message
FROM ariba_plant_purchase_org
GROUP BY plant_id, purchase_org_id
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 5. NULL Plant Validation
---------------------------------------------------------------

SELECT
    werks,
    'ERROR' AS validation_status,
    'Plant ID is NULL or Blank'
    AS error_message
FROM itk_plant_purchase_org
WHERE werks IS NULL
   OR TRIM(werks) = '';

---------------------------------------------------------------
-- 6. NULL Purchase Org Validation
---------------------------------------------------------------

SELECT
    ekorg,
    'ERROR' AS validation_status,
    'Purchase Organization is NULL or Blank'
    AS error_message
FROM itk_plant_purchase_org
WHERE ekorg IS NULL
   OR TRIM(ekorg) = '';

---------------------------------------------------------------
-- 7. Invalid Plant Length
---------------------------------------------------------------

SELECT
    werks,
    'ERROR' AS validation_status,
    'Invalid Plant ID Length'
    AS error_message
FROM itk_plant_purchase_org
WHERE LEN(werks) <> 4;

---------------------------------------------------------------
-- 8. Invalid Purchase Org Length
---------------------------------------------------------------

SELECT
    ekorg,
    'ERROR' AS validation_status,
    'Invalid Purchase Organization Length'
    AS error_message
FROM itk_plant_purchase_org
WHERE LEN(ekorg) <> 4;

---------------------------------------------------------------
-- 9. Relationship Integrity Validation
---------------------------------------------------------------

SELECT
    CONCAT(werks, '-', ekorg) AS mapping_id,
    'WARNING' AS validation_status,
    'Plant should be associated with valid Purchase Organization'
    AS error_message
FROM itk_plant_purchase_org;
