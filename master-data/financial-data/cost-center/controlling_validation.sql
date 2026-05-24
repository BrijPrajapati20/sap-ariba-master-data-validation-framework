/*=============================================================
CONTROLLING VALIDATION
Module : Cost Center Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Missing Service Area
---------------------------------------------------------------

SELECT
    kostl,
    bukrs,
    'WARNING' AS validation_status,
    'Service Area is missing'
    AS error_message
FROM itk_cost_center
WHERE cus_service_area IS NULL
   OR TRIM(cus_service_area) = '';

---------------------------------------------------------------
-- 2. Missing Service Line
---------------------------------------------------------------

SELECT
    kostl,
    bukrs,
    'WARNING' AS validation_status,
    'Service Line is missing'
    AS error_message
FROM itk_cost_center
WHERE cus_service_line IS NULL
   OR TRIM(cus_service_line) = '';

---------------------------------------------------------------
-- 3. Missing Responsible User
---------------------------------------------------------------

SELECT
    kostl,
    bukrs,
    'WARNING' AS validation_status,
    'Responsible User is missing'
    AS error_message
FROM itk_cost_center
WHERE verak_user IS NULL
   OR TRIM(verak_user) = '';

---------------------------------------------------------------
-- 4. Invalid Currency Length
---------------------------------------------------------------

SELECT
    kostl,
    waers,
    'ERROR' AS validation_status,
    'Invalid Currency Code'
    AS error_message
FROM itk_cost_center
WHERE LEN(waers) <> 3;

---------------------------------------------------------------
-- 5. Blank Long Text Validation
---------------------------------------------------------------

SELECT
    kostl,
    bukrs,
    'WARNING' AS validation_status,
    'Long Text Description is blank'
    AS error_message
FROM itk_cost_center
WHERE ltext IS NULL
   OR TRIM(ltext) = '';
