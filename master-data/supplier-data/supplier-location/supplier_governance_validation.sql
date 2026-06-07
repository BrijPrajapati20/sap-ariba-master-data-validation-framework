/*=============================================================
SUPPLIER GOVERNANCE VALIDATION
Module : Supplier Location Validation
=============================================================*/

---------------------------------------------------------------
-- Blank Supplier ID
---------------------------------------------------------------

SELECT
location_id,
'ERROR' AS validation_status,
'Supplier ID is blank'
AS error_message
FROM itk_supplier_location
WHERE supplier_id IS NULL
OR LTRIM(RTRIM(supplier_id))='';

---------------------------------------------------------------
-- Blank Location ID
---------------------------------------------------------------

SELECT
supplier_id,
'ERROR' AS validation_status,
'Location ID is blank'
AS error_message
FROM itk_supplier_location
WHERE location_id IS NULL
OR LTRIM(RTRIM(location_id))='';

---------------------------------------------------------------
-- Blank Country
---------------------------------------------------------------

SELECT
supplier_id,
location_id,
'ERROR' AS validation_status,
'Country is blank'
AS error_message
FROM itk_supplier_location
WHERE country_code IS NULL
OR LTRIM(RTRIM(country_code))='';

---------------------------------------------------------------
-- Duplicate Location
---------------------------------------------------------------

SELECT
supplier_id,
location_id,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate Supplier Location Found'
AS error_message
FROM itk_supplier_location
GROUP BY supplier_id,location_id
HAVING COUNT(*) > 1;
