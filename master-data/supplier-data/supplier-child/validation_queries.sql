/*=============================================================
VALIDATION FRAMEWORK
Module : Supplier Child Validation
=============================================================*/

---------------------------------------------------------------
-- Missing Supplier Location In Ariba
---------------------------------------------------------------

SELECT
itk.vendor_id,
'ERROR' AS validation_status,
'Supplier Location Missing In Ariba'
AS error_message
FROM itk_supplier_child itk
LEFT JOIN ariba_supplier_child ar
ON itk.vendor_id = ar.vendor_id
AND itk.supplier_address = ar.supplier_address
WHERE ar.vendor_id IS NULL;

---------------------------------------------------------------
-- Extra Supplier Location In Ariba
---------------------------------------------------------------

SELECT
ar.vendor_id,
'ERROR' AS validation_status,
'Extra Supplier Location Found In Ariba'
AS error_message
FROM ariba_supplier_child ar
LEFT JOIN itk_supplier_child itk
ON ar.vendor_id = itk.vendor_id
AND ar.supplier_address = itk.supplier_address
WHERE itk.vendor_id IS NULL;

---------------------------------------------------------------
-- Supplier Name Mismatch
---------------------------------------------------------------

SELECT
itk.vendor_id,
'ERROR' AS validation_status,
CONCAT(
'Supplier Name mismatch | ITK:',
itk.supplier_name,
' | Ariba:',
ar.supplier_name
)
AS error_message
FROM itk_supplier_child itk
JOIN ariba_supplier_child ar
ON itk.vendor_id = ar.vendor_id
WHERE ISNULL(itk.supplier_name,'')
<> ISNULL(ar.supplier_name,'');

---------------------------------------------------------------
-- Address Mismatch
---------------------------------------------------------------

SELECT
itk.vendor_id,
'ERROR' AS validation_status,
'Address mismatch'
AS error_message
FROM itk_supplier_child itk
JOIN ariba_supplier_child ar
ON itk.vendor_id = ar.vendor_id
WHERE ISNULL(itk.supplier_address,'')
<> ISNULL(ar.supplier_address,'');
