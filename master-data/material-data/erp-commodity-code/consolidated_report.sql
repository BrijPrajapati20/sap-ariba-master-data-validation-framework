/*=============================================================
CONSOLIDATED VALIDATION REPORT
Module : ERP Commodity Code Validation
=============================================================*/

SELECT * FROM (

    -----------------------------------------------------------
    -- Missing Material Groups
    -----------------------------------------------------------

    SELECT
        itk.matkl AS object_id,
        'Missing in Ariba' AS error_type
    FROM itk_erp_commodity_code itk
    LEFT JOIN ariba_erp_commodity_code ar
        ON itk.matkl = ar.material_group_id
    WHERE ar.material_group_id IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Extra Material Groups
    -----------------------------------------------------------

    SELECT
        ar.material_group_id,
        'Extra Record in Ariba'
    FROM ariba_erp_commodity_code ar
    LEFT JOIN itk_erp_commodity_code itk
        ON ar.material_group_id = itk.matkl
    WHERE itk.matkl IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Description Mismatch
    -----------------------------------------------------------

    SELECT
        itk.matkl,
        'Description Mismatch'
    FROM itk_erp_commodity_code itk
    JOIN ariba_erp_commodity_code ar
        ON itk.matkl = ar.material_group_id
    WHERE ISNULL(itk.wgbez, '')
       <> ISNULL(ar.material_group_description, '')

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Records in ITK
    -----------------------------------------------------------

    SELECT
        matkl,
        'Duplicate Record in ITK'
    FROM itk_erp_commodity_code
    GROUP BY matkl
    HAVING COUNT(*) > 1

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Records in Ariba
    -----------------------------------------------------------

    SELECT
        material_group_id,
        'Duplicate Record in Ariba'
    FROM ariba_erp_commodity_code
    GROUP BY material_group_id
    HAVING COUNT(*) > 1

) erp_commodity_code_validation_report;
