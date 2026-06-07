/*=============================================================
SUPPLIER PROCUREMENT VALIDATION
Module : Supplier Purchase Organization Validation
=============================================================*/

---------------------------------------------------------------
-- Blank Vendor ID
---------------------------------------------------------------

SELECT
vendor_id,
'ERROR' AS validation_status,
'Vendor ID is blank'
AS error_message
FROM itk_supplier_purchase_org
WHERE vendor_id IS NULL
OR LTRIM(RTRIM(vendor_id))='';

---------------------------------------------------------------
-- Blank Purchase Organization
---------------------------------------------------------------

SELECT
vendor_id,
'ERROR' AS validation_status,
'Purchase Organization is blank'
AS error_message
FROM itk_supplier_purchase_org
WHERE purchase_org IS NULL
OR LTRIM(RTRIM(purchase_org))='';

---------------------------------------------------------------
-- Blank Payment Term
---------------------------------------------------------------

SELECT
vendor_id,
'ERROR' AS validation_status,
'Payment Term is blank'
AS error_message
FROM itk_supplier_purchase_org
WHERE payment_term IS NULL
OR LTRIM(RTRIM(payment_term))='';

---------------------------------------------------------------
-- Duplicate Supplier Purchase Org
---------------------------------------------------------------

SELECT
vendor_id,
purchase_org,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate Supplier Purchase Org Mapping Found'
AS error_message
FROM itk_supplier_purchase_org
GROUP BY vendor_id,purchase_org
HAVING COUNT(*) > 1;
