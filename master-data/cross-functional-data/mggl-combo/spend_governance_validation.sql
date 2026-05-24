/*=============================================================
SPEND GOVERNANCE VALIDATION
Module : MGGL Combo Validation
=============================================================*/

---------------------------------------------------------------
-- 1. NULL Material Group Validation
---------------------------------------------------------------

SELECT
    unique_name,
    gl_number,
    'ERROR' AS validation_status,
    'Material Group is NULL or Blank'
    AS error_message
FROM itk_mggl_combo
WHERE unique_name IS NULL
   OR TRIM(unique_name) = '';

---------------------------------------------------------------
-- 2. NULL GL Account Validation
---------------------------------------------------------------

SELECT
    unique_name,
    gl_number,
    'ERROR' AS validation_status,
    'GL Account Number is NULL or Blank'
    AS error_message
FROM itk_mggl_combo
WHERE gl_number IS NULL
   OR TRIM(gl_number) = '';

---------------------------------------------------------------
-- 3. Invalid GL Account Length
---------------------------------------------------------------

SELECT
    unique_name,
    gl_number,
    'WARNING' AS validation_status,
    'Potential invalid GL Account length'
    AS error_message
FROM itk_mggl_combo
WHERE LEN(gl_number) < 4;

---------------------------------------------------------------
-- 4. Duplicate Spend Mapping
---------------------------------------------------------------

SELECT
    unique_name,
    gl_number,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate Material Group to GL mapping found'
    AS error_message
FROM itk_mggl_combo
GROUP BY unique_name, gl_number
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 5. One Material Group mapped to Multiple GLs
---------------------------------------------------------------

SELECT
    unique_name,
    COUNT(DISTINCT gl_number) AS gl_count,
    'WARNING' AS validation_status,
    'Material Group mapped to multiple GL Accounts'
    AS error_message
FROM itk_mggl_combo
GROUP BY unique_name
HAVING COUNT(DISTINCT gl_number) > 1;
