/*=============================================================
DATA IMPORT SCRIPT
Module : Plant to Purchase Organization Mapping Validation
=============================================================*/

---------------------------------------------------------------
-- SQL Server Import
---------------------------------------------------------------

BULK INSERT itk_plant_purchase_org
FROM 'C:\data\itk_plant_purchase_org.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

BULK INSERT ariba_plant_purchase_org
FROM 'C:\data\ariba_plant_purchase_org.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

---------------------------------------------------------------
-- MySQL Import
---------------------------------------------------------------

/*
LOAD DATA INFILE '/path/itk_plant_purchase_org.csv'
INTO TABLE itk_plant_purchase_org
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/path/ariba_plant_purchase_org.csv'
INTO TABLE ariba_plant_purchase_org
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
