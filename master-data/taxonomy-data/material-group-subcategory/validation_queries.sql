/*=========================================================
VALIDATION FRAMEWORK
Module : Material Group Subcategory
=========================================================*/

-----------------------------------------------------------
-- Missing in Ariba
-----------------------------------------------------------

SELECT
    itk.mtgrp_subc,
    'ERROR' AS validation_status,
    'Subcategory missing in Ariba'
    AS error_message
FROM itk_material_group_subcategory itk
LEFT JOIN ariba_material_group_subcategory ar
       ON itk.mtgrp_subc = ar.subcategory_code
WHERE ar.subcategory_code IS NULL;

-----------------------------------------------------------
-- Extra in Ariba
-----------------------------------------------------------

SELECT
    ar.subcategory_code,
    'ERROR' AS validation_status,
    'Extra Subcategory found in Ariba'
    AS error_message
FROM ariba_material_group_subcategory ar
LEFT JOIN itk_material_group_subcategory itk
       ON ar.subcategory_code = itk.mtgrp_subc
WHERE itk.mtgrp_subc IS NULL;

-----------------------------------------------------------
-- Description Mismatch
-----------------------------------------------------------

SELECT
    itk.mtgrp_subc,
    'ERROR' AS validation_status,
    CONCAT(
       'Description mismatch | ITK: ',
       itk.mtgrp_subcd,
       ' | Ariba: ',
       ar.subcategory_description
    ) AS error_message
FROM itk_material_group_subcategory itk
JOIN ariba_material_group_subcategory ar
  ON itk.mtgrp_subc = ar.subcategory_code
WHERE ISNULL(itk.mtgrp_subcd,'')
   <> ISNULL(ar.subcategory_description,'');

-----------------------------------------------------------
-- Duplicate ITK
-----------------------------------------------------------

SELECT
    mtgrp_subc,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Subcategory in ITK'
    AS error_message
FROM itk_material_group_subcategory
GROUP BY mtgrp_subc
HAVING COUNT(*) > 1;

-----------------------------------------------------------
-- Duplicate Ariba
-----------------------------------------------------------

SELECT
    subcategory_code,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Subcategory in Ariba'
    AS error_message
FROM ariba_material_group_subcategory
GROUP BY subcategory_code
HAVING COUNT(*) > 1;
