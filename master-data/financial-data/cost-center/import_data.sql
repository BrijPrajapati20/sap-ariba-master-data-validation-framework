/*=============================================================
DATA IMPORT SCRIPT
Module : Cost Center Validation
=============================================================*/

---------------------------------------------------------------
-- SQL Server Import
---------------------------------------------------------------

BULK INSERT itk_cost_center
FROM 'C:\data\itk_cost_center.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

BULK INSERT ariba_cost_center
FROM 'C:\data\ariba_cost_center.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

---------------------------------------------------------------
-- MySQL Import
---------------------------------------------------------------

/*
LOAD DATA INFILE '/path/itk_cost_center.csv'
INTO TABLE itk_cost_center
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/path/ariba_cost_center.csv'
INTO TABLE ariba_cost_center
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
