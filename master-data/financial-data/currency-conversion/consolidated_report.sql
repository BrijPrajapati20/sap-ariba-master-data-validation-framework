/*=============================================================
CONSOLIDATED REPORT
Module : Currency Conversion Validation
=============================================================*/

SELECT * FROM (

SELECT
CONCAT(itk.fcurr,'-',itk.tcurr,'-',itk.kurst)
AS object_id,
'Missing In Ariba'
AS error_type
FROM itk_currency_conversion itk
LEFT JOIN ariba_currency_conversion ar
ON itk.fcurr = ar.from_currency
AND itk.tcurr = ar.to_currency
AND itk.kurst = ar.exchange_rate_type
AND itk.extdate = ar.exchange_date
WHERE ar.from_currency IS NULL

UNION ALL

SELECT
CONCAT(ar.from_currency,'-',ar.to_currency,'-',ar.exchange_rate_type),
'Extra In Ariba'
FROM ariba_currency_conversion ar
LEFT JOIN itk_currency_conversion itk
ON ar.from_currency = itk.fcurr
AND ar.to_currency = itk.tcurr
AND ar.exchange_rate_type = itk.kurst
AND ar.exchange_date = itk.extdate
WHERE itk.fcurr IS NULL

UNION ALL

SELECT
CONCAT(fcurr,'-',tcurr,'-',kurst),
'Duplicate FX Record'
FROM itk_currency_conversion
GROUP BY
fcurr,
tcurr,
kurst,
extdate
HAVING COUNT(*) > 1

) currency_conversion_validation_report;
