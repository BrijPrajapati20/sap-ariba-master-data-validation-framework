/*=============================================================
TABLE CREATION SCRIPT
Module : Procurement Unit Validation
=============================================================*/

---------------------------------------------------------------
-- ITK Procurement Unit Table
---------------------------------------------------------------

CREATE TABLE itk_procurement_unit (

    cocode VARCHAR(10),

    text VARCHAR(255),

    parent VARCHAR(100)

);

---------------------------------------------------------------
-- Ariba Procurement Unit Table
---------------------------------------------------------------

CREATE TABLE ariba_procurement_unit (

    company_code VARCHAR(10),

    procurement_unit_name VARCHAR(255),

    parent_relationship VARCHAR(100)

);
