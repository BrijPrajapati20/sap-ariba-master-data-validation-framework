/*=============================================================
CONSOLIDATED VALIDATION REPORT
Module : Procurement Unit Validation
=============================================================*/

SELECT * FROM (

    -----------------------------------------------------------
    -- Missing Records
    -----------------------------------------------------------

    SELECT
        itk.cocode AS object_id,
        'Missing in Ariba' AS error_type
    FROM itk_procurement_unit itk
    LEFT JOIN ariba_procurement_unit ar
        ON itk.cocode = ar.company_code
    WHERE ar.company_code IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Extra Records
    -----------------------------------------------------------

    SELECT
        ar.company_code,
        'Extra Record in Ariba'
    FROM ariba_procurement_unit ar
    LEFT JOIN itk_procurement_unit itk
        ON ar.company_code = itk.cocode
    WHERE itk.cocode IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Name Mismatch
    -----------------------------------------------------------

    SELECT
        itk.cocode,
        'Procurement Unit Name Mismatch'
    FROM itk_procurement_unit itk
    JOIN ariba_procurement_unit ar
        ON itk.cocode = ar.company_code
    WHERE ISNULL(itk.text, '')
       <> ISNULL(ar.procurement_unit_name, '')

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Records in ITK
    -----------------------------------------------------------

    SELECT
        cocode,
        'Duplicate Record in ITK'
    FROM itk_procurement_unit
    GROUP BY cocode
    HAVING COUNT(*) > 1

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Records in Ariba
    -----------------------------------------------------------

    SELECT
        company_code,
        'Duplicate Record in Ariba'
    FROM ariba_procurement_unit
    GROUP BY company_code
    HAVING COUNT(*) > 1

) procurement_unit_validation_report;
