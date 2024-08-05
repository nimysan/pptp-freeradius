Ready to process requests
(3) Received Access-Request Id 145 from 167.99.95.113:46038 to 172.31.26.167:1812 length 130
(3)   User-Name = "vpn7"
(3)   NAS-IP-Address = 172.21.0.5
(3)   NAS-Port = 0
(3)   Message-Authenticator = 0x1253cc5c2b6228a565c06e40ac0224e7
(3)   MS-CHAP-Challenge = 0x1c90144187b2b1dc
(3)   MS-CHAP-Response = 0x000100000000000000000000000000000000000000000000000015a8f535c73a2fb882d3e3f1934971c9938f84891806870b
(3) # Executing section authorize from file /etc/freeradius/3.0/sites-enabled/default
(3)   authorize {
(3)     policy filter_username {
(3)       if (&User-Name) {
(3)       if (&User-Name)  -> TRUE
(3)       if (&User-Name)  {
(3)         if (&User-Name =~ / /) {
(3)         if (&User-Name =~ / /)  -> FALSE
(3)         if (&User-Name =~ /@[^@]*@/ ) {
(3)         if (&User-Name =~ /@[^@]*@/ )  -> FALSE
(3)         if (&User-Name =~ /\.\./ ) {
(3)         if (&User-Name =~ /\.\./ )  -> FALSE
(3)         if ((&User-Name =~ /@/) && (&User-Name !~ /@(.+)\.(.+)$/))  {
(3)         if ((&User-Name =~ /@/) && (&User-Name !~ /@(.+)\.(.+)$/))   -> FALSE
(3)         if (&User-Name =~ /\.$/)  {
(3)         if (&User-Name =~ /\.$/)   -> FALSE
(3)         if (&User-Name =~ /@\./)  {
(3)         if (&User-Name =~ /@\./)   -> FALSE
(3)       } # if (&User-Name)  = notfound
(3)     } # policy filter_username = notfound
(3)     [preprocess] = ok
(3)     [chap] = noop
(3) mschap: Found MS-CHAP attributes.  Setting 'Auth-Type  = mschap'
(3)     [mschap] = ok
(3)     [digest] = noop
(3) suffix: Checking for suffix after "@"
(3) suffix: No '@' in User-Name = "vpn7", looking up realm NULL
(3) suffix: No such realm "NULL"
(3)     [suffix] = noop
(3) eap: No EAP-Message, not doing EAP
(3)     [eap] = noop
(3)     [files] = noop
(3) sql: EXPAND %{User-Name}
(3) sql:    --> vpn7
(3) sql: SQL-User-Name set to 'vpn7'
rlm_sql (sql): Reserved connection (7)
(3) sql: EXPAND SELECT id, username, attribute, value, op FROM radcheck WHERE username = '%{SQL-User-Name}' ORDER BY id
(3) sql:    --> SELECT id, username, attribute, value, op FROM radcheck WHERE username = 'vpn7' ORDER BY id
(3) sql: Executing select query: SELECT id, username, attribute, value, op FROM radcheck WHERE username = 'vpn7' ORDER BY id
(3) sql: User found in radcheck table
(3) sql: Conditional check items matched, merging assignment check items
(3) sql:   Cleartext-Password := "vpn7"
(3) sql: EXPAND SELECT id, username, attribute, value, op FROM radreply WHERE username = '%{SQL-User-Name}' ORDER BY id
(3) sql:    --> SELECT id, username, attribute, value, op FROM radreply WHERE username = 'vpn7' ORDER BY id
(3) sql: Executing select query: SELECT id, username, attribute, value, op FROM radreply WHERE username = 'vpn7' ORDER BY id
(3) sql: EXPAND SELECT groupname FROM radusergroup WHERE username = '%{SQL-User-Name}' ORDER BY priority
(3) sql:    --> SELECT groupname FROM radusergroup WHERE username = 'vpn7' ORDER BY priority
(3) sql: Executing select query: SELECT groupname FROM radusergroup WHERE username = 'vpn7' ORDER BY priority
(3) sql: User found in the group table
(3) sql: EXPAND SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = '%{SQL-Group}' ORDER BY id
(3) sql:    --> SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = 'ms-users' ORDER BY id
(3) sql: Executing select query: SELECT id, groupname, attribute, Value, op FROM radgroupcheck WHERE groupname = 'ms-users' ORDER BY id
(3) sql: Group "ms-users": Conditional check items matched
(3) sql: Group "ms-users": Merging assignment check items
(3) sql:   MS-CHAP-CPW-2 := 0x0000000000000000000000000000000000000000000000000000000000000000
(3) sql:   MS-CHAP-NT-Enc-PW := 0x0000000000000000000000000000000000000000000000000000000000000000
(3) sql: EXPAND SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = '%{SQL-Group}' ORDER BY id
(3) sql:    --> SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = 'ms-users' ORDER BY id
(3) sql: Executing select query: SELECT id, groupname, attribute, value, op FROM radgroupreply WHERE groupname = 'ms-users' ORDER BY id
(3) sql: Group "ms-users": Merging reply items
rlm_sql (sql): Released connection (7)
Need 1 more connections to reach min connections (3)
Need more connections to reach 10 spares
rlm_sql (sql): Opening additional connection (8), 1 of 30 pending slots used
rlm_sql_mysql: Starting connect to MySQL server
WARNING: MYSQL_OPT_RECONNECT is deprecated and will be removed in a future version.
rlm_sql_mysql: Connected to database 'radius_8N5IBt' on Localhost via UNIX socket, server version 5.5.5-10.11.8-MariaDB-0ubuntu0.24.04.1, protocol version 10
rlm_sql (sql): You probably need to lower "min"
rlm_sql (sql): Closing expired connection (3) - Hit idle_timeout limit
rlm_sql_mysql: Socket destructor called, closing socket
(3)     [sql] = ok
(3)     [expiration] = noop
(3)     [logintime] = noop
(3) pap: WARNING: Auth-Type already set.  Not setting to PAP
(3)     [pap] = noop
(3)   } # authorize = ok
(3) Found Auth-Type = mschap
(3) # Executing group from file /etc/freeradius/3.0/sites-enabled/default
(3)   authenticate {
(3) mschap: Found Cleartext-Password, hashing to create NT-Password
(3) mschap: Client is using MS-CHAPv1 with NT-Password
(3) mschap: adding MS-CHAPv1 MPPE keys
(3)     [mschap] = ok
(3)   } # authenticate = ok
(3) # Executing section post-auth from file /etc/freeradius/3.0/sites-enabled/default
(3)   post-auth {
(3)     if (session-state:User-Name && reply:User-Name && request:User-Name && (reply:User-Name == request:User-Name)) {
(3)     if (session-state:User-Name && reply:User-Name && request:User-Name && (reply:User-Name == request:User-Name))  -> FALSE
(3)     update {
(3)       No attributes updated for RHS &session-state:
(3)     } # update = noop
(3) sql: EXPAND .query
(3) sql:    --> .query
(3) sql: Using query template 'query'
rlm_sql (sql): Reserved connection (7)
(3) sql: EXPAND %{User-Name}
(3) sql:    --> vpn7
(3) sql: SQL-User-Name set to 'vpn7'
(3) sql: EXPAND INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( '%{SQL-User-Name}', '%{%{User-Password}:-%{Chap-Password}}', '%{reply:Packet-Type}', '%S.%M' )
(3) sql:    --> INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( 'vpn7', '', 'Access-Accept', '2024-08-01 03:01:06.121497' )
(3) sql: Executing query: INSERT INTO radpostauth (username, pass, reply, authdate ) VALUES ( 'vpn7', '', 'Access-Accept', '2024-08-01 03:01:06.121497' )
(3) sql: SQL query returned: success
(3) sql: 1 record(s) updated
rlm_sql (sql): Released connection (7)
(3)     [sql] = ok
(3)     [exec] = noop
(3)     policy remove_reply_message_if_eap {
(3)       if (&reply:EAP-Message && &reply:Reply-Message) {
(3)       if (&reply:EAP-Message && &reply:Reply-Message)  -> FALSE
(3)       else {
(3)         [noop] = noop
(3)       } # else = noop
(3)     } # policy remove_reply_message_if_eap = noop
(3)     if (EAP-Key-Name && &reply:EAP-Session-Id) {
(3)     if (EAP-Key-Name && &reply:EAP-Session-Id)  -> FALSE
(3)   } # post-auth = ok
(3) Sent Access-Accept Id 145 from 172.31.26.167:1812 to 167.99.95.113:46038 length 84
(3)   MS-CHAP-MPPE-Keys = 0x00000000000000001cd57a9d3ba04cf2564f118a50662432
(3)   MS-MPPE-Encryption-Policy = Encryption-Allowed
(3)   MS-MPPE-Encryption-Types = RC4-40or128-bit-Allowed
(3) Finished request
Waking up in 4.9 seconds.
(3) Cleaning up request packet ID 145 with timestamp +301 due to cleanup_delay was reached
