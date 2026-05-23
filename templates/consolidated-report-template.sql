/*=============================================================
CONSOLIDATED VALIDATION REPORT TEMPLATE
=============================================================*/

SELECT * FROM (

    -----------------------------------------------------------
    -- Missing Records
    -----------------------------------------------------------

    SELECT
        object_id,
        'Missing Record' AS error_type
    FROM source_table

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Records
    -----------------------------------------------------------

    SELECT
        object_id,
        'Duplicate Record' AS error_type
    FROM source_table

    UNION ALL

    -----------------------------------------------------------
    -- Field Mismatch
    -----------------------------------------------------------

    SELECT
        object_id,
        'Field Mismatch' AS error_type
    FROM source_table

) consolidated_validation_report;
