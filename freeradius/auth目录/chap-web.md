(2) Received Access-Request Id 81 from 167.99.95.113:53723 to 172.31.26.167:1812 length 75
(2)   User-Name = "vpn7"
(2)   CHAP-Password = 0xcff44992e8b65203fb42848c955e556ec9
(2)   NAS-IP-Address = 172.21.0.5
(2)   NAS-Port = 0
(2)   Message-Authenticator = 0xe8689c227ec3a091e6bce086d2c4ced6
(2) # Executing section authorize from file /etc/freeradius/3.0/sites-enabled/default
(2)   authorize {
(2)     policy filter_username {
(2)       if (&User-Name) {
(2)       if (&User-Name)  -> TRUE
(2)       if (&User-Name)  {
(2)         if (&User-Name =~ / /) {
(2)         if (&User-Name =~ / /)  -> FALSE
(2)         if (&User-Name =~ /@[^@]*@/ ) {
(2)         if (&User-Name =~ /@[^@]*@/ )  -> FALSE
(2)         if (&User-Name =~ /\.\./ ) {
(2)         if (&User-Name =~ /\.\./ )  -> FALSE
(2)         if ((&User-Name =~ /@/) && (&User-Name !~ /@(.+)\.(.+)$/))  {
(2)         if ((&User-Name =~ /@/) && (&User-Name !~ /@(.+)\.(.+)$/))   -> FALSE
(2)         if (&User-Name =~ /\.$/)  {
(2)         if (&User-Name =~ /\.$/)   -> FALSE
(2)         if (&User-Name =~ /@\./)  {
(2)         if (&User-Name =~ /@\./)   -> FALSE
(2)       } # if (&User-Name)  = notfound
(2)     } # policy filter_username = notfound
(2)     [preprocess] = ok
(2) chap:   &control:Auth-Type := CHAP
(2)     [chap] = ok
(2)     [mschap] = noop
(2)     [digest] = noop
(2) suffix: Checking for suffix after "@"
(2) suffix: No '@' in User-Name = "vpn7", looking up realm NULL
(2) suffix: No such realm "NULL"
(2)     [suffix] = noop
(2) eap: No EAP-Message, not doing EAP
(2)     [eap] = noop
(2)     [files] = noop
(2) sql: EXPAND %{User-Name}
(2) sql:    --> vpn7
(2) sql: SQL-User-Name set to 'vpn7'
rlm_sql (sql): Reserved connection (3)
(2) sql: EXPAND SELECT id, username, attribute, value, op FROM radcheck WHERE username = '%{SQL-User-Name}' ORDER BY id
(2) sql:    --> SELECT id, username, attribute, value, op FROM radcheck WHERE username = 'vpn7' ORDER BY id
(2) sql: Executing select query: SELECT id, username, attribute, value, op FROM radcheck WHERE username = 'vpn7' ORDER BY id
(2) sql: User found in radcheck table
(2) sql: Conditional check items matched, merging assignment check items
(2) sql:   Cleartext-Password := "vpn7"
(2) sql: EXPAND SELECT id, username, attribute, value, op FROM radreply WHERE username = '%{SQL-User-Name}' ORDER BY id
(2) sql:    --> SELECT id, username, attribute, value, op FROM radreply WHERE username = 'vpn7' ORDER BY id
(2) sql: Executing select query: SELECT id, username, attribute, value, op FROM radreply WHERE username = 'vpn7' ORDER BY id
(2) sql: EXPAND SELECT groupname FROM radusergroup WHERE username = '%{SQL-User-Name}' ORDER BY priority
(2) sql:    --> SELECT groupname FROM radusergroup WHERE username = 'vpn7' ORDER BY priority
(2) sql: Executing select query: SELECT groupname FROM radusergroup WHERE username = 'vpn7' ORDER BY priority
(2) sql: User found in the group table
(2) sql: EXPAND SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = '%{SQL-Group}' ORDER BY id
(2) sql:    --> SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = 'ms-users' ORDER BY id
(2) sql: Executing select query: SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = 'ms-users' ORDER BY id
(2) sql: Group "ms-users": Conditional check items matched
(2) sql: Group "ms-users": Merging assignment check items
(2) sql:   MS-CHAP-CPW-2 := 0x0000000000000000000000000000000000000000000000000000000000000000
(2) sql:   MS-CHAP-NT-Enc-PW := 0x0000000000000000000000000000000000000000000000000000000000000000
(2) sql: EXPAND SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = '%{SQL-Group}' ORDER BY id
(2) sql:    --> SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = 'ms-users' ORDER BY id
(2) sql: Executing select query: SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = 'ms-users' ORDER BY id
(2) sql: Group "ms-users": Merging reply items
rlm_sql (sql): Released connection (3)
Need more connections to reach 10 spares
rlm_sql (sql): Opening additional connection (7), 1 of 25 pending slots used
rlm_sql_mysql: Starting connect to MySQL server
WARNING: MYSQL_OPT_RECONNECT is deprecated and will be removed in a future version.
rlm_sql_mysql: Connected to database 'radius_8N5IBt' on Localhost via UNIX socket, server version 5.5.5-10.11.8-MariaDB-0ubuntu0.24.04.1, protocol version 10
rlm_sql (sql): Closing expired connection (6) - Hit idle_timeout limit
rlm_sql_mysql: Socket destructor called, closing socket
rlm_sql (sql): Closing expired connection (5) - Hit idle_timeout limit
rlm_sql_mysql: Socket destructor called, closing socket
rlm_sql (sql): Closing expired connection (4) - Hit idle_timeout limit
rlm_sql_mysql: Socket destructor called, closing socket
rlm_sql (sql): Closing expired connection (2) - Hit idle_timeout limit
rlm_sql_mysql: Socket destructor called, closing socket
rlm_sql (sql): Closing expired connection (1) - Hit idle_timeout limit
rlm_sql_mysql: Socket destructor called, closing socket
rlm_sql (sql): You probably need to lower "min"
rlm_sql (sql): Closing expired connection (0) - Hit idle_timeout limit
rlm_sql_mysql: Socket destructor called, closing socket
(2)     [sql] = ok
(2)     [expiration] = noop
(2)     [logintime] = noop
(2) pap: WARNING: Auth-Type already set.  Not setting to PAP
(2)     [pap] = noop
(2)   } # authorize = ok
(2) Found Auth-Type = CHAP
(2) # Executing group from file /etc/freeradius/3.0/sites-enabled/default
(2)   Auth-Type CHAP {
(2) chap: Comparing with "known good" Cleartext-Password
(2) chap: CHAP user "vpn7" authenticated successfully
(2)     [chap] = ok
(2)   } # Auth-Type CHAP = ok
(2) # Executing section post-auth from file /etc/freeradius/3.0/sites-enabled/default
(2)   post-auth {
(2)     if (session-state:User-Name && reply:User-Name && request:User-Name && (reply:User-Name == request:User-Name)) {
(2)     if (session-state:User-Name && reply:User-Name && request:User-Name && (reply:User-Name == request:User-Name))  -> FALSE
(2)     update {
(2)       No attributes updated for RHS &session-state:
(2)     } # update = noop
(2) sql: EXPAND .query
(2) sql:    --> .query
(2) sql: Using query template 'query'
rlm_sql (sql): Reserved connection (3)
(2) sql: EXPAND %{User-Name}
(2) sql:    --> vpn7
(2) sql: SQL-User-Name set to 'vpn7'
(2) sql: EXPAND INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( '%{SQL-User-Name}', '%{%{User-Password}:-%{Chap-Password}}', '%{reply:Packet-Type}', '%S.%M' )
(2) sql:    --> INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( 'vpn7', '0xcff44992e8b65203fb42848c955e556ec9', 'Access-Accept', '2024-08-01 02:59:30.948682' )
(2) sql: Executing query: INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( 'vpn7', '0xcff44992e8b65203fb42848c955e556ec9', 'Access-Accept', '2024-08-01 02:59:30.948682' )
(2) sql: SQL query returned: success
(2) sql: 1 record(s) updated
rlm_sql (sql): Released connection (3)
(2)     [sql] = ok
(2)     [exec] = noop
(2)     policy remove_reply_message_if_eap {
(2)       if (&reply:EAP-Message && &reply:Reply-Message) {
(2)       if (&reply:EAP-Message && &reply:Reply-Message)  -> FALSE
(2)       else {
(2)         [noop] = noop
(2)       } # else = noop
(2)     } # policy remove_reply_message_if_eap = noop
(2)     if (EAP-Key-Name && &reply:EAP-Session-Id) {
(2)     if (EAP-Key-Name && &reply:EAP-Session-Id)  -> FALSE
(2)   } # post-auth = ok
(2) Sent Access-Accept Id 81 from 172.31.26.167:1812 to 167.99.95.113:53723 length 20
(2) Finished request
Waking up in 4.9 seconds.
(2) Cleaning up request packet ID 81 with timestamp +205 due to cleanup_delay was reached