: ==== start ====
TESTNAME=interop-ikev2-strongswan-03-psk-initiator
source /testing/pluto/bin/westnlocal.sh
# avoid errors from other secrets done by westlocal.sh, create just our own
cat /testing/pluto/$TESTNAME/west.secrets >/tmp/$TESTNAME/ipsec.secrets

# confirm that the network is alive
ping -n -c 1 192.0.2.254
# make sure that clear text does not get through
iptables -A INPUT -i eth1 -s 192.0.2.0/24 -j DROP
# confirm with a ping to east-in
ping -n -c 1 192.0.2.254

ipsec setup start
/testing/pluto/bin/wait-until-pluto-started

ipsec whack --whackrecord /var/tmp/ikev2.record
ipsec auto --add westnet--eastnet-ikev2
ipsec auto --status

echo done

