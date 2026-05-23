/*=============================================================
AUDIT FRAMEWORK
Enterprise Validation Audit Table
=============================================================*/

CREATE TABLE validation_audit_log (

    audit_id INT IDENTITY(1,1),

    validation_date DATETIME DEFAULT GETDATE(),

    master_data_name VARCHAR(100),

    validation_type VARCHAR(100),

    source_system VARCHAR(50),

    target_system VARCHAR(50),

    total_records INT,

    passed_records INT,

    failed_records INT,

    error_count INT,

    validation_status VARCHAR(20),

    execution_by VARCHAR(100)

);
