/*=============================================================
TABLE CREATION SCRIPT
Module : Purchase Group Validation
=============================================================*/

---------------------------------------------------------------
-- ITK Purchase Group Table
---------------------------------------------------------------

CREATE TABLE itk_purchase_group (

    ekgrp VARCHAR(10),

    eknam VARCHAR(255),

    purchasing_unit VARCHAR(50)

);

---------------------------------------------------------------
-- Ariba Purchase Group Table
---------------------------------------------------------------

CREATE TABLE ariba_purchase_group (

    purchase_group_id VARCHAR(10),

    purchase_group_name VARCHAR(255),

    purchasing_unit_id VARCHAR(50)

);
