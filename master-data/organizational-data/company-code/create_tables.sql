/*=============================================================
TABLE CREATION SCRIPT
Module : Company Code Validation
=============================================================*/

---------------------------------------------------------------
-- ITK Company Code Table
---------------------------------------------------------------

CREATE TABLE itk_company_code (

    bukrs VARCHAR(10),

    butxt VARCHAR(255),

    fstva VARCHAR(50),

    purchasing_unit VARCHAR(50),

    country_name VARCHAR(100)

);

---------------------------------------------------------------
-- Ariba Company Code Table
---------------------------------------------------------------

CREATE TABLE ariba_company_code (

    company_code_id VARCHAR(10),

    company_name VARCHAR(255),

    field_status_variant VARCHAR(50),

    purchasing_unit_id VARCHAR(50),

    country_unique_name VARCHAR(100)

);
