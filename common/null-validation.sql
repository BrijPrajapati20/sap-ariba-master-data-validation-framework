/*=============================================================
COMMON NULL VALIDATION FRAMEWORK
=============================================================*/

---------------------------------------------------------------
-- Generic NULL / Blank Validation
---------------------------------------------------------------

SELECT
    key_column,
    'ERROR' AS validation_status,
    'Mandatory field is NULL or Blank' AS error_message
FROM source_table
WHERE mandatory_column IS NULL
   OR TRIM(mandatory_column) = '';
