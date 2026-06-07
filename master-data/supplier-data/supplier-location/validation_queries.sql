/*=============================================================
VALIDATION FRAMEWORK
Module : Supplier Location Validation
=============================================================*/

---------------------------------------------------------------
-- Missing In Ariba
---------------------------------------------------------------

SELECT
CONCAT(itk.supplier_id,'|',itk.location_id)
AS object_id,
'ERROR' AS validation_status,
'Supplier Location Missing In Ariba'
AS error_message
FROM itk_supplier_location itk
LEFT JOIN ariba_supplier_location ar
ON itk.supplier_id = ar.supplier_id
AND itk.location_id = ar.location_id
WHERE ar.location_id IS NULL;

---------------------------------------------------------------
-- Extra In Ariba
---------------------------------------------------------------

SELECT
CONCAT(ar.supplier_id,'|',ar.location_id)
AS object_id,
'ERROR' AS validation_status,
'Extra Supplier Location Found In Ariba'
AS error_message
FROM ariba_supplier_location ar
LEFT JOIN itk_supplier_location itk
ON ar.supplier_id = itk.supplier_id
AND ar.location_id = itk.location_id
WHERE itk.location_id IS NULL;

---------------------------------------------------------------
-- Address Mismatch
---------------------------------------------------------------

SELECT
CONCAT(itk.supplier_id,'|',itk.location_id)
AS object_id,
'ERROR' AS validation_status,
CONCAT(
'Address mismatch | ITK:',
itk.address_line,
' | Ariba:',
ar.address_line
)
AS error_message
FROM itk_supplier_location itk
JOIN ariba_supplier_location ar
ON itk.supplier_id = ar.supplier_id
AND itk.location_id = ar.location_id
WHERE ISNULL(itk.address_line,'')
<> ISNULL(ar.address_line,'');

---------------------------------------------------------------
-- Country Mismatch
---------------------------------------------------------------

SELECT
CONCAT(itk.supplier_id,'|',itk.location_id)
AS object_id,
'ERROR' AS validation_status,
'Country mismatch'
AS error_message
FROM itk_supplier_location itk
JOIN ariba_supplier_location ar
ON itk.supplier_id = ar.supplier_id
AND itk.location_id = ar.location_id
WHERE ISNULL(itk.country_code,'')
<> ISNULL(ar.country_code,'');
