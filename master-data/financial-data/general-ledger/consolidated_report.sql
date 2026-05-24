/*=============================================================
CONSOLIDATED VALIDATION REPORT
Module : General Ledger Validation
=============================================================*/

SELECT * FROM (

    -----------------------------------------------------------
    -- Missing GL Accounts
    -----------------------------------------------------------

    SELECT
        CONCAT(itk.saknr, '-', itk.bukrs) AS object_id,
        'Missing in Ariba' AS error_type
    FROM itk_general_ledger itk
    LEFT JOIN ariba_general_ledger ar
        ON itk.saknr = ar.gl_account_number
       AND itk.bukrs = ar.company_code
    WHERE ar.gl_account_number IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Extra GL Accounts
    -----------------------------------------------------------

    SELECT
        CONCAT(ar.gl_account_number, '-', ar.company_code),
        'Extra Record in Ariba'
    FROM ariba_general_ledger ar
    LEFT JOIN itk_general_ledger itk
        ON ar.gl_account_number = itk.saknr
       AND ar.company_code = itk.bukrs
    WHERE itk.saknr IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Field Status Group Mismatch
    -----------------------------------------------------------

    SELECT
        CONCAT(itk.saknr, '-', itk.bukrs),
        'Field Status Group Mismatch'
    FROM itk_general_ledger itk
    JOIN ariba_general_ledger ar
        ON itk.saknr = ar.gl_account_number
       AND itk.bukrs = ar.company_code
    WHERE ISNULL(itk.fstag, '')
       <> ISNULL(ar.field_status_group, '')

    UNION ALL

    -----------------------------------------------------------
    -- GL Description Mismatch
    -----------------------------------------------------------

    SELECT
        CONCAT(itk.saknr, '-', itk.bukrs),
        'GL Description Mismatch'
    FROM itk_general_ledger itk
    JOIN ariba_general_ledger ar
        ON itk.saknr = ar.gl_account_number
       AND itk.bukrs = ar.company_code
    WHERE ISNULL(itk.txt50, '')
       <> ISNULL(ar.gl_description, '')

) general_ledger_validation_report;
