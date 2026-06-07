/*=============================================================
PROJECT GOVERNANCE VALIDATION
Module : WBS Validation
=============================================================*/

---------------------------------------------------------------
-- Blank WBS ID
---------------------------------------------------------------

SELECT
wbs_id,
'ERROR' AS validation_status,
'WBS ID is blank'
AS error_message
FROM itk_wbs
WHERE wbs_id IS NULL
OR LTRIM(RTRIM(wbs_id))='';

---------------------------------------------------------------
-- Blank Company Code
---------------------------------------------------------------

SELECT
wbs_id,
'ERROR' AS validation_status,
'Company Code is blank'
AS error_message
FROM itk_wbs
WHERE company_code IS NULL
OR LTRIM(RTRIM(company_code))='';

---------------------------------------------------------------
-- Blank Cost Center
---------------------------------------------------------------

SELECT
wbs_id,
'ERROR' AS validation_status,
'Cost Center is blank'
AS error_message
FROM itk_wbs
WHERE cost_center_id IS NULL
OR LTRIM(RTRIM(cost_center_id))='';

---------------------------------------------------------------
-- Cost Center Company Code Mismatch
---------------------------------------------------------------

SELECT
wbs_id,
company_code,
cost_center_company_code,
'ERROR' AS validation_status,
'Company Code mismatch between WBS and Cost Center'
AS error_message
FROM itk_wbs
WHERE ISNULL(company_code,'')
<> ISNULL(cost_center_company_code,'');

---------------------------------------------------------------
-- Duplicate WBS
---------------------------------------------------------------

SELECT
wbs_id,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate WBS Found'
AS error_message
FROM itk_wbs
GROUP BY wbs_id
HAVING COUNT(*) > 1;
