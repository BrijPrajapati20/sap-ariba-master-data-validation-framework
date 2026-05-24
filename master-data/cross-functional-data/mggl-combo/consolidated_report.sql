/*=============================================================
CONSOLIDATED VALIDATION REPORT
Module : MGGL Combo Validation
=============================================================*/

SELECT * FROM (

    -----------------------------------------------------------
    -- Missing MGGL Mapping
    -----------------------------------------------------------

    SELECT
        CONCAT(itk.unique_name, '-', itk.gl_number)
        AS object_id,
        'Missing in Ariba' AS error_type
    FROM itk_mggl_combo itk
    LEFT JOIN ariba_mggl_combo ar
        ON itk.unique_name = ar.material_group_id
       AND itk.gl_number = ar.gl_account_number
    WHERE ar.material_group_id IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Extra MGGL Mapping
    -----------------------------------------------------------

    SELECT
        CONCAT(ar.material_group_id, '-', ar.gl_account_number),
        'Extra Record in Ariba'
    FROM ariba_mggl_combo ar
    LEFT JOIN itk_mggl_combo itk
        ON ar.material_group_id = itk.unique_name
       AND ar.gl_account_number = itk.gl_number
    WHERE itk.unique_name IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Records in ITK
    -----------------------------------------------------------

    SELECT
        CONCAT(unique_name, '-', gl_number),
        'Duplicate Record in ITK'
    FROM itk_mggl_combo
    GROUP BY unique_name, gl_number
    HAVING COUNT(*) > 1

    UNION ALL

    -----------------------------------------------------------
    -- Duplicate Records in Ariba
    -----------------------------------------------------------

    SELECT
        CONCAT(material_group_id, '-', gl_account_number),
        'Duplicate Record in Ariba'
    FROM ariba_mggl_combo
    GROUP BY material_group_id, gl_account_number
    HAVING COUNT(*) > 1

) mggl_combo_validation_report;
