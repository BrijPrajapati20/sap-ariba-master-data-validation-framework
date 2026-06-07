/*=============================================================
DATA IMPORT SCRIPT
Module : Asset Validation
=============================================================*/

BULK INSERT itk_asset
FROM 'C:\Data\itk_asset.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

BULK INSERT ariba_asset
FROM 'C:\Data\ariba_asset.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);
