(1) Received Access-Request Id 158 from 167.99.95.113:48427 to 172.31.26.167:1812 length 74
(1)   User-Name = "vpn7"
(1)   User-Password = "vpn7"
(1)   NAS-IP-Address = 172.21.0.5
(1)   NAS-Port = 0
(1)   Message-Authenticator = 0x9694e2074ed8db36629fd301206d9881
(1) # Executing section authorize from file /etc/freeradius/3.0/sites-enabled/default
(1)   authorize {
(1)     policy filter_username {
(1)       if (&User-Name) {
(1)       if (&User-Name)  -> TRUE
(1)       if (&User-Name)  {
(1)         if (&User-Name =~ / /) {
(1)         if (&User-Name =~ / /)  -> FALSE
(1)         if (&User-Name =~ /@[^@]*@/ ) {
(1)         if (&User-Name =~ /@[^@]*@/ )  -> FALSE
(1)         if (&User-Name =~ /\.\./ ) {
(1)         if (&User-Name =~ /\.\./ )  -> FALSE
(1)         if ((&User-Name =~ /@/) && (&User-Name !~ /@(.+)\.(.+)$/))  {
(1)         if ((&User-Name =~ /@/) && (&User-Name !~ /@(.+)\.(.+)$/))   -> FALSE
(1)         if (&User-Name =~ /\.$/)  {
(1)         if (&User-Name =~ /\.$/)   -> FALSE
(1)         if (&User-Name =~ /@\./)  {
(1)         if (&User-Name =~ /@\./)   -> FALSE
(1)       } # if (&User-Name)  = notfound
(1)     } # policy filter_username = notfound
(1)     [preprocess] = ok
(1)     [chap] = noop
(1)     [mschap] = noop
(1)     [digest] = noop
(1) suffix: Checking for suffix after "@"
(1) suffix: No '@' in User-Name = "vpn7", looking up realm NULL
(1) suffix: No such realm "NULL"
(1)     [suffix] = noop
(1) eap: No EAP-Message, not doing EAP
(1)     [eap] = noop
(1)     [files] = noop
(1) sql: EXPAND %{User-Name}
(1) sql:    --> vpn7
(1) sql: SQL-User-Name set to 'vpn7'
rlm_sql (sql): Reserved connection (1)
(1) sql: EXPAND SELECT id, username, attribute, value, op FROM radcheck WHERE username = '%{SQL-User-Name}' ORDER BY id
(1) sql:    --> SELECT id, username, attribute, value, op FROM radcheck WHERE username = 'vpn7' ORDER BY id
(1) sql: Executing select query: SELECT id, username, attribute, value, op FROM radcheck WHERE username = 'vpn7' ORDER BY id
(1) sql: User found in radcheck table
(1) sql: Conditional check items matched, merging assignment check items
(1) sql:   Cleartext-Password := "vpn7"
(1) sql: EXPAND SELECT id, username, attribute, value, op FROM radreply WHERE username = '%{SQL-User-Name}' ORDER BY id
(1) sql:    --> SELECT id, username, attribute, value, op FROM radreply WHERE username = 'vpn7' ORDER BY id
(1) sql: Executing select query: SELECT id, username, attribute, value, op FROM radreply WHERE username = 'vpn7' ORDER BY id
(1) sql: EXPAND SELECT groupname FROM radusergroup WHERE username = '%{SQL-User-Name}' ORDER BY priority
(1) sql:    --> SELECT groupname FROM radusergroup WHERE username = 'vpn7' ORDER BY priority
(1) sql: Executing select query: SELECT groupname FROM radusergroup WHERE username = 'vpn7' ORDER BY priority
(1) sql: User found in the group table
(1) sql: EXPAND SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = '%{SQL-Group}' ORDER BY id
(1) sql:    --> SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = 'ms-users' ORDER BY id
(1) sql: Executing select query: SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = 'ms-users' ORDER BY id
(1) sql: Group "ms-users": Conditional check items matched
(1) sql: Group "ms-users": Merging assignment check items
(1) sql:   MS-CHAP-CPW-2 := 0x0000000000000000000000000000000000000000000000000000000000000000
(1) sql:   MS-CHAP-NT-Enc-PW := 0x0000000000000000000000000000000000000000000000000000000000000000
(1) sql: EXPAND SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = '%{SQL-Group}' ORDER BY id
(1) sql:    --> SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = 'ms-users' ORDER BY id
(1) sql: Executing select query: SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = 'ms-users' ORDER BY id
(1) sql: Group "ms-users": Merging reply items
rlm_sql (sql): Released connection (1)
Need more connections to reach 10 spares
rlm_sql (sql): Opening additional connection (6), 1 of 26 pending slots used
rlm_sql_mysql: Starting connect to MySQL server
WARNING: MYSQL_OPT_RECONNECT is deprecated and will be removed in a future version.
rlm_sql_mysql: Connected to database 'radius_8N5IBt' on Localhost via UNIX socket, server version 5.5.5-10.11.8-MariaDB-0ubuntu0.24.04.1, protocol version 10
(1)     [sql] = ok
(1)     [expiration] = noop
(1)     [logintime] = noop
(1)     [pap] = updated
(1)   } # authorize = updated
(1) Found Auth-Type = PAP
(1) # Executing group from file /etc/freeradius/3.0/sites-enabled/default
(1)   Auth-Type PAP {
(1) pap: Login attempt with password
(1) pap: Comparing with "known good" Cleartext-Password
(1) pap: User authenticated successfully
(1)     [pap] = ok
(1)   } # Auth-Type PAP = ok
(1) # Executing section post-auth from file /etc/freeradius/3.0/sites-enabled/default
(1)   post-auth {
(1)     if (session-state:User-Name && reply:User-Name && request:User-Name && (reply:User-Name == request:User-Name)) {
(1)     if (session-state:User-Name && reply:User-Name && request:User-Name && (reply:User-Name == request:User-Name))  -> FALSE
(1)     update {
(1)       No attributes updated for RHS &session-state:
(1)     } # update = noop
(1) sql: EXPAND .query
(1) sql:    --> .query
(1) sql: Using query template 'query'
rlm_sql (sql): Reserved connection (2)
(1) sql: EXPAND %{User-Name}
(1) sql:    --> vpn7
(1) sql: SQL-User-Name set to 'vpn7'
(1) sql: EXPAND INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( '%{SQL-User-Name}', '%{%{User-Password}:-%{Chap-Password}}', '%{reply:Packet-Type}', '%S.%M' )
(1) sql:    --> INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( 'vpn7', 'vpn7', 'Access-Accept', '2024-08-01 02:56:39.681823' )
(1) sql: Executing query: INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( 'vpn7', 'vpn7', 'Access-Accept', '2024-08-01 02:56:39.681823' )
(1) sql: SQL query returned: success
(1) sql: 1 record(s) updated
rlm_sql (sql): Released connection (2)
(1)     [sql] = ok
(1)     [exec] = noop
(1)     policy remove_reply_message_if_eap {
(1)       if (&reply:EAP-Message && &reply:Reply-Message) {
(1)       if (&reply:EAP-Message && &reply:Reply-Message)  -> FALSE
(1)       else {
(1)         [noop] = noop
(1)       } # else = noop
(1)     } # policy remove_reply_message_if_eap = noop
(1)     if (EAP-Key-Name && &reply:EAP-Session-Id) {
(1)     if (EAP-Key-Name && &reply:EAP-Session-Id)  -> FALSE
(1)   } # post-auth = ok
(1) Sent Access-Accept Id 158 from 172.31.26.167:1812 to 167.99.95.113:48427 length 20
(1) Finished request
Waking up in 4.9 seconds.
(1) Cleaning up request packet ID 158 with timestamp +34 due to cleanup_delay was reached