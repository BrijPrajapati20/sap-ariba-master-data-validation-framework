/*=============================================================
VALIDATION FRAMEWORK
Module : Currency Conversion Validation
=============================================================*/

---

## -- Missing In Ariba

SELECT
CONCAT(itk.fcurr,'-',itk.tcurr,'-',itk.kurst)
AS currency_pair,
'ERROR' AS validation_status,
'Currency Conversion missing in Ariba'
AS error_message
FROM itk_currency_conversion itk
LEFT JOIN ariba_currency_conversion ar
ON itk.fcurr = ar.from_currency
AND itk.tcurr = ar.to_currency
AND itk.kurst = ar.exchange_rate_type
AND itk.extdate = ar.exchange_date
WHERE ar.from_currency IS NULL;

---

## -- Extra In Ariba

SELECT
CONCAT(ar.from_currency,'-',ar.to_currency,'-',ar.exchange_rate_type)
AS currency_pair,
'ERROR' AS validation_status,
'Extra Currency Conversion found in Ariba'
AS error_message
FROM ariba_currency_conversion ar
LEFT JOIN itk_currency_conversion itk
ON ar.from_currency = itk.fcurr
AND ar.to_currency = itk.tcurr
AND ar.exchange_rate_type = itk.kurst
AND ar.exchange_date = itk.extdate
WHERE itk.fcurr IS NULL;

---

## -- Exchange Rate Mismatch

SELECT
CONCAT(itk.fcurr,'-',itk.tcurr)
AS currency_pair,
'ERROR' AS validation_status,
CONCAT(
'Rate mismatch | ITK:',
CAST(itk.extrate AS VARCHAR(50)),
' | Ariba:',
CAST(ar.exchange_rate AS VARCHAR(50))
)
AS error_message
FROM itk_currency_conversion itk
JOIN ariba_currency_conversion ar
ON itk.fcurr = ar.from_currency
AND itk.tcurr = ar.to_currency
AND itk.kurst = ar.exchange_rate_type
AND itk.extdate = ar.exchange_date
WHERE itk.extrate <> ar.exchange_rate;
