#!/bin/sh
: ==== start ====

TESTNAME=tpm-accept-02
source /testing/pluto/bin/westlocal.sh

ipsec setup start
/testing/pluto/bin/wait-until-pluto-started

ipsec auto --add west--east-psk-grp2
echo done



