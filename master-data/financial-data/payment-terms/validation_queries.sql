/*=============================================================
VALIDATION FRAMEWORK
Module : Payment Terms Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Missing Payment Terms in Ariba
---------------------------------------------------------------

SELECT
    itk.unique_name AS payment_term_code,
    'ERROR' AS validation_status,
    'Payment Term missing in Ariba'
    AS error_message
FROM itk_payment_terms itk
LEFT JOIN ariba_payment_terms ar
    ON itk.unique_name = ar.payment_term_code
WHERE ar.payment_term_code IS NULL;

---------------------------------------------------------------
-- 2. Extra Payment Terms in Ariba
---------------------------------------------------------------

SELECT
    ar.payment_term_code,
    'ERROR' AS validation_status,
    'Extra Payment Term found in Ariba'
    AS error_message
FROM ariba_payment_terms ar
LEFT JOIN itk_payment_terms itk
    ON ar.payment_term_code = itk.unique_name
WHERE itk.unique_name IS NULL;

---------------------------------------------------------------
-- 3. Payment Term Description Mismatch
---------------------------------------------------------------

SELECT
    itk.unique_name,
    'ERROR' AS validation_status,
    CONCAT(
        'Payment Term Description mismatch | ITK: ',
        itk.description,
        ' | Ariba: ',
        ar.payment_term_description
    ) AS error_message
FROM itk_payment_terms itk
JOIN ariba_payment_terms ar
    ON itk.unique_name = ar.payment_term_code
WHERE ISNULL(itk.description, '')
   <> ISNULL(ar.payment_term_description, '');

---------------------------------------------------------------
-- 4. Discount Mismatch
---------------------------------------------------------------

SELECT
    itk.unique_name,
    'ERROR' AS validation_status,
    CONCAT(
        'Discount mismatch | ITK: ',
        itk.discount,
        ' | Ariba: ',
        ar.discount
    ) AS error_message
FROM itk_payment_terms itk
JOIN ariba_payment_terms ar
    ON itk.unique_name = ar.payment_term_code
WHERE ISNULL(itk.discount, 0)
   <> ISNULL(ar.discount, 0);

---------------------------------------------------------------
-- 5. Percentage Mismatch
---------------------------------------------------------------

SELECT
    itk.unique_name,
    'ERROR' AS validation_status,
    CONCAT(
        'Percentage mismatch | ITK: ',
        itk.percentage,
        ' | Ariba: ',
        ar.percentage
    ) AS error_message
FROM itk_payment_terms itk
JOIN ariba_payment_terms ar
    ON itk.unique_name = ar.payment_term_code
WHERE ISNULL(itk.percentage, 0)
   <> ISNULL(ar.percentage, 0);

---------------------------------------------------------------
-- 6. Duplicate Payment Terms in ITK
---------------------------------------------------------------

SELECT
    unique_name,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Payment Term found in ITK'
    AS error_message
FROM itk_payment_terms
GROUP BY unique_name
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 7. Duplicate Payment Terms in Ariba
---------------------------------------------------------------

SELECT
    payment_term_code,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Payment Term found in Ariba'
    AS error_message
FROM ariba_payment_terms
GROUP BY payment_term_code
HAVING COUNT(*) > 1;
