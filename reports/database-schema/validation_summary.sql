/*=============================================================
VALIDATION SUMMARY TABLE
=============================================================*/

CREATE TABLE validation_summary (

    summary_id INT IDENTITY(1,1),

    validation_date DATETIME DEFAULT GETDATE(),

    master_data_name VARCHAR(100),

    source_system VARCHAR(50),

    target_system VARCHAR(50),

    total_records INT,

    passed_records INT,

    failed_records INT,

    duplicate_records INT,

    missing_records INT,

    mismatch_records INT,

    validation_accuracy DECIMAL(5,2),

    region_name VARCHAR(100),

    execution_by VARCHAR(100)

);
