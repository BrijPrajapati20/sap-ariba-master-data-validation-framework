/*=============================================================
DATA IMPORT SCRIPT
Module : ERP Commodity Code Validation
=============================================================*/

---------------------------------------------------------------
-- SQL Server Import
---------------------------------------------------------------

BULK INSERT itk_erp_commodity_code
FROM 'C:\data\itk_erp_commodity_code.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

BULK INSERT ariba_erp_commodity_code
FROM 'C:\data\ariba_erp_commodity_code.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

---------------------------------------------------------------
-- MySQL Import
---------------------------------------------------------------

/*
LOAD DATA INFILE '/path/itk_erp_commodity_code.csv'
INTO TABLE itk_erp_commodity_code
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/path/ariba_erp_commodity_code.csv'
INTO TABLE ariba_erp_commodity_code
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
