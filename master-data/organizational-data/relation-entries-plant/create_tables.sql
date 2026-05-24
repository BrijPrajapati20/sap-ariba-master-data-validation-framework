/*=============================================================
TABLE CREATION SCRIPT
Module : Relation Entries - Plant Validation
=============================================================*/

---------------------------------------------------------------
-- ITK Relation Entries Plant Table
---------------------------------------------------------------

CREATE TABLE itk_relation_entries_plant (

    right_id VARCHAR(50),

    left_id VARCHAR(50),

    right_key1 VARCHAR(100),

    relation_type VARCHAR(100),

    left_key1 VARCHAR(100)

);

---------------------------------------------------------------
-- ITK Delete / DNU Table
---------------------------------------------------------------

CREATE TABLE itk_relation_entries_plant_delete (

    left_id VARCHAR(50)

);

---------------------------------------------------------------
-- Ariba Relation Entries Plant Table
---------------------------------------------------------------

CREATE TABLE ariba_relation_entries_plant (

    company_code VARCHAR(50),

    plant_id VARCHAR(50),

    right_key1 VARCHAR(100),

    relation_type VARCHAR(100),

    left_key1 VARCHAR(100)

);
