/*=============================================================
TABLE CREATION SCRIPT
Module        : Purchase Organization Validation
Source System : SAP ITK
Target System : SAP Ariba
Database      : SQL Server / MySQL Compatible
=============================================================*/

---------------------------------------------------------------
-- ITK Purchase Organization Table
---------------------------------------------------------------

CREATE TABLE itk_purchase_org (
    ekorg      VARCHAR(10),
    ekotx      VARCHAR(255),
    bukrs      VARCHAR(10)
);

---------------------------------------------------------------
-- Ariba Purchase Organization Table
---------------------------------------------------------------

CREATE TABLE ariba_purchase_org (
    purchase_org_id     VARCHAR(10),
    description         VARCHAR(255),
    company_code        VARCHAR(10)
);
