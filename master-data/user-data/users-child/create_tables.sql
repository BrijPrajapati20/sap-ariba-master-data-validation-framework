/*=============================================================
TABLE CREATION SCRIPT
Module : Users Child Validation
=============================================================*/

CREATE TABLE itk_users_child (

    ariba_id VARCHAR(255),
    sap_id VARCHAR(255),
    user_name VARCHAR(255),
    email_address VARCHAR(255),

    default_ship_to VARCHAR(255),
    plant VARCHAR(100),
    cost_center VARCHAR(100),
    purchase_org VARCHAR(100),
    company_code VARCHAR(100),
    purchase_group VARCHAR(100),

    city VARCHAR(100),
    country VARCHAR(100),
    state_name VARCHAR(100),
    postal_code VARCHAR(50),

    personnel_id VARCHAR(100),
    group_name VARCHAR(255),
    role_name VARCHAR(255),
    timezone_id VARCHAR(100)

);

CREATE TABLE ariba_users_child (

    ariba_id VARCHAR(255),
    sap_id VARCHAR(255),
    user_name VARCHAR(255),
    email_address VARCHAR(255),

    default_ship_to VARCHAR(255),
    plant VARCHAR(100),
    cost_center VARCHAR(100),
    purchase_org VARCHAR(100),
    company_code VARCHAR(100),
    purchase_group VARCHAR(100),

    city VARCHAR(100),
    country VARCHAR(100),
    state_name VARCHAR(100),
    postal_code VARCHAR(50),

    personnel_id VARCHAR(100),
    group_name VARCHAR(255),
    role_name VARCHAR(255),
    timezone_id VARCHAR(100)

);
