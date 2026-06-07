/*=============================================================
CONSOLIDATED REPORT
Module : WBS Validation
=============================================================*/

SELECT * FROM (

SELECT
wbs_id,
'Missing In Ariba'
FROM itk_wbs itk
LEFT JOIN ariba_wbs ar
ON itk.wbs_id = ar.wbs_id
WHERE ar.wbs_id IS NULL

UNION ALL

SELECT
wbs_id,
'Extra In Ariba'
FROM ariba_wbs ar
LEFT JOIN itk_wbs itk
ON ar.wbs_id = itk.wbs_id
WHERE itk.wbs_id IS NULL

UNION ALL

SELECT
wbs_id,
'Duplicate WBS'
FROM itk_wbs
GROUP BY wbs_id
HAVING COUNT(*) > 1

) wbs_validation_report;
