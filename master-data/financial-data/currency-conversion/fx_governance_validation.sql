/*=============================================================
FX GOVERNANCE VALIDATION
Module : Currency Conversion Validation
=============================================================*/

---

## -- Blank Currency Validation

SELECT
fcurr,
tcurr,
'ERROR' AS validation_status,
'Currency code is blank'
AS error_message
FROM itk_currency_conversion
WHERE fcurr IS NULL
OR tcurr IS NULL;

---

## -- Blank Exchange Rate

SELECT
fcurr,
tcurr,
'ERROR' AS validation_status,
'Exchange Rate is blank'
AS error_message
FROM itk_currency_conversion
WHERE extrate IS NULL;

---

## -- Invalid Exchange Rate

SELECT
fcurr,
tcurr,
extrate,
'ERROR' AS validation_status,
'Exchange Rate must be greater than zero'
AS error_message
FROM itk_currency_conversion
WHERE extrate <= 0;

---

## -- Blank Exchange Date

SELECT
fcurr,
tcurr,
'ERROR' AS validation_status,
'Exchange Date is blank'
AS error_message
FROM itk_currency_conversion
WHERE extdate IS NULL;

---

## -- Duplicate FX Records

SELECT
fcurr,
tcurr,
kurst,
extdate,
COUNT(*) AS duplicate_count,
'ERROR' AS validation_status,
'Duplicate FX record found'
AS error_message
FROM itk_currency_conversion
GROUP BY
fcurr,
tcurr,
kurst,
extdate
HAVING COUNT(*) > 1;
