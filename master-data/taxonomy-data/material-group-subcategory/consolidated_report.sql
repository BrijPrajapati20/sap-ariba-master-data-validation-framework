/*=========================================================
CONSOLIDATED REPORT
=========================================================*/

SELECT * FROM (

SELECT
    mtgrp_subc,
    'Missing in Ariba'
FROM itk_material_group_subcategory itk
LEFT JOIN ariba_material_group_subcategory ar
ON itk.mtgrp_subc = ar.subcategory_code
WHERE ar.subcategory_code IS NULL

UNION ALL

SELECT
    subcategory_code,
    'Extra in Ariba'
FROM ariba_material_group_subcategory ar
LEFT JOIN itk_material_group_subcategory itk
ON ar.subcategory_code = itk.mtgrp_subc
WHERE itk.mtgrp_subc IS NULL

UNION ALL

SELECT
    mtgrp_subc,
    'Description Mismatch'
FROM itk_material_group_subcategory itk
JOIN ariba_material_group_subcategory ar
ON itk.mtgrp_subc = ar.subcategory_code
WHERE ISNULL(itk.mtgrp_subcd,'')
<> ISNULL(ar.subcategory_description,'')

) taxonomy_validation_report;
