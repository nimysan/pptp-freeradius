# Automaticlly install pptpd on Amazon EC2 Amazon Linux
# 
# Ripped from http://blog.diahosting.com/linux-tutorial/pptpd/
# pptpd source rpm packing by it's authors
#
# WARNING:
# first ms-dns setting to 172.16.0.23, 172.16.0.23 was showing on my
# /etc/resolv.conf, I'm not sure this is the same on all Amazon AWS zones.
#
# You need to adjust your "Security Groups" which you are using too.
# The security rules which I'm using looks like:
# =================================
# ALL  tcp  0  65535 0.0.0.0/0 
# ALL  udp  0  65535 0.0.0.0/0 
# =================================
# 
# Authors: yinhm
# Version: 0.1.0
# URL: http://yinhm.appspot.com/
# Edit by: Alvin Ye

yum install -y git
yum remove -y pptpd ppp ppp-devel
iptables --flush POSTROUTING --table nat
iptables --flush FORWARD
rm -rf /etc/pptpd.conf
rm -rf /etc/ppp


yum -y install rpm-build gcc
yum -y install ppp ppp-devel

mkdir ~/src
cd ~/src
wget ftp://ftp.icm.edu.pl/packages/linux-pbone/mirrors.coreix.net/li.nux.ro/nux/misc/el6Workstation/SRPMS/pptpd-1.3.4-1.el6.nux.src.rpm
rpmbuild --rebuild pptpd-1.3.4-1.el6.nux.src.rpm
rpm -i ../rpmbuild/RPMS/x86_64/pptpd-1.3.4-1.amzn2.x86_64.rpm

sed -i 's/^logwtmp/#logwtmp/g' /etc/pptpd.conf

sed -i 's/^net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/sysctl.conf
sysctl -p
echo "localip 192.168.240.1" >> /etc/pptpd.conf
echo "remoteip 192.168.240.2-100" >> /etc/pptpd.conf
echo "ms-dns 208.67.222.222" >> /etc/ppp/options.pptpd
echo "ms-dns 8.8.8.8" >> /etc/ppp/options.pptpd

pass=`openssl rand 8 -base64`
if [ "$1" != "" ]
then pass=$1
fi

echo "vpn pptpd ${pass} *" >> /etc/ppp/chap-secrets

iptables -t nat -A POSTROUTING -s 192.168.240.0/24 -j SNAT --to-source `ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk 'NR==1 { print $1}'`
iptables -A FORWARD -p tcp --syn -s 192.168.240.0/24 -j TCPMSS --set-mss 1356
service iptables save

chkconfig iptables on
chkconfig pptpd on

service iptables start
service pptpd start

echo -e "VPN service is installed, your VPN username is \033[1mvpn\033[0m, VPN password is \033[1m${pass}\033[1m"

echo setup radius client
git clone https://github.com/nimysan/pptp-freeradius.git
cd pptp-freeradius
