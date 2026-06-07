/*=============================================================
TABLE CREATION SCRIPT
Module : WBS Validation
=============================================================*/

CREATE TABLE itk_wbs (

    wbs_id VARCHAR(100),

    company_code VARCHAR(20),

    wbs_description VARCHAR(255),

    cost_center_id VARCHAR(100),

    wbs_type VARCHAR(100),

    project_type VARCHAR(100),

    cost_center_company_code VARCHAR(20)

);

CREATE TABLE ariba_wbs (

    wbs_id VARCHAR(100),

    company_code VARCHAR(20),

    wbs_description VARCHAR(255),

    cost_center_id VARCHAR(100),

    wbs_type VARCHAR(100),

    project_type VARCHAR(100),

    cost_center_company_code VARCHAR(20)

);
