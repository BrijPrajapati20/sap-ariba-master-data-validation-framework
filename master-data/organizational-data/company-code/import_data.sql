/*=============================================================
DATA IMPORT SCRIPT
Module : Company Code Validation
=============================================================*/

---------------------------------------------------------------
-- SQL Server Import
---------------------------------------------------------------

BULK INSERT itk_company_code
FROM 'C:\data\itk_company_code.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

BULK INSERT ariba_company_code
FROM 'C:\data\ariba_company_code.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

---------------------------------------------------------------
-- MySQL Import
---------------------------------------------------------------

/*
LOAD DATA INFILE '/path/itk_company_code.csv'
INTO TABLE itk_company_code
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/path/ariba_company_code.csv'
INTO TABLE ariba_company_code
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
