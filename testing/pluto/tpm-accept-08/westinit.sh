#!/bin/sh
: ==== start ====

TESTNAME=tpm-accept-08
source /testing/pluto/bin/westlocal.sh

ipsec setup start
/testing/pluto/bin/wait-until-pluto-started

ipsec auto --add west--east-psk

