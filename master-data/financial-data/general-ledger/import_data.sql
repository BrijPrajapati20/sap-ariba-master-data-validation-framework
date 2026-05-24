/*=============================================================
DATA IMPORT SCRIPT
Module : General Ledger Validation
=============================================================*/

---------------------------------------------------------------
-- SQL Server Import
---------------------------------------------------------------

BULK INSERT itk_general_ledger
FROM 'C:\data\itk_general_ledger.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

BULK INSERT ariba_general_ledger
FROM 'C:\data\ariba_general_ledger.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

---------------------------------------------------------------
-- MySQL Import
---------------------------------------------------------------

/*
LOAD DATA INFILE '/path/itk_general_ledger.csv'
INTO TABLE itk_general_ledger
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/path/ariba_general_ledger.csv'
INTO TABLE ariba_general_ledger
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
