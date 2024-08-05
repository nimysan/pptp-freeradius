(4) Received Access-Request Id 10 from 172.31.30.39:38572 to 172.31.26.167:1812 length 64
(4)   Service-Type = Framed-User
(4)   Framed-Protocol = PPP
(4)   User-Name = "vpn7"
(4)   Calling-Station-Id = "13.229.98.36"
(4)   NAS-IP-Address = 172.31.30.39
(4)   NAS-Port = 0
(4) # Executing section authorize from file /etc/freeradius/3.0/sites-enabled/default
(4)   authorize {
(4)     policy filter_username {
(4)       if (&User-Name) {
(4)       if (&User-Name)  -> TRUE
(4)       if (&User-Name)  {
(4)         if (&User-Name =~ / /) {
(4)         if (&User-Name =~ / /)  -> FALSE
(4)         if (&User-Name =~ /@[^@]*@/ ) {
(4)         if (&User-Name =~ /@[^@]*@/ )  -> FALSE
(4)         if (&User-Name =~ /\.\./ ) {
(4)         if (&User-Name =~ /\.\./ )  -> FALSE
(4)         if ((&User-Name =~ /@/) && (&User-Name !~ /@(.+)\.(.+)$/))  {
(4)         if ((&User-Name =~ /@/) && (&User-Name !~ /@(.+)\.(.+)$/))   -> FALSE
(4)         if (&User-Name =~ /\.$/)  {
(4)         if (&User-Name =~ /\.$/)   -> FALSE
(4)         if (&User-Name =~ /@\./)  {
(4)         if (&User-Name =~ /@\./)   -> FALSE
(4)       } # if (&User-Name)  = notfound
(4)     } # policy filter_username = notfound
(4)     [preprocess] = ok
(4)     [chap] = noop
(4)     [mschap] = noop
(4)     [digest] = noop
(4) suffix: Checking for suffix after "@"
(4) suffix: No '@' in User-Name = "vpn7", looking up realm NULL
(4) suffix: No such realm "NULL"
(4)     [suffix] = noop
(4) eap: No EAP-Message, not doing EAP
(4)     [eap] = noop
(4) files: users: Matched entry DEFAULT at line 167
(4)     [files] = ok
(4) sql: EXPAND %{User-Name}
(4) sql:    --> vpn7
(4) sql: SQL-User-Name set to 'vpn7'
rlm_sql (sql): Reserved connection (9)
(4) sql: EXPAND SELECT id, username, attribute, value, op FROM radcheck WHERE username = '%{SQL-User-Name}' ORDER BY id
(4) sql:    --> SELECT id, username, attribute, value, op FROM radcheck WHERE username = 'vpn7' ORDER BY id
(4) sql: Executing select query: SELECT id, username, attribute, value, op FROM radcheck WHERE username = 'vpn7' ORDER BY id
(4) sql: User found in radcheck table
(4) sql: Conditional check items matched, merging assignment check items
(4) sql:   Cleartext-Password := "vpn7"
(4) sql: EXPAND SELECT id, username, attribute, value, op FROM radreply WHERE username = '%{SQL-User-Name}' ORDER BY id
(4) sql:    --> SELECT id, username, attribute, value, op FROM radreply WHERE username = 'vpn7' ORDER BY id
(4) sql: Executing select query: SELECT id, username, attribute, value, op FROM radreply WHERE username = 'vpn7' ORDER BY id
(4) sql: EXPAND SELECT groupname FROM radusergroup WHERE username = '%{SQL-User-Name}' ORDER BY priority
(4) sql:    --> SELECT groupname FROM radusergroup WHERE username = 'vpn7' ORDER BY priority
(4) sql: Executing select query: SELECT groupname FROM radusergroup WHERE username = 'vpn7' ORDER BY priority
(4) sql: User found in the group table
(4) sql: EXPAND SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = '%{SQL-Group}' ORDER BY id
(4) sql:    --> SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = 'ms-users' ORDER BY id
(4) sql: Executing select query: SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = 'ms-users' ORDER BY id
(4) sql: Group "ms-users": Conditional check items matched
(4) sql: Group "ms-users": Merging assignment check items
(4) sql:   MS-CHAP-CPW-2 := 0x0000000000000000000000000000000000000000000000000000000000000000
(4) sql:   MS-CHAP-NT-Enc-PW := 0x0000000000000000000000000000000000000000000000000000000000000000
(4) sql: EXPAND SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = '%{SQL-Group}' ORDER BY id
(4) sql:    --> SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = 'ms-users' ORDER BY id
(4) sql: Executing select query: SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = 'ms-users' ORDER BY id
(4) sql: Group "ms-users": Merging reply items
rlm_sql (sql): Released connection (9)
Need 1 more connections to reach min connections (3)
Need more connections to reach 10 spares
rlm_sql (sql): Opening additional connection (10), 1 of 30 pending slots used
rlm_sql_mysql: Starting connect to MySQL server
WARNING: MYSQL_OPT_RECONNECT is deprecated and will be removed in a future version.
rlm_sql_mysql: Connected to database 'radius_8N5IBt' on Localhost via UNIX socket, server version 5.5.5-10.11.8-MariaDB-0ubuntu0.24.04.1, protocol version 10
(4)     [sql] = ok
(4)     [expiration] = noop
(4)     [logintime] = noop
(4) pap: No User-Password attribute in the request.  Cannot do PAP
(4)     [pap] = noop
(4)   } # authorize = ok
(4) WARNING: No module configured to handle comparisons with &control:Cleartext-Password
(4) WARNING: Add pap or chap to the authorize { ... } and authenticate { ... } sections of this virtual server to handle this "known good" password type
(4) ERROR: No Auth-Type found: rejecting the user via Post-Auth-Type = Reject
(4) Failed to authenticate the user
(4) Using Post-Auth-Type Reject
(4) # Executing group from file /etc/freeradius/3.0/sites-enabled/default
(4)   Post-Auth-Type REJECT {
(4) sql: EXPAND .query
(4) sql:    --> .query
(4) sql: Using query template 'query'
rlm_sql (sql): Reserved connection (8)
(4) sql: EXPAND %{User-Name}
(4) sql:    --> vpn7
(4) sql: SQL-User-Name set to 'vpn7'
(4) sql: EXPAND INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( '%{SQL-User-Name}', '%{%{User-Password}:-%{Chap-Password}}', '%{reply:Packet-Type}', '%S.%M' )
(4) sql:    --> INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( 'vpn7', '', 'Access-Reject', '2024-08-01 02:46:21.499613' )
(4) sql: Executing query: INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( 'vpn7', '', 'Access-Reject', '2024-08-01 02:46:21.499613' )
(4) sql: SQL query returned: success
(4) sql: 1 record(s) updated
rlm_sql (sql): Released connection (8)
(4)     [sql] = ok
(4) attr_filter.access_reject: EXPAND %{User-Name}
(4) attr_filter.access_reject:    --> vpn7
(4) attr_filter.access_reject: Matched entry DEFAULT at line 11
(4)     [attr_filter.access_reject] = updated
(4)     [eap] = noop
(4)     policy remove_reply_message_if_eap {
(4)       if (&reply:EAP-Message && &reply:Reply-Message) {
(4)       if (&reply:EAP-Message && &reply:Reply-Message)  -> FALSE
(4)       else {
(4)         [noop] = noop
(4)       } # else = noop
(4)     } # policy remove_reply_message_if_eap = noop
(4)   } # Post-Auth-Type REJECT = updated
(4) Delaying response for 1.000000 seconds
Waking up in 0.3 seconds.
Waking up in 0.6 seconds.
(4) Sending delayed response
(4) Sent Access-Reject Id 10 from 172.31.26.167:1812 to 172.31.30.39:38572 length 20
Waking up in 3.9 seconds.
(4) Cleaning up request packet ID 10 with timestamp +736 due to cleanup_delay was reached
Ready to process requests