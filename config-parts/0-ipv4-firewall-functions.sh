#!/bin/vbash
# shellcheck disable=all

function create-firewall-rules {
  CURRENT_VLAN=$1
  set firewall zone ${CURRENT_VLAN} default-action 'drop'
}

function interfaces {
  for interface in $*; do
    set firewall zone ${CURRENT_VLAN} interface $interface
  done
}

function to-vlan {
  TARGET_VLAN=$1
  ZONE=${CURRENT_VLAN}-${TARGET_VLAN}

  set firewall zone ${TARGET_VLAN} from ${CURRENT_VLAN} firewall name ${ZONE}
  drop-traffic-invalid ${ZONE}

  case $2 in
    drop)
      set firewall ipv4 name ${ZONE} default-action 'drop'
      ;;
    drop-log)
      set firewall ipv4 name ${ZONE} default-action 'drop'
      set firewall ipv4 name ${ZONE} default-log
      ;;
    accept)
      set firewall ipv4 name ${ZONE} default-action 'accept'
      ;;
    accept-log)
      set firewall ipv4 name ${ZONE} default-action 'accept'
      set firewall ipv4 name ${ZONE} default-log
      ;;
  esac
}

function allow-traffic {
  for type in $*; do
    allow-traffic-${type} ${ZONE}
  done
}

function drop-traffic {
  for type in $*; do
    drop-traffic-${type} ${ZONE}
  done
}
