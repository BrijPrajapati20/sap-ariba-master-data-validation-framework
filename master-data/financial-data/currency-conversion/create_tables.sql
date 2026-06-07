/*=============================================================
TABLE CREATION SCRIPT
Module : Currency Conversion Validation
=============================================================*/

CREATE TABLE itk_currency_conversion (

```
fcurr VARCHAR(10),

tcurr VARCHAR(10),

kurst VARCHAR(20),

extdate DATE,

extrate DECIMAL(18,8)
```

);

CREATE TABLE ariba_currency_conversion (

```
from_currency VARCHAR(10),

to_currency VARCHAR(10),

exchange_rate_type VARCHAR(20),

exchange_date DATE,

exchange_rate DECIMAL(18,8)
```

);
