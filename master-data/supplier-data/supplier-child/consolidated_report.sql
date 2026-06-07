/*=============================================================
CONSOLIDATED REPORT
Module : Supplier Child Validation
=============================================================*/

SELECT * FROM (

SELECT
vendor_id,
'Missing In Ariba'
FROM itk_supplier_child itk
LEFT JOIN ariba_supplier_child ar
ON itk.vendor_id = ar.vendor_id
AND itk.supplier_address = ar.supplier_address
WHERE ar.vendor_id IS NULL

UNION ALL

SELECT
vendor_id,
'Extra In Ariba'
FROM ariba_supplier_child ar
LEFT JOIN itk_supplier_child itk
ON ar.vendor_id = itk.vendor_id
AND ar.supplier_address = itk.supplier_address
WHERE itk.vendor_id IS NULL

UNION ALL

SELECT
vendor_id,
'Duplicate Supplier Location'
FROM itk_supplier_child
GROUP BY vendor_id,supplier_address
HAVING COUNT(*) > 1

) supplier_child_validation_report;
