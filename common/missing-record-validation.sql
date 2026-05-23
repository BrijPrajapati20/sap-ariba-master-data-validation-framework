/*=============================================================
COMMON MISSING RECORD VALIDATION FRAMEWORK
=============================================================*/

---------------------------------------------------------------
-- Missing Records in Target System
---------------------------------------------------------------

SELECT
    src.primary_key,
    'ERROR' AS validation_status,
    'Record missing in target system' AS error_message
FROM source_table src
LEFT JOIN target_table tgt
    ON src.primary_key = tgt.primary_key
WHERE tgt.primary_key IS NULL;
