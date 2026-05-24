/*=============================================================
VALIDATION FRAMEWORK
Module : General Ledger Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Missing GL Accounts in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(itk.saknr, '-', itk.bukrs) AS gl_identifier,
    'ERROR' AS validation_status,
    'GL Account missing in Ariba'
    AS error_message
FROM itk_general_ledger itk
LEFT JOIN ariba_general_ledger ar
    ON itk.saknr = ar.gl_account_number
   AND itk.bukrs = ar.company_code
WHERE ar.gl_account_number IS NULL;

---------------------------------------------------------------
-- 2. Extra GL Accounts in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(ar.gl_account_number, '-', ar.company_code)
    AS gl_identifier,
    'ERROR' AS validation_status,
    'Extra GL Account found in Ariba'
    AS error_message
FROM ariba_general_ledger ar
LEFT JOIN itk_general_ledger itk
    ON ar.gl_account_number = itk.saknr
   AND ar.company_code = itk.bukrs
WHERE itk.saknr IS NULL;

---------------------------------------------------------------
-- 3. Field Status Group Mismatch
---------------------------------------------------------------

SELECT
    CONCAT(itk.saknr, '-', itk.bukrs) AS gl_identifier,
    'ERROR' AS validation_status,
    CONCAT(
        'Field Status Group mismatch | ITK: ',
        itk.fstag,
        ' | Ariba: ',
        ar.field_status_group
    ) AS error_message
FROM itk_general_ledger itk
JOIN ariba_general_ledger ar
    ON itk.saknr = ar.gl_account_number
   AND itk.bukrs = ar.company_code
WHERE ISNULL(itk.fstag, '')
   <> ISNULL(ar.field_status_group, '');

---------------------------------------------------------------
-- 4. GL Description Mismatch
---------------------------------------------------------------

SELECT
    CONCAT(itk.saknr, '-', itk.bukrs) AS gl_identifier,
    'ERROR' AS validation_status,
    CONCAT(
        'GL Description mismatch | ITK: ',
        itk.txt50,
        ' | Ariba: ',
        ar.gl_description
    ) AS error_message
FROM itk_general_ledger itk
JOIN ariba_general_ledger ar
    ON itk.saknr = ar.gl_account_number
   AND itk.bukrs = ar.company_code
WHERE ISNULL(itk.txt50, '')
   <> ISNULL(ar.gl_description, '');

---------------------------------------------------------------
-- 5. Duplicate GL Accounts in ITK
---------------------------------------------------------------

SELECT
    CONCAT(saknr, '-', bukrs) AS gl_identifier,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate GL Account found in ITK'
    AS error_message
FROM itk_general_ledger
GROUP BY saknr, bukrs
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 6. Duplicate GL Accounts in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(gl_account_number, '-', company_code)
    AS gl_identifier,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate GL Account found in Ariba'
    AS error_message
FROM ariba_general_ledger
GROUP BY gl_account_number, company_code
HAVING COUNT(*) > 1;
