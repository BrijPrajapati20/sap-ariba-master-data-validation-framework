/*=============================================================
DATA IMPORT SCRIPT
Module : Procurement Unit Validation
=============================================================*/

---------------------------------------------------------------
-- SQL Server Import
---------------------------------------------------------------

BULK INSERT itk_procurement_unit
FROM 'C:\data\itk_procurement_unit.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

BULK INSERT ariba_procurement_unit
FROM 'C:\data\ariba_procurement_unit.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

---------------------------------------------------------------
-- MySQL Import
---------------------------------------------------------------

/*
LOAD DATA INFILE '/path/itk_procurement_unit.csv'
INTO TABLE itk_procurement_unit
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/path/ariba_procurement_unit.csv'
INTO TABLE ariba_procurement_unit
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
