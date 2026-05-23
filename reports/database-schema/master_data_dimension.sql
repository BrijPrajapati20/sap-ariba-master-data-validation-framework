/*=============================================================
MASTER DATA DIMENSION TABLE
=============================================================*/

CREATE TABLE master_data_dimension (

    master_data_id INT IDENTITY(1,1),

    master_data_name VARCHAR(100),

    domain_name VARCHAR(100),

    source_system VARCHAR(50),

    target_system VARCHAR(50),

    validation_enabled VARCHAR(10),

    active_flag VARCHAR(10)

);
