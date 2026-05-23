/*=============================================================
VALIDATION FRAMEWORK
Module : Procurement Unit Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Missing Records in Ariba
---------------------------------------------------------------

SELECT
    itk.cocode AS procurement_unit,
    'ERROR' AS validation_status,
    'Missing Procurement Unit in Ariba' AS error_message
FROM itk_procurement_unit itk
LEFT JOIN ariba_procurement_unit ar
    ON itk.cocode = ar.company_code
WHERE ar.company_code IS NULL;

---------------------------------------------------------------
-- 2. Extra Records in Ariba
---------------------------------------------------------------

SELECT
    ar.company_code,
    'ERROR' AS validation_status,
    'Extra Procurement Unit found in Ariba' AS error_message
FROM ariba_procurement_unit ar
LEFT JOIN itk_procurement_unit itk
    ON ar.company_code = itk.cocode
WHERE itk.cocode IS NULL;

---------------------------------------------------------------
-- 3. Procurement Unit Name Mismatch
---------------------------------------------------------------

SELECT
    itk.cocode,
    'ERROR' AS validation_status,
    CONCAT(
        'Procurement Unit Name mismatch | ITK: ',
        itk.text,
        ' | Ariba: ',
        ar.procurement_unit_name
    ) AS error_message
FROM itk_procurement_unit itk
JOIN ariba_procurement_unit ar
    ON itk.cocode = ar.company_code
WHERE ISNULL(itk.text, '')
   <> ISNULL(ar.procurement_unit_name, '');

---------------------------------------------------------------
-- 4. Duplicate Procurement Units in ITK
---------------------------------------------------------------

SELECT
    cocode,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Procurement Unit found in ITK' AS error_message
FROM itk_procurement_unit
GROUP BY cocode
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 5. Duplicate Procurement Units in Ariba
---------------------------------------------------------------

SELECT
    company_code,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Procurement Unit found in Ariba' AS error_message
FROM ariba_procurement_unit
GROUP BY company_code
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 6. NULL Procurement Unit Validation
---------------------------------------------------------------

SELECT
    cocode,
    'ERROR' AS validation_status,
    'NULL or Blank Procurement Unit ID' AS error_message
FROM itk_procurement_unit
WHERE cocode IS NULL
   OR TRIM(cocode) = '';

---------------------------------------------------------------
-- 7. Procurement Unit Length Validation
---------------------------------------------------------------

SELECT
    cocode,
    'ERROR' AS validation_status,
    'Invalid Procurement Unit Length' AS error_message
FROM itk_procurement_unit
WHERE LEN(cocode) <> 4;
