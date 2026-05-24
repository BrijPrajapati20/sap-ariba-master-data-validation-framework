/*=============================================================
CONSOLIDATED VALIDATION REPORT
Module : Plant to Purchase Organization Mapping Validation
=============================================================*/

SELECT * FROM (

    -----------------------------------------------------------
    -- Missing Mapping
    -----------------------------------------------------------

    SELECT
        CONCAT(itk.werks, '-', itk.ekorg) AS object_id,
        'Missing Mapping in Ariba' AS error_type
    FROM itk_plant_purchase_org itk
    LEFT JOIN ariba_plant_purchase_org ar
        ON itk.werks = ar.plant_id
       AND itk.ekorg = ar.purchase_org_id
    WHERE ar.plant_id IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Extra Mapping
    -----------------------------------------------------------

    SELECT
        CONCAT(ar.plant_id, '-', ar.purchase_org_id),
        'Extra Mapping in Ariba'
    FROM ariba_plant_purchase_org ar
    LEFT JOIN itk_plant_purchase_org itk
        ON ar.plant_id = itk.werks
       AND ar.purchase_org_id = itk.ekorg
    WHERE itk.werks IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Mapping in ITK
    -----------------------------------------------------------

    SELECT
        CONCAT(werks, '-', ekorg),
        'Duplicate Mapping in ITK'
    FROM itk_plant_purchase_org
    GROUP BY werks, ekorg
    HAVING COUNT(*) > 1

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Mapping in Ariba
    -----------------------------------------------------------

    SELECT
        CONCAT(plant_id, '-', purchase_org_id),
        'Duplicate Mapping in Ariba'
    FROM ariba_plant_purchase_org
    GROUP BY plant_id, purchase_org_id
    HAVING COUNT(*) > 1

) plant_purchase_org_validation_report;
