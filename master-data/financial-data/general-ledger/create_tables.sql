/*=============================================================
TABLE CREATION SCRIPT
Module : General Ledger Validation
=============================================================*/

---------------------------------------------------------------
-- ITK General Ledger Table
---------------------------------------------------------------

CREATE TABLE itk_general_ledger (

    saknr VARCHAR(20),

    bukrs VARCHAR(10),

    fstag VARCHAR(50),

    xloeb VARCHAR(5),

    xspeb VARCHAR(5),

    txt50 VARCHAR(255)

);

---------------------------------------------------------------
-- Ariba General Ledger Table
---------------------------------------------------------------

CREATE TABLE ariba_general_ledger (

    gl_account_number VARCHAR(20),

    company_code VARCHAR(10),

    field_status_group VARCHAR(50),

    mark_for_deletion VARCHAR(5),

    blocked_for_posting VARCHAR(5),

    gl_description VARCHAR(255)

);
