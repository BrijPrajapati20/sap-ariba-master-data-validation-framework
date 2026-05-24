/*=============================================================
TABLE CREATION SCRIPT
Module : MGGL Combo Validation
=============================================================*/

---------------------------------------------------------------
-- ITK MGGL Combo Table
---------------------------------------------------------------

CREATE TABLE itk_mggl_combo (

    unique_name VARCHAR(100),

    gl_number VARCHAR(50)

);

---------------------------------------------------------------
-- Ariba MGGL Combo Table
---------------------------------------------------------------

CREATE TABLE ariba_mggl_combo (

    material_group_id VARCHAR(100),

    gl_account_number VARCHAR(50)

);
