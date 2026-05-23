/*=============================================================
STANDARD ERROR MESSAGE TEMPLATE
=============================================================*/

---------------------------------------------------------------
-- Recommended Error Severity
---------------------------------------------------------------

/*
CRITICAL
ERROR
WARNING
INFO
*/

---------------------------------------------------------------
-- Standard Error Structure
---------------------------------------------------------------

SELECT
    object_id,
    validation_type,
    validation_status,
    source_system,
    target_system,
    source_value,
    target_value,
    error_message,
    validation_timestamp
FROM validation_error_report;
