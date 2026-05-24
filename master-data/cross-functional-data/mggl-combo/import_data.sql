/*=============================================================
DATA IMPORT SCRIPT
Module : MGGL Combo Validation
=============================================================*/

---------------------------------------------------------------
-- SQL Server Import
---------------------------------------------------------------

BULK INSERT itk_mggl_combo
FROM 'C:\data\itk_mggl_combo.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

BULK INSERT ariba_mggl_combo
FROM 'C:\data\ariba_mggl_combo.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

---------------------------------------------------------------
-- MySQL Import
---------------------------------------------------------------

/*
LOAD DATA INFILE '/path/itk_mggl_combo.csv'
INTO TABLE itk_mggl_combo
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/path/ariba_mggl_combo.csv'
INTO TABLE ariba_mggl_combo
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
