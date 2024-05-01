DECLARE @ColumnList NVARCHAR(MAX)= STRING_AGG(co.name + '(' + ty.name + ')', ', ');
 
select ta.name,STRING_AGG(@ColumnList,',') 
from sys.tables ta
left join
sys.columns co
on ta.object_id=co.object_id
left join
sys.types ty
on co.system_type_id=ty.system_type_id
where ta.object_id ='901578250'
group by ta.name,ty.name


--select ta.name,STRING_AGG(@COLUMNNAME,',') 
--from sys.tables ta
--left join
--sys.columns co
--on ta.object_id=co.object_id
--left join
--sys.types ty
--on co.system_type_id=ty.system_type_id
--where ta.object_id ='901578250'
--group by ta.name,ty.name

select * from sys.columns
select * from sys.types
--create table table1
--(
--column1 datatype,
--column2 datatype,
--column3 datatype,
--column4 datatype,
--column5 datatype,
--);

--DECLARE @TableName NVARCHAR(MAX) = 'YourTableName'; 
 
--DECLARE @CreateTableScript NVARCHAR(MAX);
 
--SET @CreateTableScript = (
--    SELECT
--'CREATE TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(t.object_id)) + '.' + QUOTENAME(t.name) + CHAR(10) +
--        '(' + CHAR(10) +
--        STRING_AGG(
--' ' + QUOTENAME(c.name) + ' ' +
--CASE WHEN c.system_type_id IN (165, 167, 173, 175, 231, 239) THEN UPPER(tp.name) +
--CASE WHEN tp.name IN ('CHAR', 'NCHAR', 'VARCHAR', 'NVARCHAR') THEN '(' +
--                      CASE WHEN c.max_length = -1 THEN 'MAX' ELSE CAST(c.max_length AS NVARCHAR(MAX)) END + ')'
--                      ELSE '' END
--WHEN c.system_type_id IN (106, 108) THEN UPPER(tp.name)
--ELSE UPPER(tp.name) + '(' + CAST(c.max_length AS NVARCHAR(MAX)) + ')' END +
--            CASE WHEN c.is_nullable = 0 THEN ' NOT NULL' ELSE '' END
--        , ',' + CHAR(10)) WITHIN GROUP (ORDER BY c.column_id) + CHAR(10) +
--        ');'
--    FROM
--        sys.tables t
--    INNER JOIN
--        sys.columns c ON t.object_id = c.object_id
--    INNER JOIN
--        sys.types tp ON c.user_type_id = tp.user_type_id
--    WHERE
--t.name = @TableName
--    GROUP BY
--t.object_id, t.name
--);
 
--PRINT @CreateTableScript;

