/*=============================================================
VALIDATION FRAMEWORK TEMPLATE
=============================================================*/

---------------------------------------------------------------
-- 1. Missing Records Validation
---------------------------------------------------------------

SELECT
    src.primary_key,
    'ERROR' AS validation_status,
    'Record missing in target system' AS error_message
FROM source_table src
LEFT JOIN target_table tgt
    ON src.primary_key = tgt.primary_key
WHERE tgt.primary_key IS NULL;

---------------------------------------------------------------
-- 2. Duplicate Validation
---------------------------------------------------------------

SELECT
    primary_key,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate record found' AS error_message
FROM source_table
GROUP BY primary_key
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 3. Field Mismatch Validation
---------------------------------------------------------------

SELECT
    src.primary_key,
    'ERROR' AS validation_status,
    CONCAT(
        'Field mismatch | Source: ',
        src.field_name,
        ' | Target: ',
        tgt.field_name
    ) AS error_message
FROM source_table src
JOIN target_table tgt
    ON src.primary_key = tgt.primary_key
WHERE ISNULL(src.field_name, '')
   <> ISNULL(tgt.field_name, '');

---------------------------------------------------------------
-- 4. NULL Validation
---------------------------------------------------------------

SELECT
    primary_key,
    'ERROR' AS validation_status,
    'Mandatory field is NULL or Blank' AS error_message
FROM source_table
WHERE mandatory_column IS NULL
   OR TRIM(mandatory_column) = '';
