DESCRIBE SELECT * FROM duckdb_extensions();

SELECT extension_name, loaded, installed 
FROM duckdb_extensions()
ORDER BY installed DESC, loaded DESC;

INSTALL httpfs; 
LOAD httpfs;

select current_setting('memory_limit');

SET memory_limit='2GB';
