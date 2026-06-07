/*=============================================================
TABLE CREATION SCRIPT
Module : Users Parent Validation
=============================================================*/

CREATE TABLE itk_users_parent (

    ariba_id VARCHAR(255),

    sap_id VARCHAR(255),

    user_name VARCHAR(255),

    email_address VARCHAR(255),

    default_currency VARCHAR(50),

    locale_id VARCHAR(100),

    city VARCHAR(100),

    country VARCHAR(100),

    state_name VARCHAR(100),

    postal_code VARCHAR(50),

    personnel_id VARCHAR(100),

    group_name VARCHAR(255),

    role_name VARCHAR(255),

    timezone_id VARCHAR(100)

);

CREATE TABLE ariba_users_parent (

    ariba_id VARCHAR(255),

    sap_id VARCHAR(255),

    user_name VARCHAR(255),

    email_address VARCHAR(255),

    default_currency VARCHAR(50),

    locale_id VARCHAR(100),

    city VARCHAR(100),

    country VARCHAR(100),

    state_name VARCHAR(100),

    postal_code VARCHAR(50),

    personnel_id VARCHAR(100),

    group_name VARCHAR(255),

    role_name VARCHAR(255),

    timezone_id VARCHAR(100)

);
