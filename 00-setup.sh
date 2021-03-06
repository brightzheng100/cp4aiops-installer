#!/bin/bash

source lib/utils.sh

#
# Defaults to long to "_logs/" folder
# 
export LOGDIR="${LOGDIR:-$(PWD)/_logs}"
mkdir -p "$LOGDIR"
export LOGFILE="$LOGDIR/install-$(date +"%Y-%m-%d").log"

#
# Entitlement
#
if [ -z "${ENTITLEMENT_KEY}" ] | [ -z "${ENTITLEMENT_EMAIL}" ]; then 
  log "You must export the ENTITLEMENT_KEY and ENTITLEMENT_EMAIL environment variables prior to installation. For example"
  log "export ENTITLEMENT_KEY=XXXX"
  log "export ENTITLEMENT_EMAIL=myemail@ibm.com"
  exit 999;
fi

#
# Namespaces
# 
export NAMESPACE_CS="${NAMESPACE_CS:-ibm-common-services}"
export NAMESPACE_CP4AIOPS="${NAMESPACE_CP4AIOPS:-ibm-cp4aiops}"
export NAMESPACE_HUMIO="${NAMESPACE_HUMIO:-humio}"
export NAMESPACE_LDAP="${NAMESPACE_LDAP:-ldap}"

#
# StorageClass
#
export STORAGECLASS_FILE="${STORAGECLASS_FILE:-ibmc-file-gold-gid}"
export STORAGECLASS_BLOCK="${STORAGECLASS_BLOCK:-ibmc-block-gold}"

#
# LDAP
#
export LDAP_ADMIN_PASSWORD="${LDAP_ADMIN_PASSWORD:-Passw0rd}"

#
# Humio
#
# Humio Operator Version
export HUMIO_OPERATOR_VERSION="${HUMIO_OPERATOR_VERSION:-0.6.1}"
# Variable to control whether to integrate with LDAP
# Making it true will spin up the OpenLDAP in namespace "ldap", populated with data from integration/ldap/ldif/*.ldif
export HUMIO_WITH_LDAP_INTEGRATED="${HUMIO_WITH_LDAP_INTEGRATED:-false}"
