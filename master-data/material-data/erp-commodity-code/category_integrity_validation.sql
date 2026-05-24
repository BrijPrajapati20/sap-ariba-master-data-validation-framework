/*=============================================================
CATEGORY INTEGRITY VALIDATION
Module : ERP Commodity Code Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Blank Material Group Description
---------------------------------------------------------------

SELECT
    matkl,
    'ERROR' AS validation_status,
    'Material Group Description is blank'
    AS error_message
FROM itk_erp_commodity_code
WHERE wgbez IS NULL
   OR TRIM(wgbez) = '';

---------------------------------------------------------------
-- 2. Invalid Material Group Length
---------------------------------------------------------------

SELECT
    matkl,
    'ERROR' AS validation_status,
    'Invalid Material Group Length'
    AS error_message
FROM itk_erp_commodity_code
WHERE LEN(matkl) < 2;

---------------------------------------------------------------
-- 3. Duplicate Material Group Description
---------------------------------------------------------------

SELECT
    wgbez,
    COUNT(*) AS duplicate_count,
    'WARNING' AS validation_status,
    'Duplicate Material Group Description detected'
    AS error_message
FROM itk_erp_commodity_code
GROUP BY wgbez
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 4. Special Character Validation
---------------------------------------------------------------

SELECT
    matkl,
    'WARNING' AS validation_status,
    'Material Group contains special characters'
    AS error_message
FROM itk_erp_commodity_code
WHERE matkl LIKE '%[^A-Za-z0-9]%';
