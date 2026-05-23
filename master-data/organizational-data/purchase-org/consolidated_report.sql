/*=============================================================
CONSOLIDATED VALIDATION REPORT
Module : Purchase Organization Validation
=============================================================*/

SELECT * FROM (

    -----------------------------------------------------------
    -- Missing Records in Ariba
    -----------------------------------------------------------

    SELECT
        itk.ekorg AS object_id,
        'Missing in Ariba' AS error_type
    FROM itk_purchase_org itk
    LEFT JOIN ariba_purchase_org ar
        ON itk.ekorg = ar.purchase_org_id
    WHERE ar.purchase_org_id IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Extra Records in Ariba
    -----------------------------------------------------------

    SELECT
        ar.purchase_org_id,
        'Extra Record in Ariba'
    FROM ariba_purchase_org ar
    LEFT JOIN itk_purchase_org itk
        ON ar.purchase_org_id = itk.ekorg
    WHERE itk.ekorg IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Purchase Organization Name Mismatch
    -----------------------------------------------------------

    SELECT
        itk.ekorg,
        'Description Mismatch'
    FROM itk_purchase_org itk
    JOIN ariba_purchase_org ar
        ON itk.ekorg = ar.purchase_org_id
    WHERE ISNULL(itk.ekotx, '') <> ISNULL(ar.description, '')

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Records in ITK
    -----------------------------------------------------------

    SELECT
        ekorg,
        'Duplicate Record in ITK'
    FROM itk_purchase_org
    GROUP BY ekorg
    HAVING COUNT(*) > 1

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Records in Ariba
    -----------------------------------------------------------

    SELECT
        purchase_org_id,
        'Duplicate Record in Ariba'
    FROM ariba_purchase_org
    GROUP BY purchase_org_id
    HAVING COUNT(*) > 1

) consolidated_validation_report;
