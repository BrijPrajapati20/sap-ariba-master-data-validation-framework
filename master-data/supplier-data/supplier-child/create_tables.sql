/*=============================================================
TABLE CREATION SCRIPT
Module : Supplier Child Validation
=============================================================*/

CREATE TABLE itk_supplier_child (

    vendor_id VARCHAR(100),
    postal_code VARCHAR(50),
    regio VARCHAR(50),
    country VARCHAR(20),
    state_name VARCHAR(100),
    country_unique_name VARCHAR(100),
    supplier_address VARCHAR(500),
    supplier_name VARCHAR(255),
    city VARCHAR(100),
    street VARCHAR(255)

);

CREATE TABLE ariba_supplier_child (

    vendor_id VARCHAR(100),
    postal_code VARCHAR(50),
    regio VARCHAR(50),
    country VARCHAR(20),
    state_name VARCHAR(100),
    country_unique_name VARCHAR(100),
    supplier_address VARCHAR(500),
    supplier_name VARCHAR(255),
    city VARCHAR(100),
    street VARCHAR(255)

);
