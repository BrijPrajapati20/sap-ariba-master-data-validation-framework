/*=============================================================
DATA IMPORT SCRIPT
Module        : Purchase Organization Validation
=============================================================*/

---------------------------------------------------------------
-- SQL Server (SSMS)
---------------------------------------------------------------

BULK INSERT itk_purchase_org
FROM 'C:\data\itk_purchase_org.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

BULK INSERT ariba_purchase_org
FROM 'C:\data\ariba_purchase_org.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

---------------------------------------------------------------
-- MySQL
---------------------------------------------------------------

/*
LOAD DATA INFILE '/path/itk_purchase_org.csv'
INTO TABLE itk_purchase_org
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/path/ariba_purchase_org.csv'
INTO TABLE ariba_purchase_org
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
