/*=============================================================
DATA IMPORT SCRIPT
Module : Supplier Purchase Organization Validation
=============================================================*/

BULK INSERT itk_supplier_purchase_org
FROM 'C:\Data\itk_supplier_purchase_org.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

BULK INSERT ariba_supplier_purchase_org
FROM 'C:\Data\ariba_supplier_purchase_org.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);
