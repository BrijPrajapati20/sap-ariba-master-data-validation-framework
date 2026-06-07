/*=============================================================
VALIDATION FRAMEWORK
Module : Supplier Parent Validation
=============================================================*/

---------------------------------------------------------------
-- Missing Supplier In Ariba
---------------------------------------------------------------

SELECT
itk.vendor_id,
'ERROR' AS validation_status,
'Supplier missing in Ariba'
AS error_message
FROM itk_supplier_parent itk
LEFT JOIN ariba_supplier_parent ar
ON itk.vendor_id = ar.vendor_id
WHERE ar.vendor_id IS NULL;

---------------------------------------------------------------
-- Extra Supplier In Ariba
---------------------------------------------------------------

SELECT
ar.vendor_id,
'ERROR' AS validation_status,
'Extra Supplier found in Ariba'
AS error_message
FROM ariba_supplier_parent ar
LEFT JOIN itk_supplier_parent itk
ON ar.vendor_id = itk.vendor_id
WHERE itk.vendor_id IS NULL;

---------------------------------------------------------------
-- Supplier Name Mismatch
---------------------------------------------------------------

SELECT
itk.vendor_id,
'ERROR' AS validation_status,
CONCAT(
'Supplier Name mismatch | ITK: ',
itk.supplier_name,
' | Ariba: ',
ar.supplier_name
) AS error_message
FROM itk_supplier_parent itk
JOIN ariba_supplier_parent ar
ON itk.vendor_id = ar.vendor_id
WHERE ISNULL(itk.supplier_name,'')
<> ISNULL(ar.supplier_name,'');

---------------------------------------------------------------
-- Country Mismatch
---------------------------------------------------------------

SELECT
itk.vendor_id,
'ERROR' AS validation_status,
'Country mismatch'
AS error_message
FROM itk_supplier_parent itk
JOIN ariba_supplier_parent ar
ON itk.vendor_id = ar.vendor_id
WHERE ISNULL(itk.country,'')
<> ISNULL(ar.country,'');
