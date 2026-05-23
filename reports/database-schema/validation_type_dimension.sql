/*=============================================================
VALIDATION TYPE DIMENSION TABLE
=============================================================*/

CREATE TABLE validation_type_dimension (

    validation_type_id INT IDENTITY(1,1),

    validation_type VARCHAR(100),

    severity VARCHAR(20),

    business_impact VARCHAR(500)

);
