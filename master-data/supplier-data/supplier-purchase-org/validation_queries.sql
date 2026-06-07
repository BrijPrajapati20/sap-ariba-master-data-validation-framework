/*=============================================================
VALIDATION FRAMEWORK
Module : Supplier Purchase Organization Validation
=============================================================*/

---------------------------------------------------------------
-- Missing In Ariba
---------------------------------------------------------------

SELECT
CONCAT(itk.vendor_id,'-',itk.purchase_org) AS object_id,
'ERROR' AS validation_status,
'Supplier Purchase Org Mapping Missing In Ariba'
AS error_message
FROM itk_supplier_purchase_org itk
LEFT JOIN ariba_supplier_purchase_org ar
ON itk.vendor_id = ar.vendor_id
AND itk.purchase_org = ar.purchase_org
WHERE ar.vendor_id IS NULL;

---------------------------------------------------------------
-- Extra In Ariba
---------------------------------------------------------------

SELECT
CONCAT(ar.vendor_id,'-',ar.purchase_org) AS object_id,
'ERROR' AS validation_status,
'Extra Supplier Purchase Org Mapping Found In Ariba'
AS error_message
FROM ariba_supplier_purchase_org ar
LEFT JOIN itk_supplier_purchase_org itk
ON ar.vendor_id = itk.vendor_id
AND ar.purchase_org = itk.purchase_org
WHERE itk.vendor_id IS NULL;

---------------------------------------------------------------
-- Payment Term Mismatch
---------------------------------------------------------------

SELECT
CONCAT(itk.vendor_id,'-',itk.purchase_org) AS object_id,
'ERROR' AS validation_status,
CONCAT(
'Payment Term mismatch | ITK:',
itk.payment_term,
' | Ariba:',
ar.payment_term
) AS error_message
FROM itk_supplier_purchase_org itk
JOIN ariba_supplier_purchase_org ar
ON itk.vendor_id = ar.vendor_id
AND itk.purchase_org = ar.purchase_org
WHERE ISNULL(itk.payment_term,'')
<> ISNULL(ar.payment_term,'');

---------------------------------------------------------------
-- Duplicate Records In Ariba
---------------------------------------------------------------

SELECT
CONCAT(vendor_id,'-',purchase_org) AS object_id,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate Supplier Purchase Org Mapping Found In Ariba'
AS error_message
FROM ariba_supplier_purchase_org
GROUP BY vendor_id,purchase_org
HAVING COUNT(*) > 1;
