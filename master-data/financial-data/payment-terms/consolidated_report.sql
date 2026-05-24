/*=============================================================
CONSOLIDATED VALIDATION REPORT
Module : Payment Terms Validation
=============================================================*/

SELECT * FROM (

    -----------------------------------------------------------
    -- Missing Records
    -----------------------------------------------------------

    SELECT
        itk.unique_name AS object_id,
        'Missing in Ariba' AS error_type
    FROM itk_payment_terms itk
    LEFT JOIN ariba_payment_terms ar
        ON itk.unique_name = ar.payment_term_code
    WHERE ar.payment_term_code IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Extra Records
    -----------------------------------------------------------

    SELECT
        ar.payment_term_code,
        'Extra Record in Ariba'
    FROM ariba_payment_terms ar
    LEFT JOIN itk_payment_terms itk
        ON ar.payment_term_code = itk.unique_name
    WHERE itk.unique_name IS NULL

    UNION ALL

    -----------------------------------------------------------
    -- Description Mismatch
    -----------------------------------------------------------

    SELECT
        itk.unique_name,
        'Description Mismatch'
    FROM itk_payment_terms itk
    JOIN ariba_payment_terms ar
        ON itk.unique_name = ar.payment_term_code
    WHERE ISNULL(itk.description, '')
       <> ISNULL(ar.payment_term_description, '')

    UNION ALL

    -----------------------------------------------------------
    -- Discount Mismatch
    -----------------------------------------------------------

    SELECT
        itk.unique_name,
        'Discount Mismatch'
    FROM itk_payment_terms itk
    JOIN ariba_payment_terms ar
        ON itk.unique_name = ar.payment_term_code
    WHERE ISNULL(itk.discount, 0)
       <> ISNULL(ar.discount, 0)

    UNION ALL

    -----------------------------------------------------------
    -- Percentage Mismatch
    -----------------------------------------------------------

    SELECT
        itk.unique_name,
        'Percentage Mismatch'
    FROM itk_payment_terms itk
    JOIN ariba_payment_terms ar
        ON itk.unique_name = ar.payment_term_code
    WHERE ISNULL(itk.percentage, 0)
       <> ISNULL(ar.percentage, 0)

) payment_terms_validation_report;
