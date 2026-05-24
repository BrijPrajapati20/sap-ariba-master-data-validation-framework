/*=============================================================
TABLE CREATION SCRIPT
Module : ERP Commodity Code Validation
=============================================================*/

---------------------------------------------------------------
-- ITK ERP Commodity Code Table
---------------------------------------------------------------

CREATE TABLE itk_erp_commodity_code (

    matkl VARCHAR(20),

    wgbez VARCHAR(255)

);

---------------------------------------------------------------
-- Ariba ERP Commodity Code Table
---------------------------------------------------------------

CREATE TABLE ariba_erp_commodity_code (

    material_group_id VARCHAR(20),

    material_group_description VARCHAR(255)

);
