/*=============================================================
CONSOLIDATED REPORT
Module : Supplier Parent Validation
=============================================================*/

SELECT * FROM (

SELECT
vendor_id,
'Missing In Ariba'
FROM itk_supplier_parent itk
LEFT JOIN ariba_supplier_parent ar
ON itk.vendor_id = ar.vendor_id
WHERE ar.vendor_id IS NULL

UNION ALL

SELECT
vendor_id,
'Extra In Ariba'
FROM ariba_supplier_parent ar
LEFT JOIN itk_supplier_parent itk
ON ar.vendor_id = itk.vendor_id
WHERE itk.vendor_id IS NULL

UNION ALL

SELECT
vendor_id,
'Duplicate Supplier'
FROM itk_supplier_parent
GROUP BY vendor_id
HAVING COUNT(*) > 1

) supplier_parent_validation_report;
