/*=============================================================
VALIDATION FRAMEWORK
Module : Cost Center Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Missing Cost Centers in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(itk.kostl, '-', itk.bukrs) AS cost_center_identifier,
    'ERROR' AS validation_status,
    'Cost Center missing in Ariba'
    AS error_message
FROM itk_cost_center itk
LEFT JOIN ariba_cost_center ar
    ON itk.kostl = ar.cost_center_id
   AND itk.bukrs = ar.company_code
WHERE ar.cost_center_id IS NULL;

---------------------------------------------------------------
-- 2. Extra Cost Centers in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(ar.cost_center_id, '-', ar.company_code)
    AS cost_center_identifier,
    'ERROR' AS validation_status,
    'Extra Cost Center found in Ariba'
    AS error_message
FROM ariba_cost_center ar
LEFT JOIN itk_cost_center itk
    ON ar.cost_center_id = itk.kostl
   AND ar.company_code = itk.bukrs
WHERE itk.kostl IS NULL;

---------------------------------------------------------------
-- 3. Long Text Mapping Validation
---------------------------------------------------------------

SELECT
    CONCAT(itk.kostl, '-', itk.bukrs) AS cost_center_identifier,
    'ERROR' AS validation_status,
    CONCAT(
        'Text mismatch | ITK LTEXT: ',
        itk.ltext,
        ' | Ariba KTEXT: ',
        ar.ktext
    ) AS error_message
FROM itk_cost_center itk
JOIN ariba_cost_center ar
    ON itk.kostl = ar.cost_center_id
   AND itk.bukrs = ar.company_code
WHERE ISNULL(itk.ltext, '')
   <> ISNULL(ar.ktext, '');

---------------------------------------------------------------
-- 4. Currency Validation
---------------------------------------------------------------

SELECT
    CONCAT(itk.kostl, '-', itk.bukrs) AS cost_center_identifier,
    'ERROR' AS validation_status,
    CONCAT(
        'Currency mismatch | ITK: ',
        itk.waers,
        ' | Ariba: ',
        ar.currency_code
    ) AS error_message
FROM itk_cost_center itk
JOIN ariba_cost_center ar
    ON itk.kostl = ar.cost_center_id
   AND itk.bukrs = ar.company_code
WHERE ISNULL(itk.waers, '')
   <> ISNULL(ar.currency_code, '');

---------------------------------------------------------------
-- 5. Service Area Validation
---------------------------------------------------------------

SELECT
    CONCAT(itk.kostl, '-', itk.bukrs) AS cost_center_identifier,
    'WARNING' AS validation_status,
    'Service Area missing'
    AS error_message
FROM itk_cost_center itk
WHERE itk.cus_service_area IS NULL
   OR TRIM(itk.cus_service_area) = '';

---------------------------------------------------------------
-- 6. Duplicate Cost Centers in ITK
---------------------------------------------------------------

SELECT
    CONCAT(kostl, '-', bukrs) AS cost_center_identifier,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Cost Center found in ITK'
    AS error_message
FROM itk_cost_center
GROUP BY kostl, bukrs
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 7. Duplicate Cost Centers in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(cost_center_id, '-', company_code)
    AS cost_center_identifier,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Cost Center found in Ariba'
    AS error_message
FROM ariba_cost_center
GROUP BY cost_center_id, company_code
HAVING COUNT(*) > 1;
