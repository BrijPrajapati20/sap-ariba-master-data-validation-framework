/*=============================================================
DATA IMPORT SCRIPT
Module : Relation Entry MG Subcategory
=============================================================*/

BULK INSERT itk_relation_entry_mg_subcategory
FROM 'C:\Data\itk_relation_entry_mg_subcategory.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

BULK INSERT ariba_relation_entry_mg_subcategory
FROM 'C:\Data\ariba_relation_entry_mg_subcategory.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);
