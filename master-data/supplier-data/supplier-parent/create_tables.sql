/*=============================================================
TABLE CREATION SCRIPT
Module : Supplier Parent Validation
=============================================================*/

CREATE TABLE itk_supplier_parent (

    vendor_id VARCHAR(100),
    postal_code VARCHAR(50),
    regio VARCHAR(50),
    country VARCHAR(20),
    state_name VARCHAR(100),
    country_unique_name VARCHAR(100),
    supplier_address VARCHAR(500),
    supplier_name VARCHAR(255),
    city VARCHAR(100),
    street VARCHAR(255),
    address_id VARCHAR(100),
    preferred_language VARCHAR(50)

);

CREATE TABLE ariba_supplier_parent (

    vendor_id VARCHAR(100),
    postal_code VARCHAR(50),
    regio VARCHAR(50),
    country VARCHAR(20),
    state_name VARCHAR(100),
    country_unique_name VARCHAR(100),
    supplier_address VARCHAR(500),
    supplier_name VARCHAR(255),
    city VARCHAR(100),
    street VARCHAR(255),
    address_id VARCHAR(100),
    preferred_language VARCHAR(50)

);
