/*=============================================================
VALIDATION FRAMEWORK
Module : MGGL Combo Validation
=============================================================*/

---------------------------------------------------------------
-- 1. Missing MGGL Mapping in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(itk.unique_name, '-', itk.gl_number)
    AS mapping_identifier,
    'ERROR' AS validation_status,
    'MGGL Mapping missing in Ariba'
    AS error_message
FROM itk_mggl_combo itk
LEFT JOIN ariba_mggl_combo ar
    ON itk.unique_name = ar.material_group_id
   AND itk.gl_number = ar.gl_account_number
WHERE ar.material_group_id IS NULL;

---------------------------------------------------------------
-- 2. Extra MGGL Mapping in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(ar.material_group_id, '-', ar.gl_account_number)
    AS mapping_identifier,
    'ERROR' AS validation_status,
    'Extra MGGL Mapping found in Ariba'
    AS error_message
FROM ariba_mggl_combo ar
LEFT JOIN itk_mggl_combo itk
    ON ar.material_group_id = itk.unique_name
   AND ar.gl_account_number = itk.gl_number
WHERE itk.unique_name IS NULL;

---------------------------------------------------------------
-- 3. GL Account Mismatch
---------------------------------------------------------------

SELECT
    itk.unique_name AS material_group_id,
    'ERROR' AS validation_status,
    CONCAT(
        'GL Account mismatch | ITK: ',
        itk.gl_number,
        ' | Ariba: ',
        ar.gl_account_number
    ) AS error_message
FROM itk_mggl_combo itk
JOIN ariba_mggl_combo ar
    ON itk.unique_name = ar.material_group_id
WHERE ISNULL(itk.gl_number, '')
   <> ISNULL(ar.gl_account_number, '');

---------------------------------------------------------------
-- 4. Duplicate MGGL Records in ITK
---------------------------------------------------------------

SELECT
    CONCAT(unique_name, '-', gl_number)
    AS mapping_identifier,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate MGGL Mapping found in ITK'
    AS error_message
FROM itk_mggl_combo
GROUP BY unique_name, gl_number
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- 5. Duplicate MGGL Records in Ariba
---------------------------------------------------------------

SELECT
    CONCAT(material_group_id, '-', gl_account_number)
    AS mapping_identifier,
    COUNT(*) AS duplicate_count,
    'ERROR' AS validation_status,
    'Duplicate MGGL Mapping found in Ariba'
    AS error_message
FROM ariba_mggl_combo
GROUP BY material_group_id, gl_account_number
HAVING COUNT(*) > 1;
