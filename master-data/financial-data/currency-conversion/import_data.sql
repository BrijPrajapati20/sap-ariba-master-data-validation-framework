/*=============================================================
DATA IMPORT SCRIPT
Module : Currency Conversion Validation
=============================================================*/

BULK INSERT itk_currency_conversion
FROM 'C:\Data\itk_currency_conversion.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

BULK INSERT ariba_currency_conversion
FROM 'C:\Data\ariba_currency_conversion.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);
