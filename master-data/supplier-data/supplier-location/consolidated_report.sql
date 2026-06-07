/*=============================================================
CONSOLIDATED REPORT
Module : Supplier Location Validation
=============================================================*/

SELECT * FROM (

SELECT
CONCAT(supplier_id,'|',location_id),
'Missing In Ariba'
FROM itk_supplier_location itk
LEFT JOIN ariba_supplier_location ar
ON itk.supplier_id = ar.supplier_id
AND itk.location_id = ar.location_id
WHERE ar.location_id IS NULL

UNION ALL

SELECT
CONCAT(supplier_id,'|',location_id),
'Extra In Ariba'
FROM ariba_supplier_location ar
LEFT JOIN itk_supplier_location itk
ON ar.supplier_id = itk.supplier_id
AND ar.location_id = itk.location_id
WHERE itk.location_id IS NULL

UNION ALL

SELECT
CONCAT(supplier_id,'|',location_id),
'Duplicate Supplier Location'
FROM itk_supplier_location
GROUP BY supplier_id,location_id
HAVING COUNT(*) > 1

) supplier_location_validation_report;
