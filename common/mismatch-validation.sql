/*=============================================================
COMMON FIELD MISMATCH VALIDATION FRAMEWORK
=============================================================*/

---------------------------------------------------------------
-- Generic Field Mismatch Validation
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
