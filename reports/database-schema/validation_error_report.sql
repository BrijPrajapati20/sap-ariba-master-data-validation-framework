/*=============================================================
VALIDATION ERROR REPORT TABLE
=============================================================*/

CREATE TABLE validation_error_report (

    error_id INT IDENTITY(1,1),

    validation_date DATETIME DEFAULT GETDATE(),

    master_data_name VARCHAR(100),

    validation_type VARCHAR(100),

    validation_status VARCHAR(20),

    source_system VARCHAR(50),

    target_system VARCHAR(50),

    object_id VARCHAR(255),

    source_value VARCHAR(500),

    target_value VARCHAR(500),

    error_message VARCHAR(1000),

    region_name VARCHAR(100),

    severity VARCHAR(20),

    execution_by VARCHAR(100)

);
