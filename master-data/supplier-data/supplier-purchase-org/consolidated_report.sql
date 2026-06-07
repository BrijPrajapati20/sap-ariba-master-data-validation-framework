/*=============================================================
CONSOLIDATED REPORT
Module : Supplier Purchase Organization Validation
=============================================================*/

SELECT * FROM (

SELECT
CONCAT(itk.vendor_id,'-',itk.purchase_org),
'Missing In Ariba'
FROM itk_supplier_purchase_org itk
LEFT JOIN ariba_supplier_purchase_org ar
ON itk.vendor_id = ar.vendor_id
AND itk.purchase_org = ar.purchase_org
WHERE ar.vendor_id IS NULL

UNION ALL

SELECT
CONCAT(ar.vendor_id,'-',ar.purchase_org),
'Extra In Ariba'
FROM ariba_supplier_purchase_org ar
LEFT JOIN itk_supplier_purchase_org itk
ON ar.vendor_id = itk.vendor_id
AND ar.purchase_org = itk.purchase_org
WHERE itk.vendor_id IS NULL

UNION ALL

SELECT
CONCAT(vendor_id,'-',purchase_org),
'Duplicate Mapping'
FROM itk_supplier_purchase_org
GROUP BY vendor_id,purchase_org
HAVING COUNT(*) > 1

) supplier_purchase_org_validation_report;
