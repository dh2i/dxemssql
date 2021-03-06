USE [master] 
GO 
--Allow all connections in the secondary role instead of READ_ONLY
--Read-write intent connections will be routed to the primary
ALTER AVAILABILITY GROUP AGS1 MODIFY REPLICA ON N'dxemssql-0' WITH (
    SECONDARY_ROLE (ALLOW_CONNECTIONS = ALL)
)
GO
ALTER AVAILABILITY GROUP AGS1 MODIFY REPLICA ON N'dxemssql-1' WITH (
    SECONDARY_ROLE (ALLOW_CONNECTIONS = ALL)
)
GO 
ALTER AVAILABILITY GROUP AGS1 MODIFY REPLICA ON N'dxemssql-2' WITH (
    SECONDARY_ROLE (ALLOW_CONNECTIONS = ALL)
)
GO
--Update the read-write routing URLs
ALTER AVAILABILITY GROUP AGS1 MODIFY REPLICA ON N'dxemssql-0' WITH (
    PRIMARY_ROLE (READ_WRITE_ROUTING_URL = 'TCP://<lb_ip>:1433')
)
GO
ALTER AVAILABILITY GROUP AGS1 MODIFY REPLICA ON N'dxemssql-1' WITH (
    PRIMARY_ROLE (READ_WRITE_ROUTING_URL = 'TCP://<lb_ip>:1433')
)
GO
ALTER AVAILABILITY GROUP AGS1 MODIFY REPLICA ON N'dxemssql-2' WITH (
    PRIMARY_ROLE (READ_WRITE_ROUTING_URL = 'TCP://<lb_ip>:1433')
)
GO