/*=============================================================
ASSET GOVERNANCE VALIDATION
Module : Asset Validation
=============================================================*/

---------------------------------------------------------------
-- Blank Company Code
---------------------------------------------------------------

SELECT
asset_number,
'ERROR' AS validation_status,
'Company Code is blank'
AS error_message
FROM itk_asset
WHERE company_code IS NULL
OR LTRIM(RTRIM(company_code))='';

---------------------------------------------------------------
-- Blank Asset Number
---------------------------------------------------------------

SELECT
asset_number,
'ERROR' AS validation_status,
'Asset Number is blank'
AS error_message
FROM itk_asset
WHERE asset_number IS NULL
OR LTRIM(RTRIM(asset_number))='';

---------------------------------------------------------------
-- Blank Asset Description
---------------------------------------------------------------

SELECT
asset_number,
'WARNING' AS validation_status,
'Asset Description is blank'
AS error_message
FROM itk_asset
WHERE asset_description IS NULL
OR LTRIM(RTRIM(asset_description))='';

---------------------------------------------------------------
-- Duplicate Asset
---------------------------------------------------------------

SELECT
company_code,
asset_number,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate Asset Found'
AS error_message
FROM itk_asset
GROUP BY company_code,asset_number
HAVING COUNT(*) > 1;
