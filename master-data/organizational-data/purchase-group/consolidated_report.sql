/*=============================================================
CONSOLIDATED VALIDATION REPORT
Module : Purchase Group Validation
=============================================================*/

SELECT * FROM (

    -----------------------------------------------------------
    -- Missing Purchase Groups
    -----------------------------------------------------------

    SELECT
        itk.ekgrp AS object_id,
        'Missing in Ariba' AS error_type
    FROM itk_purchase_group itk
    LEFT JOIN ariba_purchase_group ar
        ON itk.ekgrp = ar.purchase_group_id
    WHERE ar.purchase_group_id IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Extra Purchase Groups
    -----------------------------------------------------------

    SELECT
        ar.purchase_group_id,
        'Extra Record in Ariba'
    FROM ariba_purchase_group ar
    LEFT JOIN itk_purchase_group itk
        ON ar.purchase_group_id = itk.ekgrp
    WHERE itk.ekgrp IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Name Mismatch
    -----------------------------------------------------------

    SELECT
        itk.ekgrp,
        'Purchase Group Name Mismatch'
    FROM itk_purchase_group itk
    JOIN ariba_purchase_group ar
        ON itk.ekgrp = ar.purchase_group_id
    WHERE ISNULL(itk.eknam, '')
       <> ISNULL(ar.purchase_group_name, '')

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Records in ITK
    -----------------------------------------------------------

    SELECT
        ekgrp,
        'Duplicate Record in ITK'
    FROM itk_purchase_group
    GROUP BY ekgrp
    HAVING COUNT(*) > 1

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Records in Ariba
    -----------------------------------------------------------

    SELECT
        purchase_group_id,
        'Duplicate Record in Ariba'
    FROM ariba_purchase_group
    GROUP BY purchase_group_id
    HAVING COUNT(*) > 1

) purchase_group_validation_report;
