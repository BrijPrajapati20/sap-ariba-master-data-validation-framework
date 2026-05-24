/*=============================================================
CONSOLIDATED VALIDATION REPORT
Module : Cost Center Validation
=============================================================*/

SELECT * FROM (

    -----------------------------------------------------------
    -- Missing Cost Centers
    -----------------------------------------------------------

    SELECT
        CONCAT(itk.kostl, '-', itk.bukrs) AS object_id,
        'Missing in Ariba' AS error_type
    FROM itk_cost_center itk
    LEFT JOIN ariba_cost_center ar
        ON itk.kostl = ar.cost_center_id
       AND itk.bukrs = ar.company_code
    WHERE ar.cost_center_id IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Extra Cost Centers
    -----------------------------------------------------------

    SELECT
        CONCAT(ar.cost_center_id, '-', ar.company_code),
        'Extra Record in Ariba'
    FROM ariba_cost_center ar
    LEFT JOIN itk_cost_center itk
        ON ar.cost_center_id = itk.kostl
       AND ar.company_code = itk.bukrs
    WHERE itk.kostl IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Long Text Mapping Mismatch
    -----------------------------------------------------------

    SELECT
        CONCAT(itk.kostl, '-', itk.bukrs),
        'Long Text Mapping Mismatch'
    FROM itk_cost_center itk
    JOIN ariba_cost_center ar
        ON itk.kostl = ar.cost_center_id
       AND itk.bukrs = ar.company_code
    WHERE ISNULL(itk.ltext, '')
       <> ISNULL(ar.ktext, '')

    UNION ALL

    -----------------------------------------------------------
    -- Currency Mismatch
    -----------------------------------------------------------

    SELECT
        CONCAT(itk.kostl, '-', itk.bukrs),
        'Currency Mismatch'
    FROM itk_cost_center itk
    JOIN ariba_cost_center ar
        ON itk.kostl = ar.cost_center_id
       AND itk.bukrs = ar.company_code
    WHERE ISNULL(itk.waers, '')
       <> ISNULL(ar.currency_code, '')

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Cost Centers in ITK
    -----------------------------------------------------------

    SELECT
        CONCAT(kostl, '-', bukrs),
        'Duplicate Record in ITK'
    FROM itk_cost_center
    GROUP BY kostl, bukrs
    HAVING COUNT(*) > 1

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Cost Centers in Ariba
    -----------------------------------------------------------

    SELECT
        CONCAT(cost_center_id, '-', company_code),
        'Duplicate Record in Ariba'
    FROM ariba_cost_center
    GROUP BY cost_center_id, company_code
    HAVING COUNT(*) > 1

) cost_center_validation_report;
