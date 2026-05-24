/*=============================================================
DNU CLEANUP FRAMEWORK
Module : Relation Entries - Plant Validation
=============================================================*/

---------------------------------------------------------------
-- Remove DNU / Delete Records
---------------------------------------------------------------

DELETE FROM itk_relation_entries_plant
WHERE left_id IN (
    SELECT left_id
    FROM itk_relation_entries_plant_delete
);

---------------------------------------------------------------
-- Validate Remaining Active Records
---------------------------------------------------------------

SELECT *
FROM itk_relation_entries_plant;
