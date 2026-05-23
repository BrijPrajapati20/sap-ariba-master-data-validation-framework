/*=============================================================
COMMON LENGTH VALIDATION FRAMEWORK
=============================================================*/

---------------------------------------------------------------
-- Generic Length Validation
---------------------------------------------------------------

SELECT
    key_column,
    'ERROR' AS validation_status,
    'Invalid field length' AS error_message
FROM source_table
WHERE LEN(field_name) <> expected_length;
