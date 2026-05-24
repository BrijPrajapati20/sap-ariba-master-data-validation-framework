/*=============================================================
VALIDATION FRAMEWORK
Module : Purchase Group Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Missing Purchase Groups in Ariba
---------------------------------------------------------------

SELECT
    itk.ekgrp AS purchase_group_id,
    'ERROR' AS validation_status,
    'Missing Purchase Group in Ariba' AS error_message
FROM itk_purchase_group itk
LEFT JOIN ariba_purchase_group ar
    ON itk.ekgrp = ar.purchase_group_id
WHERE ar.purchase_group_id IS NULL;

---------------------------------------------------------------
-- 2. Extra Purchase Groups in Ariba
---------------------------------------------------------------

SELECT
    ar.purchase_group_id,
    'ERROR' AS validation_status,
    'Extra Purchase Group found in Ariba' AS error_message
FROM ariba_purchase_group ar
LEFT JOIN itk_purchase_group itk
    ON ar.purchase_group_id = itk.ekgrp
WHERE itk.ekgrp IS NULL;

---------------------------------------------------------------
-- 3. Purchase Group Name Mismatch
---------------------------------------------------------------

SELECT
    itk.ekgrp,
    'ERROR' AS validation_status,
    CONCAT(
        'Purchase Group Name mismatch | ITK: ',
        itk.eknam,
        ' | Ariba: ',
        ar.purchase_group_name
    ) AS error_message
FROM itk_purchase_group itk
JOIN ariba_purchase_group ar
    ON itk.ekgrp = ar.purchase_group_id
WHERE ISNULL(itk.eknam, '')
   <> ISNULL(ar.purchase_group_name, '');

---------------------------------------------------------------
-- 4. Duplicate Purchase Groups in ITK
---------------------------------------------------------------

SELECT
    ekgrp,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Purchase Group found in ITK' AS error_message
FROM itk_purchase_group
GROUP BY ekgrp
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 5. Duplicate Purchase Groups in Ariba
---------------------------------------------------------------

SELECT
    purchase_group_id,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Purchase Group found in Ariba' AS error_message
FROM ariba_purchase_group
GROUP BY purchase_group_id
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 6. NULL Purchase Group Validation
---------------------------------------------------------------

SELECT
    ekgrp,
    'ERROR' AS validation_status,
    'NULL or Blank Purchase Group ID' AS error_message
FROM itk_purchase_group
WHERE ekgrp IS NULL
   OR TRIM(ekgrp) = '';

---------------------------------------------------------------
-- 7. Invalid Purchase Group Length
---------------------------------------------------------------

SELECT
    ekgrp,
    'ERROR' AS validation_status,
    'Invalid Purchase Group Length' AS error_message
FROM itk_purchase_group
WHERE LEN(ekgrp) <> 3;

---------------------------------------------------------------
-- 8. Global Consistency Validation
---------------------------------------------------------------

SELECT
    ekgrp,
    'WARNING' AS validation_status,
    'Purchase Group should remain globally consistent across regions'
    AS error_message
FROM itk_purchase_group
GROUP BY ekgrp
HAVING COUNT(DISTINCT eknam) > 1;
