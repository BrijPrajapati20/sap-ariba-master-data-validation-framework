/*=============================================================
VALIDATION FRAMEWORK
Module : WBS Validation
=============================================================*/

---------------------------------------------------------------
-- Missing In Ariba
---------------------------------------------------------------

SELECT
itk.wbs_id,
'ERROR' AS validation_status,
'WBS Missing In Ariba'
AS error_message
FROM itk_wbs itk
LEFT JOIN ariba_wbs ar
ON itk.wbs_id = ar.wbs_id
WHERE ar.wbs_id IS NULL;

---------------------------------------------------------------
-- Extra In Ariba
---------------------------------------------------------------

SELECT
ar.wbs_id,
'ERROR' AS validation_status,
'Extra WBS Found In Ariba'
AS error_message
FROM ariba_wbs ar
LEFT JOIN itk_wbs itk
ON ar.wbs_id = itk.wbs_id
WHERE itk.wbs_id IS NULL;

---------------------------------------------------------------
-- Description Mismatch
---------------------------------------------------------------

SELECT
itk.wbs_id,
'ERROR' AS validation_status,
CONCAT(
'Description mismatch | ITK:',
itk.wbs_description,
' | Ariba:',
ar.wbs_description
)
AS error_message
FROM itk_wbs itk
JOIN ariba_wbs ar
ON itk.wbs_id = ar.wbs_id
WHERE ISNULL(itk.wbs_description,'')
<> ISNULL(ar.wbs_description,'');

---------------------------------------------------------------
-- Cost Center Mismatch
---------------------------------------------------------------

SELECT
itk.wbs_id,
'ERROR' AS validation_status,
'Cost Center mismatch'
AS error_message
FROM itk_wbs itk
JOIN ariba_wbs ar
ON itk.wbs_id = ar.wbs_id
WHERE ISNULL(itk.cost_center_id,'')
<> ISNULL(ar.cost_center_id,'');
