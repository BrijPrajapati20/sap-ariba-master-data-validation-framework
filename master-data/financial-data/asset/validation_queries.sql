/*=============================================================
VALIDATION FRAMEWORK
Module : Asset Validation
=============================================================*/

---------------------------------------------------------------
-- Missing In Ariba
---------------------------------------------------------------

SELECT
CONCAT(itk.company_code,'-',itk.asset_number) AS object_id,
'ERROR' AS validation_status,
'Asset Missing In Ariba'
AS error_message
FROM itk_asset itk
LEFT JOIN ariba_asset ar
ON itk.company_code = ar.company_code
AND itk.asset_number = ar.asset_number
WHERE ar.asset_number IS NULL;

---------------------------------------------------------------
-- Extra In Ariba
---------------------------------------------------------------

SELECT
CONCAT(ar.company_code,'-',ar.asset_number) AS object_id,
'ERROR' AS validation_status,
'Extra Asset Found In Ariba'
AS error_message
FROM ariba_asset ar
LEFT JOIN itk_asset itk
ON ar.company_code = itk.company_code
AND ar.asset_number = itk.asset_number
WHERE itk.asset_number IS NULL;

---------------------------------------------------------------
-- Asset Description Mismatch
---------------------------------------------------------------

SELECT
CONCAT(itk.company_code,'-',itk.asset_number) AS object_id,
'ERROR' AS validation_status,
CONCAT(
'Asset Description mismatch | ITK:',
itk.asset_description,
' | Ariba:',
ar.asset_description
) AS error_message
FROM itk_asset itk
JOIN ariba_asset ar
ON itk.company_code = ar.company_code
AND itk.asset_number = ar.asset_number
WHERE ISNULL(itk.asset_description,'')
<> ISNULL(ar.asset_description,'');

---------------------------------------------------------------
-- Duplicate Assets In Ariba
---------------------------------------------------------------

SELECT
CONCAT(company_code,'-',asset_number) AS object_id,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate Asset Found In Ariba'
AS error_message
FROM ariba_asset
GROUP BY company_code,asset_number
HAVING COUNT(*) > 1;
