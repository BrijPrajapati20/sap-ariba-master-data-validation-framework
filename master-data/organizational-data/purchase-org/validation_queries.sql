/*=============================================================
VALIDATION FRAMEWORK
Module : Purchase Organization Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Missing Records in Ariba
---------------------------------------------------------------

SELECT
    itk.ekorg AS purchase_org_id,
    'ERROR' AS validation_status,
    'Missing Purchase Organization in Ariba' AS error_message
FROM itk_purchase_org itk
LEFT JOIN ariba_purchase_org ar
    ON itk.ekorg = ar.purchase_org_id
WHERE ar.purchase_org_id IS NULL;

---------------------------------------------------------------
-- 2. Extra Records in Ariba
---------------------------------------------------------------

SELECT
    ar.purchase_org_id,
    'ERROR' AS validation_status,
    'Extra Purchase Organization found in Ariba' AS error_message
FROM ariba_purchase_org ar
LEFT JOIN itk_purchase_org itk
    ON ar.purchase_org_id = itk.ekorg
WHERE itk.ekorg IS NULL;

---------------------------------------------------------------
-- 3. Purchase Organization Name Mismatch
---------------------------------------------------------------

SELECT
    itk.ekorg,
    'ERROR' AS validation_status,
    CONCAT(
        'Purchase Organization Name mismatch | ITK: ',
        itk.ekotx,
        ' | Ariba: ',
        ar.description
    ) AS error_message
FROM itk_purchase_org itk
JOIN ariba_purchase_org ar
    ON itk.ekorg = ar.purchase_org_id
WHERE ISNULL(itk.ekotx, '') <> ISNULL(ar.description, '');

---------------------------------------------------------------
-- 4. Duplicate Records in ITK
---------------------------------------------------------------

SELECT
    ekorg,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Purchase Organization in ITK' AS error_message
FROM itk_purchase_org
GROUP BY ekorg
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 5. Duplicate Records in Ariba
---------------------------------------------------------------

SELECT
    purchase_org_id,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Purchase Organization in Ariba' AS error_message
FROM ariba_purchase_org
GROUP BY purchase_org_id
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 6. NULL or Blank Purchase Organization ID
---------------------------------------------------------------

SELECT
    ekorg,
    'ERROR' AS validation_status,
    'Blank or NULL Purchase Organization ID in ITK' AS error_message
FROM itk_purchase_org
WHERE ekorg IS NULL
   OR TRIM(ekorg) = '';

---------------------------------------------------------------
-- 7. Invalid Purchase Organization Length
---------------------------------------------------------------

SELECT
    ekorg,
    'ERROR' AS validation_status,
    'Invalid Purchase Organization Length' AS error_message
FROM itk_purchase_org
WHERE LEN(ekorg) <> 4;

---------------------------------------------------------------
-- 8. Special Character Validation
---------------------------------------------------------------

SELECT
    ekorg,
    'ERROR' AS validation_status,
    'Special characters found in Purchase Organization Name' AS error_message
FROM itk_purchase_org
WHERE ekotx LIKE '%[^a-zA-Z0-9 ]%';
