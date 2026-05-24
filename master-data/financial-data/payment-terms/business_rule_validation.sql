/*=============================================================
BUSINESS RULE VALIDATION
Module : Payment Terms Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Negative Discount Validation
---------------------------------------------------------------

SELECT
    unique_name,
    'ERROR' AS validation_status,
    'Negative discount value found'
    AS error_message
FROM itk_payment_terms
WHERE discount < 0;

---------------------------------------------------------------
-- 2. Discount Greater than 100
---------------------------------------------------------------

SELECT
    unique_name,
    'ERROR' AS validation_status,
    'Discount value greater than 100%'
    AS error_message
FROM itk_payment_terms
WHERE discount > 100;

---------------------------------------------------------------
-- 3. Percentage Greater than 100
---------------------------------------------------------------

SELECT
    unique_name,
    'ERROR' AS validation_status,
    'Percentage value greater than 100%'
    AS error_message
FROM itk_payment_terms
WHERE percentage > 100;

---------------------------------------------------------------
-- 4. NULL Percentage Validation
---------------------------------------------------------------

SELECT
    unique_name,
    'ERROR' AS validation_status,
    'Percentage is NULL'
    AS error_message
FROM itk_payment_terms
WHERE percentage IS NULL;

---------------------------------------------------------------
-- 5. NULL Discount Validation
---------------------------------------------------------------

SELECT
    unique_name,
    'WARNING' AS validation_status,
    'Discount value is NULL'
    AS error_message
FROM itk_payment_terms
WHERE discount IS NULL;
