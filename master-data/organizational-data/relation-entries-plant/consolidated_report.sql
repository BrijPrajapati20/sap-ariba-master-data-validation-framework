/*=============================================================
CONSOLIDATED VALIDATION REPORT
Module : Relation Entries - Plant Validation
=============================================================*/

SELECT * FROM (

    -----------------------------------------------------------
    -- Missing Relations
    -----------------------------------------------------------

    SELECT
        CONCAT(itk.left_id, '-', itk.right_id) AS object_id,
        'Missing Relation in Ariba' AS error_type
    FROM itk_relation_entries_plant itk
    LEFT JOIN ariba_relation_entries_plant ar
        ON itk.left_id = ar.plant_id
       AND itk.right_id = ar.company_code
    WHERE ar.plant_id IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Extra Relations
    -----------------------------------------------------------

    SELECT
        CONCAT(ar.plant_id, '-', ar.company_code),
        'Extra Relation in Ariba'
    FROM ariba_relation_entries_plant ar
    LEFT JOIN itk_relation_entries_plant itk
        ON ar.plant_id = itk.left_id
       AND ar.company_code = itk.right_id
    WHERE itk.left_id IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Relations in ITK
    -----------------------------------------------------------

    SELECT
        CONCAT(left_id, '-', right_id),
        'Duplicate Relation in ITK'
    FROM itk_relation_entries_plant
    GROUP BY left_id, right_id
    HAVING COUNT(*) > 1

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Relations in Ariba
    -----------------------------------------------------------

    SELECT
        CONCAT(plant_id, '-', company_code),
        'Duplicate Relation in Ariba'
    FROM ariba_relation_entries_plant
    GROUP BY plant_id, company_code
    HAVING COUNT(*) > 1

    UNION ALL

    -----------------------------------------------------------
    -- DNU Validation
    -----------------------------------------------------------

    SELECT
        left_id,
        'DNU Record Exists'
    FROM itk_relation_entries_plant
    WHERE left_id IN (
        SELECT left_id
        FROM itk_relation_entries_plant_delete
    )

) relation_entries_plant_validation_report;
