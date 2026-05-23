/*=============================================================
COMMON DUPLICATE VALIDATION FRAMEWORK
Reusable across all master data validations
=============================================================*/

---------------------------------------------------------------
-- Generic Duplicate Validation Template
---------------------------------------------------------------

SELECT
    primary_key_column,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate record found' AS error_message
FROM source_table
GROUP BY primary_key_column
HAVING COUNT(*) > 1;
