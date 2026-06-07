/*=========================================================
TAXONOMY GOVERNANCE VALIDATION
=========================================================*/

-----------------------------------------------------------
-- Null Code Validation
-----------------------------------------------------------

SELECT
    mtgrp_subc,
    'ERROR' AS validation_status,
    'Subcategory Code is NULL'
    AS error_message
FROM itk_material_group_subcategory
WHERE mtgrp_subc IS NULL
   OR LTRIM(RTRIM(mtgrp_subc)) = '';

-----------------------------------------------------------
-- Null Description Validation
-----------------------------------------------------------

SELECT
    mtgrp_subc,
    'WARNING' AS validation_status,
    'Subcategory Description is NULL'
    AS error_message
FROM itk_material_group_subcategory
WHERE mtgrp_subcd IS NULL
   OR LTRIM(RTRIM(mtgrp_subcd)) = '';

-----------------------------------------------------------
-- Description Length Validation
-----------------------------------------------------------

SELECT
    mtgrp_subc,
    'WARNING' AS validation_status,
    'Description exceeds expected length'
    AS error_message
FROM itk_material_group_subcategory
WHERE LEN(mtgrp_subcd) > 255;
