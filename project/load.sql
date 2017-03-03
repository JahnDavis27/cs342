-- Load the basketball statistics database. 

-- Drop the previous table declarations.
@&jrd58\drop         
commit;
-- Reload the table declarations.
@&jrd58\schema
commit;
-- Load the table data.
@&jrd58\data
commit;
