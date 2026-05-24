/*=============================================================
VALIDATION FRAMEWORK
Module : Company Code Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Missing Company Codes in Ariba
---------------------------------------------------------------

SELECT
    itk.bukrs AS company_code,
    'ERROR' AS validation_status,
    'Missing Company Code in Ariba' AS error_message
FROM itk_company_code itk
LEFT JOIN ariba_company_code ar
    ON itk.bukrs = ar.company_code_id
WHERE ar.company_code_id IS NULL;

---------------------------------------------------------------
-- 2. Extra Company Codes in Ariba
---------------------------------------------------------------

SELECT
    ar.company_code_id,
    'ERROR' AS validation_status,
    'Extra Company Code found in Ariba' AS error_message
FROM ariba_company_code ar
LEFT JOIN itk_company_code itk
    ON ar.company_code_id = itk.bukrs
WHERE itk.bukrs IS NULL;

---------------------------------------------------------------
-- 3. Company Name Mismatch
---------------------------------------------------------------

SELECT
    itk.bukrs,
    'ERROR' AS validation_status,
    CONCAT(
        'Company Name mismatch | ITK: ',
        itk.butxt,
        ' | Ariba: ',
        ar.company_name
    ) AS error_message
FROM itk_company_code itk
JOIN ariba_company_code ar
    ON itk.bukrs = ar.company_code_id
WHERE ISNULL(itk.butxt, '')
   <> ISNULL(ar.company_name, '');

---------------------------------------------------------------
-- 4. Field Status Variant Mismatch
---------------------------------------------------------------

SELECT
    itk.bukrs,
    'ERROR' AS validation_status,
    CONCAT(
        'Field Status Variant mismatch | ITK: ',
        itk.fstva,
        ' | Ariba: ',
        ar.field_status_variant
    ) AS error_message
FROM itk_company_code itk
JOIN ariba_company_code ar
    ON itk.bukrs = ar.company_code_id
WHERE ISNULL(itk.fstva, '')
   <> ISNULL(ar.field_status_variant, '');

---------------------------------------------------------------
-- 5. Purchasing Unit Mapping Mismatch
---------------------------------------------------------------

SELECT
    itk.bukrs,
    'ERROR' AS validation_status,
    CONCAT(
        'Purchasing Unit mismatch | ITK: ',
        itk.purchasing_unit,
        ' | Ariba: ',
        ar.purchasing_unit_id
    ) AS error_message
FROM itk_company_code itk
JOIN ariba_company_code ar
    ON itk.bukrs = ar.company_code_id
WHERE ISNULL(itk.purchasing_unit, '')
   <> ISNULL(ar.purchasing_unit_id, '');

---------------------------------------------------------------
-- 6. Country Validation Mismatch
---------------------------------------------------------------

SELECT
    itk.bukrs,
    'ERROR' AS validation_status,
    CONCAT(
        'Country mismatch | ITK: ',
        itk.country_name,
        ' | Ariba: ',
        ar.country_unique_name
    ) AS error_message
FROM itk_company_code itk
JOIN ariba_company_code ar
    ON itk.bukrs = ar.company_code_id
WHERE ISNULL(itk.country_name, '')
   <> ISNULL(ar.country_unique_name, '');

---------------------------------------------------------------
-- 7. Duplicate Company Codes in ITK
---------------------------------------------------------------

SELECT
    bukrs,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Company Code found in ITK' AS error_message
FROM itk_company_code
GROUP BY bukrs
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 8. Duplicate Company Codes in Ariba
---------------------------------------------------------------

SELECT
    company_code_id,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Company Code found in Ariba' AS error_message
FROM ariba_company_code
GROUP BY company_code_id
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 9. NULL Company Code Validation
---------------------------------------------------------------

SELECT
    bukrs,
    'ERROR' AS validation_status,
    'NULL or Blank Company Code' AS error_message
FROM itk_company_code
WHERE bukrs IS NULL
   OR TRIM(bukrs) = '';

---------------------------------------------------------------
-- 10. Invalid Company Code Length
---------------------------------------------------------------

SELECT
    bukrs,
    'ERROR' AS validation_status,
    'Invalid Company Code Length' AS error_message
FROM itk_company_code
WHERE LEN(bukrs) <> 4;
