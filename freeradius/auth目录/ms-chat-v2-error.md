(0) Received Access-Request Id 39 from 172.31.30.39:57836 to 172.31.26.167:1812 length 64
(0)   Service-Type = Framed-User
(0)   Framed-Protocol = PPP
(0)   User-Name = "vpn7"
(0)   Calling-Station-Id = "13.229.98.36"
(0)   NAS-IP-Address = 172.31.30.39
(0)   NAS-Port = 0
(0) # Executing section authorize from file /etc/freeradius/3.0/sites-enabled/default
(0)   authorize {
(0)     policy filter_username {
(0)       if (&User-Name) {
(0)       if (&User-Name)  -> TRUE
(0)       if (&User-Name)  {
(0)         if (&User-Name =~ / /) {
(0)         if (&User-Name =~ / /)  -> FALSE
(0)         if (&User-Name =~ /@[^@]*@/ ) {
(0)         if (&User-Name =~ /@[^@]*@/ )  -> FALSE
(0)         if (&User-Name =~ /\.\./ ) {
(0)         if (&User-Name =~ /\.\./ )  -> FALSE
(0)         if ((&User-Name =~ /@/) && (&User-Name !~ /@(.+)\.(.+)$/))  {
(0)         if ((&User-Name =~ /@/) && (&User-Name !~ /@(.+)\.(.+)$/))   -> FALSE
(0)         if (&User-Name =~ /\.$/)  {
(0)         if (&User-Name =~ /\.$/)   -> FALSE
(0)         if (&User-Name =~ /@\./)  {
(0)         if (&User-Name =~ /@\./)   -> FALSE
(0)       } # if (&User-Name)  = notfound
(0)     } # policy filter_username = notfound
(0)     [preprocess] = ok
(0)     [chap] = noop
(0)     [mschap] = noop
(0)     [digest] = noop
(0) suffix: Checking for suffix after "@"
(0) suffix: No '@' in User-Name = "vpn7", looking up realm NULL
(0) suffix: No such realm "NULL"
(0)     [suffix] = noop
(0) eap: No EAP-Message, not doing EAP
(0)     [eap] = noop
(0) files: users: Matched entry DEFAULT at line 167
(0)     [files] = ok
(0) sql: EXPAND %{User-Name}
(0) sql:    --> vpn7
(0) sql: SQL-User-Name set to 'vpn7'
rlm_sql (sql): Reserved connection (1)
(0) sql: EXPAND SELECT id, username, attribute, value, op FROM radcheck WHERE username = '%{SQL-User-Name}' ORDER BY id
(0) sql:    --> SELECT id, username, attribute, value, op FROM radcheck WHERE username = 'vpn7' ORDER BY id
(0) sql: Executing select query: SELECT id, username, attribute, value, op FROM radcheck WHERE username = 'vpn7' ORDER BY id
(0) sql: User found in radcheck table
(0) sql: Conditional check items matched, merging assignment check items
(0) sql:   Cleartext-Password := "vpn7"
(0) sql: EXPAND SELECT id, username, attribute, value, op FROM radreply WHERE username = '%{SQL-User-Name}' ORDER BY id
(0) sql:    --> SELECT id, username, attribute, value, op FROM radreply WHERE username = 'vpn7' ORDER BY id
(0) sql: Executing select query: SELECT id, username, attribute, value, op FROM radreply WHERE username = 'vpn7' ORDER BY id
(0) sql: EXPAND SELECT groupname FROM radusergroup WHERE username = '%{SQL-User-Name}' ORDER BY priority
(0) sql:    --> SELECT groupname FROM radusergroup WHERE username = 'vpn7' ORDER BY priority
(0) sql: Executing select query: SELECT groupname FROM radusergroup WHERE username = 'vpn7' ORDER BY priority
(0) sql: User found in the group table
(0) sql: EXPAND SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = '%{SQL-Group}' ORDER BY id
(0) sql:    --> SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = 'ms-users' ORDER BY id
(0) sql: Executing select query: SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = 'ms-users' ORDER BY id
(0) sql: Group "ms-users": Conditional check items matched
(0) sql: Group "ms-users": Merging assignment check items
(0) sql:   MS-CHAP-CPW-2 := 0x0000000000000000000000000000000000000000000000000000000000000000
(0) sql:   MS-CHAP-NT-Enc-PW := 0x0000000000000000000000000000000000000000000000000000000000000000
(0) sql: EXPAND SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = '%{SQL-Group}' ORDER BY id
(0) sql:    --> SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = 'ms-users' ORDER BY id
(0) sql: Executing select query: SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = 'ms-users' ORDER BY id
(0) sql: Group "ms-users": Merging reply items
rlm_sql (sql): Released connection (1)
Need more connections to reach 10 spares
rlm_sql (sql): Opening additional connection (6), 1 of 26 pending slots used
rlm_sql_mysql: Starting connect to MySQL server
WARNING: MYSQL_OPT_RECONNECT is deprecated and will be removed in a future version.
rlm_sql_mysql: Connected to database 'radius_8N5IBt' on Localhost via UNIX socket, server version 5.5.5-10.11.8-MariaDB-0ubuntu0.24.04.1, protocol version 10
rlm_sql (sql): Closing expired connection (5) - Hit idle_timeout limit
rlm_sql_mysql: Socket destructor called, closing socket
rlm_sql (sql): Closing expired connection (4) - Hit idle_timeout limit
rlm_sql_mysql: Socket destructor called, closing socket
rlm_sql (sql): Closing expired connection (3) - Hit idle_timeout limit
rlm_sql_mysql: Socket destructor called, closing socket
rlm_sql (sql): Closing expired connection (2) - Hit idle_timeout limit
rlm_sql_mysql: Socket destructor called, closing socket
rlm_sql (sql): You probably need to lower "min"
rlm_sql (sql): Closing expired connection (0) - Hit idle_timeout limit
rlm_sql_mysql: Socket destructor called, closing socket
(0)     [sql] = ok
(0)     [expiration] = noop
(0)     [logintime] = noop
(0) pap: No User-Password attribute in the request.  Cannot do PAP
(0)     [pap] = noop
(0)   } # authorize = ok
(0) WARNING: No module configured to handle comparisons with &control:Cleartext-Password
(0) WARNING: Add pap or chap to the authorize { ... } and authenticate { ... } sections of this virtual server to handle this "known good" password type
(0) ERROR: No Auth-Type found: rejecting the user via Post-Auth-Type = Reject
(0) Failed to authenticate the user
(0) Using Post-Auth-Type Reject
(0) # Executing group from file /etc/freeradius/3.0/sites-enabled/default
(0)   Post-Auth-Type REJECT {
(0) sql: EXPAND .query
(0) sql:    --> .query
(0) sql: Using query template 'query'
rlm_sql (sql): Reserved connection (1)
(0) sql: EXPAND %{User-Name}
(0) sql:    --> vpn7
(0) sql: SQL-User-Name set to 'vpn7'
(0) sql: EXPAND INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( '%{SQL-User-Name}', '%{%{User-Password}:-%{Chap-Password}}', '%{reply:Packet-Type}', '%S.%M' )
(0) sql:    --> INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( 'vpn7', '', 'Access-Reject', '2024-08-03 07:14:22.837243' )
(0) sql: Executing query: INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( 'vpn7', '', 'Access-Reject', '2024-08-03 07:14:22.837243' )
(0) sql: SQL query returned: success
(0) sql: 1 record(s) updated
rlm_sql (sql): Released connection (1)
(0)     [sql] = ok
(0) attr_filter.access_reject: EXPAND %{User-Name}
(0) attr_filter.access_reject:    --> vpn7
(0) attr_filter.access_reject: Matched entry DEFAULT at line 11
(0)     [attr_filter.access_reject] = updated
(0)     [eap] = noop
(0)     policy remove_reply_message_if_eap {
(0)       if (&reply:EAP-Message && &reply:Reply-Message) {
(0)       if (&reply:EAP-Message && &reply:Reply-Message)  -> FALSE
(0)       else {
(0)         [noop] = noop
(0)       } # else = noop
(0)     } # policy remove_reply_message_if_eap = noop
(0)   } # Post-Auth-Type REJECT = updated
(0) Delaying response for 1.000000 seconds
Waking up in 0.3 seconds.
Waking up in 0.6 seconds.
(0) Sending delayed response
(0) Sent Access-Reject Id 39 from 172.31.26.167:1812 to 172.31.30.39:57836 length 20
Waking up in 3.9 seconds.