#!/bin/vbash
# shellcheck disable=all

function create-firewall-rules {
  CURRENT_VLAN=$1
  set firewall zone ${CURRENT_VLAN} default-action 'drop'
  if test "${CURRENT_VLAN}" == "local"; then
    set firewall zone ${CURRENT_VLAN} local-zone
  fi    
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

function allow-traffic-ntp {
  zone=$1

  # set firewall ipv4 name $zone rule 100 description 'Rule: accept ntp'
  set firewall ipv4 name $zone rule 100 action 'accept'
  set firewall ipv4 name $zone rule 100 destination port 'ntp'
  set firewall ipv4 name $zone rule 100 protocol 'udp'
}

function allow-traffic-dhcp {
  zone=$1

  # set firewall ipv4 name $zone rule 110 description 'Rule: accept dhcp'
  set firewall ipv4 name $zone rule 110 action 'accept'
  set firewall ipv4 name $zone rule 110 source port 'bootps,bootpc'
  set firewall ipv4 name $zone rule 110 destination port 'bootps,bootpc'
  set firewall ipv4 name $zone rule 110 protocol 'udp'
}

function allow-traffic-igmp {
  zone=$1

  # set firewall ipv4 name $zone rule 120 description 'Rule: accept igmp'
  set firewall ipv4 name $zone rule 120 action 'accept'
  set firewall ipv4 name $zone rule 120 protocol '2'
}

function allow-traffic-mdns {
  zone=$1

  # set firewall ipv4 name $zone rule 130 description 'Rule: accept mdns'
  set firewall ipv4 name $zone rule 130 action 'accept'
  set firewall ipv4 name $zone rule 130 source port 'mdns'
  set firewall ipv4 name $zone rule 130 destination port 'mdns'
  set firewall ipv4 name $zone rule 130 protocol 'udp'
}

function allow-traffic-icmp {
  zone=$1

  # set firewall ipv4 name $zone rule 140 description 'Rule: accept icmp'
  set firewall ipv4 name $zone rule 140 action 'accept'
  set firewall ipv4 name $zone rule 140 protocol 'icmp'
}

function allow-traffic-bgp {
  zone=$1

  # set firewall ipv4 name $zone rule 150 description 'Rule: accept bgp'
  set firewall ipv4 name $zone rule 150 action 'accept'
  set firewall ipv4 name $zone rule 150 destination port 'bgp'
  set firewall ipv4 name $zone rule 150 protocol 'tcp'
}

function allow-traffic-ssh {
  zone=$1

  # set firewall ipv4 name $zone rule 160 description 'Rule: accept ssh'
  set firewall ipv4 name $zone rule 160 action 'accept'
  set firewall ipv4 name $zone rule 160 destination port 'ssh'
  set firewall ipv4 name $zone rule 160 protocol 'tcp'
}

function allow-traffic-dns {
  zone=$1

  # set firewall ipv4 name $zone rule 170 description 'Rule: accept dns'
  set firewall ipv4 name $zone rule 170 action 'accept'
  set firewall ipv4 name $zone rule 170 destination port 'domain,domain-s'
  set firewall ipv4 name $zone rule 170 protocol 'tcp_udp'
}

function allow-traffic-wireguard {
  zone=$1

  # set firewall ipv4 name $zone rule 180 description 'Rule: accept wireguard'
  set firewall ipv4 name $zone rule 180 action 'accept'
  set firewall ipv4 name $zone rule 180 destination port '51820'
  set firewall ipv4 name $zone rule 180 protocol 'udp'
}

function allow-traffic-iperf {
  zone=$1

  # set firewall ipv4 name $zone rule 330 description 'Rule: accept iperf'
  set firewall ipv4 name $zone rule 330 action 'accept'
  set firewall ipv4 name $zone rule 330 destination port '5001'
  set firewall ipv4 name $zone rule 330 protocol 'tcp'
}

function drop-traffic-port-10001 {
  zone=$1

  # set firewall ipv4 name $zone rule 900 description 'Rule: drop 10001 (no log)'
  set firewall ipv4 name $zone rule 900 action 'drop'
  set firewall ipv4 name $zone rule 900 destination port '10001'
  set firewall ipv4 name $zone rule 900 protocol 'udp'
}

function drop-traffic-multicast-224 {
  zone=$1

  # set firewall ipv4 name $zone rule 910 description 'Rule: drop multicast to 224.0.0.1 (no log)'
  set firewall ipv4 name $zone rule 910 action 'drop'
  set firewall ipv4 name $zone rule 910 destination address '224.0.0.1'
  set firewall ipv4 name $zone rule 910 protocol '2'
}

function drop-traffic-invalid {
  zone=$1

  set firewall ipv4 name $zone rule 999 action 'drop'
  set firewall ipv4 name $zone rule 999 description 'Rule: drop_invalid'
  set firewall ipv4 name $zone rule 999 state invalid
  set firewall ipv4 name $zone rule 999 log
}
