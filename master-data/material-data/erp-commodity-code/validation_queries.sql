/*=============================================================
VALIDATION FRAMEWORK
Module : ERP Commodity Code Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Missing Material Groups in Ariba
---------------------------------------------------------------

SELECT
    itk.matkl AS material_group_id,
    'ERROR' AS validation_status,
    'Material Group missing in Ariba'
    AS error_message
FROM itk_erp_commodity_code itk
LEFT JOIN ariba_erp_commodity_code ar
    ON itk.matkl = ar.material_group_id
WHERE ar.material_group_id IS NULL;

---------------------------------------------------------------
-- 2. Extra Material Groups in Ariba
---------------------------------------------------------------

SELECT
    ar.material_group_id,
    'ERROR' AS validation_status,
    'Extra Material Group found in Ariba'
    AS error_message
FROM ariba_erp_commodity_code ar
LEFT JOIN itk_erp_commodity_code itk
    ON ar.material_group_id = itk.matkl
WHERE itk.matkl IS NULL;

---------------------------------------------------------------
-- 3. Material Group Description Mismatch
---------------------------------------------------------------

SELECT
    itk.matkl,
    'ERROR' AS validation_status,
    CONCAT(
        'Material Group Description mismatch | ITK: ',
        itk.wgbez,
        ' | Ariba: ',
        ar.material_group_description
    ) AS error_message
FROM itk_erp_commodity_code itk
JOIN ariba_erp_commodity_code ar
    ON itk.matkl = ar.material_group_id
WHERE ISNULL(itk.wgbez, '')
   <> ISNULL(ar.material_group_description, '');

---------------------------------------------------------------
-- 4. Duplicate Material Groups in ITK
---------------------------------------------------------------

SELECT
    matkl,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Material Group found in ITK'
    AS error_message
FROM itk_erp_commodity_code
GROUP BY matkl
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 5. Duplicate Material Groups in Ariba
---------------------------------------------------------------

SELECT
    material_group_id,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Material Group found in Ariba'
    AS error_message
FROM ariba_erp_commodity_code
GROUP BY material_group_id
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 6. NULL Material Group Validation
---------------------------------------------------------------

SELECT
    matkl,
    'ERROR' AS validation_status,
    'Material Group ID is NULL or Blank'
    AS error_message
FROM itk_erp_commodity_code
WHERE matkl IS NULL
   OR TRIM(matkl) = '';

---------------------------------------------------------------
-- 7. NULL Description Validation
---------------------------------------------------------------

SELECT
    matkl,
    'ERROR' AS validation_status,
    'Material Group Description is NULL or Blank'
    AS error_message
FROM itk_erp_commodity_code
WHERE wgbez IS NULL
   OR TRIM(wgbez) = '';
