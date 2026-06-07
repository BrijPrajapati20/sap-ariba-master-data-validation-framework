/*=============================================================
CONSOLIDATED VALIDATION REPORT
Module : Purchase Org Material Group Validation
=============================================================*/

SELECT * FROM (

---------------------------------------------------------------
-- Missing Records
---------------------------------------------------------------

SELECT
    itk.uniq_name AS object_id,
    'Missing In Ariba' AS error_type
FROM itk_purchase_org_material_group itk
LEFT JOIN ariba_purchase_org_material_group ar
       ON itk.uniq_name = ar.unique_name
WHERE ar.unique_name IS NULL

UNION ALL

---------------------------------------------------------------
-- Extra Records
---------------------------------------------------------------

SELECT
    ar.unique_name AS object_id,
    'Extra In Ariba' AS error_type
FROM ariba_purchase_org_material_group ar
LEFT JOIN itk_purchase_org_material_group itk
       ON ar.unique_name = itk.uniq_name
WHERE itk.uniq_name IS NULL

UNION ALL

---------------------------------------------------------------
-- Duplicate Records ITK
---------------------------------------------------------------

SELECT
    uniq_name AS object_id,
    'Duplicate In ITK' AS error_type
FROM itk_purchase_org_material_group
GROUP BY uniq_name
HAVING COUNT(*) > 1

UNION ALL

---------------------------------------------------------------
-- Duplicate Records Ariba
---------------------------------------------------------------

SELECT
    unique_name AS object_id,
    'Duplicate In Ariba' AS error_type
FROM ariba_purchase_org_material_group
GROUP BY unique_name
HAVING COUNT(*) > 1

UNION ALL

---------------------------------------------------------------
-- Blank Records
---------------------------------------------------------------

SELECT
    uniq_name AS object_id,
    'Blank Combination' AS error_type
FROM itk_purchase_org_material_group
WHERE uniq_name IS NULL
   OR LTRIM(RTRIM(uniq_name)) = ''

) purchase_org_material_group_validation_report;
