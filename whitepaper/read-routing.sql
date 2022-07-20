USE [master] 
GO 
--Update the read-only routing URLs
ALTER AVAILABILITY GROUP AGS1 MODIFY REPLICA ON N'dxemssql-0' WITH (
    SECONDARY_ROLE (READ_ONLY_ROUTING_URL = 'TCP://<lb_ip>:1433') 
)
GO 
ALTER AVAILABILITY GROUP AGS1 MODIFY REPLICA ON N'dxemssql-1' WITH (
    SECONDARY_ROLE (READ_ONLY_ROUTING_URL = 'TCP://<lb_ip>:1433') 
)
GO 
ALTER AVAILABILITY GROUP AGS1 MODIFY REPLICA ON N'dxemssql-2' WITH (
    SECONDARY_ROLE (READ_ONLY_ROUTING_URL = 'TCP://<lb_ip>:1433') 
)
GO
--Update the read-only routing list with AG members in load-balanced configuration
ALTER AVAILABILITY GROUP AGS1 MODIFY REPLICA ON N'dxemssql-0' WITH (
    PRIMARY_ROLE (READ_ONLY_ROUTING_LIST = (('dxemssql-1', 'dxemssql-2')))
) 
GO 
ALTER AVAILABILITY GROUP AGS1 MODIFY REPLICA ON N'dxemssql-1' WITH (
    PRIMARY_ROLE (READ_ONLY_ROUTING_LIST = (('dxemssql-0', 'dxemssql-2')))
) 
GO 
ALTER AVAILABILITY GROUP AGS1 MODIFY REPLICA ON N'dxemssql-2' WITH (
    PRIMARY_ROLE (READ_ONLY_ROUTING_LIST = (('dxemssql-0', 'dxemssql-1')))
)
GO 