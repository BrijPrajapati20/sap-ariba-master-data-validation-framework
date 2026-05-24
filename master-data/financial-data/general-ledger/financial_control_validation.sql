/*=============================================================
FINANCIAL CONTROL VALIDATION
Module : General Ledger Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Marked for Deletion Validation
---------------------------------------------------------------

SELECT
    saknr,
    bukrs,
    'WARNING' AS validation_status,
    'GL Account marked for deletion'
    AS error_message
FROM itk_general_ledger
WHERE xloeb = 'X';

---------------------------------------------------------------
-- 2. Blocked for Posting Validation
---------------------------------------------------------------

SELECT
    saknr,
    bukrs,
    'WARNING' AS validation_status,
    'GL Account blocked for posting'
    AS error_message
FROM itk_general_ledger
WHERE xspeb = 'X';

---------------------------------------------------------------
-- 3. Missing Field Status Group
---------------------------------------------------------------

SELECT
    saknr,
    bukrs,
    'ERROR' AS validation_status,
    'Field Status Group is missing'
    AS error_message
FROM itk_general_ledger
WHERE fstag IS NULL
   OR TRIM(fstag) = '';

---------------------------------------------------------------
-- 4. Invalid Company Code Length
---------------------------------------------------------------

SELECT
    bukrs,
    'ERROR' AS validation_status,
    'Invalid Company Code Length'
    AS error_message
FROM itk_general_ledger
WHERE LEN(bukrs) <> 4;

---------------------------------------------------------------
-- 5. Invalid GL Account Length
---------------------------------------------------------------

SELECT
    saknr,
    'WARNING' AS validation_status,
    'Potential invalid GL Account length'
    AS error_message
FROM itk_general_ledger
WHERE LEN(saknr) < 4;
