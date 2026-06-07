/*=============================================================
CONSOLIDATED REPORT
Module : Asset Validation
=============================================================*/

SELECT * FROM (

SELECT
CONCAT(itk.company_code,'-',itk.asset_number),
'Missing In Ariba'
FROM itk_asset itk
LEFT JOIN ariba_asset ar
ON itk.company_code = ar.company_code
AND itk.asset_number = ar.asset_number
WHERE ar.asset_number IS NULL

UNION ALL

SELECT
CONCAT(ar.company_code,'-',ar.asset_number),
'Extra In Ariba'
FROM ariba_asset ar
LEFT JOIN itk_asset itk
ON ar.company_code = itk.company_code
AND ar.asset_number = itk.asset_number
WHERE itk.asset_number IS NULL

UNION ALL

SELECT
CONCAT(company_code,'-',asset_number),
'Duplicate Asset'
FROM itk_asset
GROUP BY company_code,asset_number
HAVING COUNT(*) > 1

) asset_validation_report;
