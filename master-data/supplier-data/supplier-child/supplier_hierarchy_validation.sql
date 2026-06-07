/*=============================================================
SUPPLIER HIERARCHY VALIDATION
Module : Supplier Child Validation
=============================================================*/

---------------------------------------------------------------
-- Blank Supplier ID
---------------------------------------------------------------

SELECT
vendor_id,
'ERROR' AS validation_status,
'Supplier ID is blank'
AS error_message
FROM itk_supplier_child
WHERE vendor_id IS NULL
OR LTRIM(RTRIM(vendor_id))='';

---------------------------------------------------------------
-- Blank Address
---------------------------------------------------------------

SELECT
vendor_id,
'ERROR' AS validation_status,
'Address is blank'
AS error_message
FROM itk_supplier_child
WHERE supplier_address IS NULL
OR LTRIM(RTRIM(supplier_address))='';

---------------------------------------------------------------
-- Blank City
---------------------------------------------------------------

SELECT
vendor_id,
'ERROR' AS validation_status,
'City is blank'
AS error_message
FROM itk_supplier_child
WHERE city IS NULL
OR LTRIM(RTRIM(city))='';

---------------------------------------------------------------
-- Blank Country
---------------------------------------------------------------

SELECT
vendor_id,
'ERROR' AS validation_status,
'Country is blank'
AS error_message
FROM itk_supplier_child
WHERE country IS NULL
OR LTRIM(RTRIM(country))='';

---------------------------------------------------------------
-- Duplicate Supplier Location
---------------------------------------------------------------

SELECT
vendor_id,
supplier_address,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate Supplier Location Found'
AS error_message
FROM itk_supplier_child
GROUP BY vendor_id,supplier_address
HAVING COUNT(*) > 1;
