/*=============================================================
CONSOLIDATED VALIDATION REPORT
Module : Company Code Validation
=============================================================*/

SELECT * FROM (

    -----------------------------------------------------------
    -- Missing Company Codes
    -----------------------------------------------------------

    SELECT
        itk.bukrs AS object_id,
        'Missing in Ariba' AS error_type
    FROM itk_company_code itk
    LEFT JOIN ariba_company_code ar
        ON itk.bukrs = ar.company_code_id
    WHERE ar.company_code_id IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Extra Company Codes
    -----------------------------------------------------------

    SELECT
        ar.company_code_id,
        'Extra Record in Ariba'
    FROM ariba_company_code ar
    LEFT JOIN itk_company_code itk
        ON ar.company_code_id = itk.bukrs
    WHERE itk.bukrs IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Company Name Mismatch
    -----------------------------------------------------------

    SELECT
        itk.bukrs,
        'Company Name Mismatch'
    FROM itk_company_code itk
    JOIN ariba_company_code ar
        ON itk.bukrs = ar.company_code_id
    WHERE ISNULL(itk.butxt, '')
       <> ISNULL(ar.company_name, '')

    UNION ALL

    -----------------------------------------------------------
    -- Field Status Variant Mismatch
    -----------------------------------------------------------

    SELECT
        itk.bukrs,
        'Field Status Variant Mismatch'
    FROM itk_company_code itk
    JOIN ariba_company_code ar
        ON itk.bukrs = ar.company_code_id
    WHERE ISNULL(itk.fstva, '')
       <> ISNULL(ar.field_status_variant, '')

    UNION ALL

    -----------------------------------------------------------
    -- Purchasing Unit Mismatch
    -----------------------------------------------------------

    SELECT
        itk.bukrs,
        'Purchasing Unit Mismatch'
    FROM itk_company_code itk
    JOIN ariba_company_code ar
        ON itk.bukrs = ar.company_code_id
    WHERE ISNULL(itk.purchasing_unit, '')
       <> ISNULL(ar.purchasing_unit_id, '')

) company_code_validation_report;
