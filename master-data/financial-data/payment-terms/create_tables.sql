/*=============================================================
TABLE CREATION SCRIPT
Module : Payment Terms Validation
=============================================================*/

---------------------------------------------------------------
-- ITK Payment Terms Table
---------------------------------------------------------------

CREATE TABLE itk_payment_terms (

    unique_name VARCHAR(50),

    description VARCHAR(255),

    discount DECIMAL(10,2),

    percentage DECIMAL(10,2)

);

---------------------------------------------------------------
-- Ariba Payment Terms Table
---------------------------------------------------------------

CREATE TABLE ariba_payment_terms (

    payment_term_code VARCHAR(50),

    payment_term_description VARCHAR(255),

    discount DECIMAL(10,2),

    percentage DECIMAL(10,2)

);
