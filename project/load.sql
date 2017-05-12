-- Load the basketball statistics database. 
--Jahn Davis, CS342
--------------------------------------------

-- Drop the previous table declarations.
@&jrd58\drop         

-- Reload the table declarations.
@&jrd58\schema
commit;
-- Load the table data.
@&jrd58\data
commit;
