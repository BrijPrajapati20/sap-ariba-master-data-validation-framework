/*=============================================================
REGION DIMENSION TABLE
=============================================================*/

CREATE TABLE region_dimension (

    region_id INT IDENTITY(1,1),

    region_name VARCHAR(100),

    country_name VARCHAR(100),

    country_code VARCHAR(10),

    active_flag VARCHAR(10)

);
