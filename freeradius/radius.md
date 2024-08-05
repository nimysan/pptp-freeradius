# pptpd + radius_client

password: 

.KBbrG2K@;JJoyxR(Q!JG6Oy(9O7sw-j

user name:
vpn vpn1234


radtest vpn vpn12345 127.0.0.1 0 testing123

Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: plugin radius.so#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: plugin radattr.so#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: auth#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: refuse-pap#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: refuse-chap#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: refuse-mschap#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: name pptpd#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: radius-config-file /etc/radiusclient-ng/radiusclient.conf#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: 115200#011#011# (from command line)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: lock#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: local#011#011# (from command line)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: novj#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: novjccomp#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: ipparam 13.229.98.36#011#011# (from command line)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: ms-dns xxx # [don't know how to print value]#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: nodefaultroute#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: proxyarp#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: 192.168.240.1:192.168.240.2#011#011# (from command line)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: nobsdcomp#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: require-mppe-128#011#011# (from /etc/ppp/options.pptpd)
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: pppd 2.4.5 started by root, uid 0
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: Using interface ppp0
Jul 29 09:59:50 ip-172-31-30-39 pppd[11787]: Connect: ppp0 <--> /dev/pts/0
Jul 29 09:59:53 ip-172-31-30-39 pptpd[11786]: CTRL: Ignored a SET LINK INFO packet with real ACCMs!
Jul 29 09:59:54 ip-172-31-30-39 pppd[11787]: /etc/radiusclient-ng/radiusclient.conf: line 75: unrecognized keyword: bindaddr
Jul 29 09:59:54 ip-172-31-30-39 pppd[11787]: rc_avpair_new: unknown attribute 11
Jul 29 09:59:54 ip-172-31-30-39 pppd[11787]: rc_avpair_new: unknown attribute 25
Jul 29 09:59:54 ip-172-31-30-39 pppd[11787]: rc_find_server: couldn't find RADIUS server localhost in /etc/radiusclient-ng/servers
Jul 29 09:59:54 ip-172-31-30-39 pppd[11787]: Peer vpn failed CHAP authentication
Jul 29 09:59:54 ip-172-31-30-39 pppd[11787]: Connection terminated.
Jul 29 09:59:54 ip-172-31-30-39 pppd[11787]: Exit.
Jul 29 09:59:54 ip-172-31-30-39 pptpd[11786]: GRE: read(fd=6,buffer=611620,len=8196) from PTY failed: status = -1 error = Input/output error, usually caused by unexpected termination of pppd, check option syntax and pppd logs
Jul 29 09:59:54 ip-172-31-30-39 pptpd[11786]: CTRL: PTY read or GRE write failed (pty,gre)=(6,7)
Jul 29 09:59:54 ip-172-31-30-39 pptpd[11786]: CTRL: Client 13.229.98.36 control connection finished
Jul 29 10:00:01 ip-172-31-30-39 systemd: Created slice User Slice of root.
Jul 29 10:00:01 ip-172-31-30-39 systemd: Started Session 20 of user root.
Jul 29 10:00:01 ip-172-31-30-39 systemd: Removed slice User Slice of root.


ar  5  2007 dictionary.ascend
-rw-r--r--  1 root root 1.5K Mar  5  2007 dictionary.compat
-rw-r--r--  1 root root  599 Mar  5  2007 dictionary.merit
-rw-r--r--  1 root root  135 Mar  5  2007 issue