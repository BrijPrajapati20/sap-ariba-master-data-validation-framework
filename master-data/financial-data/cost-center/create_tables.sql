/*=============================================================
TABLE CREATION SCRIPT
Module : Cost Center Validation
=============================================================*/

---------------------------------------------------------------
-- ITK Cost Center Table
---------------------------------------------------------------

CREATE TABLE itk_cost_center (

    kostl VARCHAR(50),

    bukrs VARCHAR(10),

    verak_user VARCHAR(100),

    waers VARCHAR(10),

    ktext VARCHAR(255),

    ltext VARCHAR(255),

    purchasing_unit VARCHAR(50),

    zzalias VARCHAR(100),

    cus_service_area VARCHAR(100),

    cus_service_line VARCHAR(100)

);

---------------------------------------------------------------
-- Ariba Cost Center Table
---------------------------------------------------------------

CREATE TABLE ariba_cost_center (

    cost_center_id VARCHAR(50),

    company_code VARCHAR(10),

    responsible_user VARCHAR(100),

    currency_code VARCHAR(10),

    ktext VARCHAR(255),

    purchasing_unit VARCHAR(50),

    alias_name VARCHAR(100),

    service_area VARCHAR(100),

    service_line VARCHAR(100)

);
