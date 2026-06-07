/*=============================================================
SUPPLIER GOVERNANCE VALIDATION
Module : Supplier Parent Validation
=============================================================*/

---------------------------------------------------------------
-- Blank Supplier ID
---------------------------------------------------------------

SELECT
vendor_id,
'ERROR' AS validation_status,
'Supplier ID is blank'
AS error_message
FROM itk_supplier_parent
WHERE vendor_id IS NULL
OR LTRIM(RTRIM(vendor_id))='';

---------------------------------------------------------------
-- Blank Supplier Name
---------------------------------------------------------------

SELECT
vendor_id,
'ERROR' AS validation_status,
'Supplier Name is blank'
AS error_message
FROM itk_supplier_parent
WHERE supplier_name IS NULL
OR LTRIM(RTRIM(supplier_name))='';

---------------------------------------------------------------
-- Blank Country
---------------------------------------------------------------

SELECT
vendor_id,
'ERROR' AS validation_status,
'Country is blank'
AS error_message
FROM itk_supplier_parent
WHERE country IS NULL
OR LTRIM(RTRIM(country))='';

---------------------------------------------------------------
-- Duplicate Supplier ID
---------------------------------------------------------------

SELECT
vendor_id,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate Supplier ID found'
AS error_message
FROM itk_supplier_parent
GROUP BY vendor_id
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- Duplicate Address ID
---------------------------------------------------------------

SELECT
address_id,
COUNT(*) AS duplicate_count,
'WARNING' AS validation_status,
'Duplicate Address ID found'
AS error_message
FROM itk_supplier_parent
GROUP BY address_id
HAVING COUNT(*) > 1;
