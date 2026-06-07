/*=============================================================
TABLE CREATION SCRIPT
Module : Supplier Location Validation
=============================================================*/

CREATE TABLE itk_supplier_location (

    supplier_id VARCHAR(100),

    location_id VARCHAR(100),

    supplier_name VARCHAR(255),

    address_line VARCHAR(500),

    city VARCHAR(100),

    state_name VARCHAR(100),

    postal_code VARCHAR(50),

    country_code VARCHAR(20)

);

CREATE TABLE ariba_supplier_location (

    supplier_id VARCHAR(100),

    location_id VARCHAR(100),

    supplier_name VARCHAR(255),

    address_line VARCHAR(500),

    city VARCHAR(100),

    state_name VARCHAR(100),

    postal_code VARCHAR(50),

    country_code VARCHAR(20)

);
