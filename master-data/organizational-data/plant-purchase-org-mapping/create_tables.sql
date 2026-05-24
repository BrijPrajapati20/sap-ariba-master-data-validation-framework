/*=============================================================
TABLE CREATION SCRIPT
Module : Plant to Purchase Organization Mapping Validation
=============================================================*/

---------------------------------------------------------------
-- ITK Plant to Purchase Org Mapping Table
---------------------------------------------------------------

CREATE TABLE itk_plant_purchase_org (

    werks VARCHAR(10),

    ekorg VARCHAR(10)

);

---------------------------------------------------------------
-- Ariba Plant to Purchase Org Mapping Table
---------------------------------------------------------------

CREATE TABLE ariba_plant_purchase_org (

    plant_id VARCHAR(10),

    purchase_org_id VARCHAR(10)

);
