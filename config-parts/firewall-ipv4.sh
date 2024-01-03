#!/bin/vbash
# shellcheck disable=all

function allow-traffic-plex {
  zone=$1

  # set firewall ipv4 name $zone rule 370 description 'Rule: accept plex users'
  set firewall ipv4 name $zone rule 370 action 'accept'
  set firewall ipv4 name $zone rule 370 source group address-group 'plex-users'
  set firewall ipv4 name $zone rule 370 destination group address-group 'plex-server'
  set firewall ipv4 name $zone rule 370 destination port '32400'
  set firewall ipv4 name $zone rule 370 protocol 'tcp'
}

function allow-traffic-printer {
  zone=$1

  # set firewall ipv4 name $zone rule 380 description 'Rule: accept_tcp_printer_from_allowed_devices'
  set firewall ipv4 name $zone rule 380 action 'accept'
  set firewall ipv4 name $zone rule 380 destination group address-group 'printers'
  set firewall ipv4 name $zone rule 380 destination port 'http,https,9100'
  set firewall ipv4 name $zone rule 380 protocol 'tcp'
}

function allow-traffic-scanner {
  zone=$1

  # set firewall ipv4 name $zone rule 360 description 'Rule: accept scanner traffic'
  set firewall ipv4 name $zone rule 360 action 'accept'
  set firewall ipv4 name $zone rule 360 destination group address-group 'scanner-clients'
  set firewall ipv4 name $zone rule 360 destination group port-group 'scanner-outbound-ports'
  set firewall ipv4 name $zone rule 360 protocol 'udp'
}

function allow-traffic-rtsp {
  zone=$1

  # set firewall ipv4 name $zone rule 500 description 'Rule: accept rtsp'
  set firewall ipv4 name $zone rule 500 action 'accept'
  set firewall ipv4 name $zone rule 500 destination group address-group 'unifi-unvr'
}

function allow-traffic-sonos {
  zone=$1

  # set firewall ipv4 name $zone rule 400 description 'Rule: accept_discovery_from_sonos_controllers'
  set firewall ipv4 name $zone rule 400 action 'accept'
  set firewall ipv4 name $zone rule 400 source group address-group 'sonos-controllers'
  set firewall ipv4 name $zone rule 400 destination port '1900,1901,1902,57621'
  set firewall ipv4 name $zone rule 400 protocol 'udp'
  # set firewall ipv4 name $zone rule 410 description 'Rule: accept_discovery_from_sonos_players'
  set firewall ipv4 name $zone rule 410 action 'accept'
  set firewall ipv4 name $zone rule 410 destination port '1900,1901,1902'
  set firewall ipv4 name $zone rule 410 protocol 'udp'
  set firewall ipv4 name $zone rule 410 source group address-group 'sonos-players'
  # set firewall ipv4 name $zone rule 420 description 'Rule: accept_udp_from_sonos_players_to_sonos_controllers'
  set firewall ipv4 name $zone rule 420 action 'accept'
  set firewall ipv4 name $zone rule 420 source group address-group 'sonos-players'
  set firewall ipv4 name $zone rule 420 destination group address-group 'sonos-controllers'
  set firewall ipv4 name $zone rule 420 destination port '319,320,30000-65535'
  set firewall ipv4 name $zone rule 420 protocol 'udp'
  # set firewall ipv4 name $zone rule 421 description 'Rule: accept_tcp_from_sonos_players_to_sonos_controllers'
  set firewall ipv4 name $zone rule 421 action 'accept'
  set firewall ipv4 name $zone rule 421 source group address-group 'sonos-players'
  set firewall ipv4 name $zone rule 421 destination group address-group 'sonos-controllers'
  set firewall ipv4 name $zone rule 421 destination port '1400,3400,3401,3500,30000-65535'
  set firewall ipv4 name $zone rule 421 protocol 'tcp'
  # set firewall ipv4 name $zone rule 430 description 'Rule: accept_tcp_from_sonos_controllers_to_sonos_players'
  set firewall ipv4 name $zone rule 430 action 'accept'
  set firewall ipv4 name $zone rule 430 source group address-group 'sonos-controllers'
  set firewall ipv4 name $zone rule 430 destination group address-group 'sonos-players'
  set firewall ipv4 name $zone rule 430 destination port '1400,1443,4444,7000,30000-65535'
  set firewall ipv4 name $zone rule 430 protocol 'tcp'
  # set firewall ipv4 name $zone rule 431 description 'Rule: accept_udp_from_sonos_controllers_to_sonos_players'
  set firewall ipv4 name $zone rule 431 action 'accept'
  set firewall ipv4 name $zone rule 431 source group address-group 'sonos-controllers'
  set firewall ipv4 name $zone rule 431 destination group address-group 'sonos-players'
  set firewall ipv4 name $zone rule 431 destination port '319,320,30000-65535'
  set firewall ipv4 name $zone rule 431 protocol 'udp'
  # set firewall ipv4 name $zone rule 440 description 'Rule: accept_discovery_from_sonos_players'
  set firewall ipv4 name $zone rule 440 action 'accept'
  set firewall ipv4 name $zone rule 440 source group address-group 'sonos-players'
  set firewall ipv4 name $zone rule 440 destination port '1900,1901,1902'
  set firewall ipv4 name $zone rule 440 protocol 'udp'
  # set firewall ipv4 name $zone rule 450 description 'Rule: accept_discovery_from_sonos_controllers'
  set firewall ipv4 name $zone rule 450 action 'accept'
  set firewall ipv4 name $zone rule 450 source group address-group 'sonos-controllers'
  set firewall ipv4 name $zone rule 450 destination port '1900,1901,1902,57621'
  set firewall ipv4 name $zone rule 450 protocol 'udp'
  # set firewall ipv4 name $zone rule 460 description 'Rule: accept_music_library_sonos_players'
  set firewall ipv4 name $zone rule 460 action 'accept'
  set firewall ipv4 name $zone rule 460 source group address-group 'sonos-players'
  set firewall ipv4 name $zone rule 460 destination group address-group 'sonos-library'
  set firewall ipv4 name $zone rule 460 destination port '4534,http,https'
  set firewall ipv4 name $zone rule 460 protocol 'tcp'
}

create-firewall-rules guest
  interfaces bond0.99
  to-vlan homelab drop-log
    allow-traffic plex
  to-vlan iot drop-log
    allow-traffic printer sonos
  to-vlan lan drop-log
  to-vlan local drop-log
    allow-traffic dhcp igmp mdns ntp sonos
  to-vlan servers drop-log
  to-vlan services drop-log
    allow-traffic dns
  to-vlan staging drop-log
  to-vlan trusted drop-log
  to-vlan wan accept

create-firewall-rules homelab
  interfaces bond0.11
  to-vlan guest drop-log
  to-vlan iot accept
  to-vlan lan drop-log
    allow-traffic icmp rtsp
  to-vlan local drop-log
    allow-traffic bgp dhcp icmp iperf ntp sonos
    drop-traffic multicast-224
  to-vlan servers accept
  to-vlan services accept
  to-vlan staging accept
  to-vlan trusted drop
    allow-traffic icmp
  to-vlan wan accept

create-firewall-rules iot
  interfaces bond0.98
  to-vlan guest drop-log
    allow-traffic sonos
  to-vlan homelab drop-log
    allow-traffic plex sonos
  to-vlan lan drop-log
  to-vlan local drop-log
    allow-traffic dhcp igmp mdns ntp sonos
  to-vlan servers drop-log
  to-vlan services drop-log
  to-vlan staging drop-log
  to-vlan trusted drop-log
    allow-traffic scanner sonos
  to-vlan wan accept

create-firewall-rules lan
  interfaces bond0 eth4
  to-vlan guest drop-log
  to-vlan homelab drop-log
  to-vlan iot drop-log
  to-vlan local drop-log
    allow-traffic dhcp ntp ssh
    drop-traffic multicast-224 port-10001
  to-vlan servers drop-log
  to-vlan services accept-log
    allow-traffic dns
  to-vlan staging drop-log
  to-vlan trusted drop-log
    drop-traffic port-10001
  to-vlan wan accept

create-firewall-rules local
  interfaces local-zone
  to-vlan guest drop-log
    allow-traffic igmp mdns sonos
  to-vlan homelab drop-log
    allow-traffic bgp icmp sonos
  to-vlan iot drop-log
    allow-traffic icmp igmp mdns sonos
  to-vlan lan drop-log
    allow-traffic icmp ssh
  to-vlan servers drop-log
    allow-traffic bgp icmp
  to-vlan services accept
  to-vlan staging drop-log
    allow-traffic bgp icmp
  to-vlan trusted drop-log
    allow-traffic icmp igmp mdns sonos wireguard
  to-vlan wan accept

create-firewall-rules servers
  interfaces bond0.10
  to-vlan guest drop-log
  to-vlan homelab accept
  to-vlan iot accept
  to-vlan lan drop-log
    allow-traffic icmp rtsp
  to-vlan local drop-log
    allow-traffic bgp icmp iperf dhcp ntp ssh
    drop-traffic multicast-224
  to-vlan services accept
  to-vlan staging accept
  to-vlan trusted drop
    allow-traffic icmp ssh
  to-vlan wan accept

create-firewall-rules services
  interfaces pod-services
  to-vlan guest drop-log
  to-vlan homelab accept
  to-vlan iot drop-log
    allow-traffic icmp
  to-vlan lan accept-log
    allow-traffic icmp
  to-vlan local accept-log
    allow-traffic ntp
  to-vlan servers accept
  to-vlan staging accept
  to-vlan trusted drop-log
  to-vlan wan accept

create-firewall-rules staging
  interfaces bond0.12
  to-vlan guest drop-log
  to-vlan homelab accept
  to-vlan iot accept
  to-vlan lan drop-log
    allow-traffic icmp
  to-vlan local drop-log
    allow-traffic bgp dhcp icmp ntp
    drop-traffic multicast-224
  to-vlan servers accept
  to-vlan services accept
  to-vlan trusted drop
    allow-traffic icmp
  to-vlan wan accept

create-firewall-rules trusted
  interfaces bond0.20 eth4.20 wg01
  to-vlan guest drop-log
  to-vlan homelab drop-log
  to-vlan iot accept
    allow-traffic sonos
  to-vlan lan drop-log
  to-vlan local drop-log
    allow-traffic dhcp icmp igmp iperf mdns ntp sonos ssh
  to-vlan servers drop-log
  to-vlan services accept
  to-vlan staging drop-log
  to-vlan wan accept

create-firewall-rules wan
  interfaces eth5
  to-vlan guest drop-log
  to-vlan homelab drop-log
  to-vlan iot drop-log
  to-vlan lan drop-log
  to-vlan local drop-log
    allow-traffic wireguard
  to-vlan servers drop-log
  to-vlan services drop-log
  to-vlan staging drop-log
  to-vlan trusted drop-log


# From GUEST to IOT
# set firewall ipv4 name guest-iot rule 430 action 'accept'
# set firewall ipv4 name guest-iot rule 430 description 'Rule: accept_tcp_from_sonos_controllers_to_sonos_players'
# set firewall ipv4 name guest-iot rule 430 destination group address-group 'sonos-players'
# set firewall ipv4 name guest-iot rule 430 destination port '1400,1443,4444,7000,30000-65535'
# set firewall ipv4 name guest-iot rule 430 protocol 'tcp'
# set firewall ipv4 name guest-iot rule 430 source group address-group 'sonos-controllers'
# set firewall ipv4 name guest-iot rule 431 action 'accept'
# set firewall ipv4 name guest-iot rule 431 description 'Rule: accept_udp_from_sonos_controllers_to_sonos_players'
# set firewall ipv4 name guest-iot rule 431 destination group address-group 'sonos-players'
# set firewall ipv4 name guest-iot rule 431 destination port '319,320,30000-65535'
# set firewall ipv4 name guest-iot rule 431 protocol 'udp'
# set firewall ipv4 name guest-iot rule 431 source group address-group 'sonos-controllers'

# From GUEST to LOCAL
# set firewall ipv4 name guest-local rule 450 action 'accept'
# set firewall ipv4 name guest-local rule 450 description 'Rule: accept_discovery_from_sonos_controllers'
# set firewall ipv4 name guest-local rule 450 destination port '1900,1901,1902,57621'
# set firewall ipv4 name guest-local rule 450 protocol 'udp'
# set firewall ipv4 name guest-local rule 450 source group address-group 'sonos-controllers'


# From HOMELAB to LOCAL
set firewall ipv4 name homelab-local rule 350 action 'accept'
set firewall ipv4 name homelab-local rule 350 description 'Rule: accept prometheus metrics scrape'
set firewall ipv4 name homelab-local rule 350 destination group port-group 'prometheus-metrics'
set firewall ipv4 name homelab-local rule 350 protocol 'tcp'
# set firewall ipv4 name homelab-local rule 450 action 'accept'
# set firewall ipv4 name homelab-local rule 450 description 'Rule: accept_discovery_from_sonos_controllers'
# set firewall ipv4 name homelab-local rule 450 destination port '1900,1901,1902,57621'
# set firewall ipv4 name homelab-local rule 450 protocol 'udp'
# set firewall ipv4 name homelab-local rule 450 source group address-group 'sonos-controllers'

# From IOT to GUEST
# set firewall ipv4 name iot-guest rule 420 action 'accept'
# set firewall ipv4 name iot-guest rule 420 description 'Rule: accept_udp_from_sonos_players_to_sonos_controllers'
# set firewall ipv4 name iot-guest rule 420 destination group address-group 'sonos-controllers'
# set firewall ipv4 name iot-guest rule 420 destination port '319,320,30000-65535'
# set firewall ipv4 name iot-guest rule 420 protocol 'udp'
# set firewall ipv4 name iot-guest rule 420 source group address-group 'sonos-players'
# set firewall ipv4 name iot-guest rule 421 action 'accept'
# set firewall ipv4 name iot-guest rule 421 description 'Rule: accept_tcp_from_sonos_players_to_sonos_controllers'
# set firewall ipv4 name iot-guest rule 421 destination group address-group 'sonos-controllers'
# set firewall ipv4 name iot-guest rule 421 destination port '1400,3400,3401,3500,30000-65535'
# set firewall ipv4 name iot-guest rule 421 protocol 'tcp'
# set firewall ipv4 name iot-guest rule 421 source group address-group 'sonos-players'

# From IOT to HOMELAB
# set firewall ipv4 name iot-homelab rule 420 action 'accept'
# set firewall ipv4 name iot-homelab rule 420 description 'Rule: accept_udp_from_sonos_players_to_sonos_controllers'
# set firewall ipv4 name iot-homelab rule 420 destination group address-group 'sonos-controllers'
# set firewall ipv4 name iot-homelab rule 420 destination port '319,320,30000-65535'
# set firewall ipv4 name iot-homelab rule 420 protocol 'udp'
# set firewall ipv4 name iot-homelab rule 420 source group address-group 'sonos-players'
# set firewall ipv4 name iot-homelab rule 421 action 'accept'
# set firewall ipv4 name iot-homelab rule 421 description 'Rule: accept_tcp_from_sonos_players_to_sonos_controllers'
# set firewall ipv4 name iot-homelab rule 421 destination group address-group 'sonos-controllers'
# set firewall ipv4 name iot-homelab rule 421 destination port '1400,3400,3401,3500,30000-65535'
# set firewall ipv4 name iot-homelab rule 421 protocol 'tcp'
# set firewall ipv4 name iot-homelab rule 421 source group address-group 'sonos-players'
# set firewall ipv4 name iot-homelab rule 460 action 'accept'
# set firewall ipv4 name iot-homelab rule 460 description 'Rule: accept_music_library_sonos_players'
# set firewall ipv4 name iot-homelab rule 460 destination group address-group 'sonos-library'
# set firewall ipv4 name iot-homelab rule 460 destination port '4534,http,https'
# set firewall ipv4 name iot-homelab rule 460 protocol 'tcp'
# set firewall ipv4 name iot-homelab rule 460 source group address-group 'sonos-players'

# From IOT to LOCAL
# set firewall ipv4 name iot-local rule 440 action 'accept'
# set firewall ipv4 name iot-local rule 440 description 'Rule: accept_discovery_from_sonos_players'
# set firewall ipv4 name iot-local rule 440 destination port '1900,1901,1902'
# set firewall ipv4 name iot-local rule 440 protocol 'udp'
# set firewall ipv4 name iot-local rule 440 source group address-group 'sonos-players'

# From IOT to TRUSTED
# set firewall ipv4 name iot-trusted rule 420 action 'accept'
# set firewall ipv4 name iot-trusted rule 420 description 'Rule: accept_udp_from_sonos_players_to_sonos_controllers'
# set firewall ipv4 name iot-trusted rule 420 destination group address-group 'sonos-controllers'
# set firewall ipv4 name iot-trusted rule 420 destination port '319,320,30000-65535'
# set firewall ipv4 name iot-trusted rule 420 protocol 'udp'
# set firewall ipv4 name iot-trusted rule 420 source group address-group 'sonos-players'
# set firewall ipv4 name iot-trusted rule 421 action 'accept'
# set firewall ipv4 name iot-trusted rule 421 description 'Rule: accept_tcp_from_sonos_players_to_sonos_controllers'
# set firewall ipv4 name iot-trusted rule 421 destination group address-group 'sonos-controllers'
# set firewall ipv4 name iot-trusted rule 421 destination port '1400,3400,3401,3500,30000-65535'
# set firewall ipv4 name iot-trusted rule 421 protocol 'tcp'
# set firewall ipv4 name iot-trusted rule 421 source group address-group 'sonos-players'

# From LAN to SERVICES
set firewall ipv4 name lan-services rule 300 action 'accept'
set firewall ipv4 name lan-services rule 300 description 'Rule: accept unifi'
set firewall ipv4 name lan-services rule 300 destination group address-group 'unifi-controller'

# From LOCAL to GUEST
# set firewall ipv4 name local-guest rule 410 action 'accept'
# set firewall ipv4 name local-guest rule 410 description 'Rule: accept_discovery_from_sonos_players'
# set firewall ipv4 name local-guest rule 410 destination port '1900,1901,1902'
# set firewall ipv4 name local-guest rule 410 protocol 'udp'
# set firewall ipv4 name local-guest rule 410 source group address-group 'sonos-players'

# From LOCAL to HOMELAB
set firewall ipv4 name local-homelab rule 310 action 'accept'
set firewall ipv4 name local-homelab rule 310 description 'Rule: accept vector syslog'
set firewall ipv4 name local-homelab rule 310 destination port '6003'
set firewall ipv4 name local-homelab rule 310 protocol 'tcp'
# set firewall ipv4 name local-homelab rule 410 action 'accept'
# set firewall ipv4 name local-homelab rule 410 description 'Rule: accept_discovery_from_sonos_players'
# set firewall ipv4 name local-homelab rule 410 destination port '1900,1901,1902'
# set firewall ipv4 name local-homelab rule 410 protocol 'udp'
# set firewall ipv4 name local-homelab rule 410 source group address-group 'sonos-players'

# From LOCAL to IOT
# set firewall ipv4 name local-iot rule 400 action 'accept'
# set firewall ipv4 name local-iot rule 400 description 'Rule: accept_discovery_from_sonos_controllers'
# set firewall ipv4 name local-iot rule 400 destination port '1900,1901,1902,57621'
# set firewall ipv4 name local-iot rule 400 protocol 'udp'
# set firewall ipv4 name local-iot rule 400 source group address-group 'sonos-controllers'

# From LOCAL to TRUSTED
# set firewall ipv4 name local-trusted rule 410 action 'accept'
# set firewall ipv4 name local-trusted rule 410 description 'Rule: accept_discovery_from_sonos_players'
# set firewall ipv4 name local-trusted rule 410 destination port '1900,1901,1902'
# set firewall ipv4 name local-trusted rule 410 protocol 'udp'
# set firewall ipv4 name local-trusted rule 410 source group address-group 'sonos-players'

# From STAGING to LOCAL
set firewall ipv4 name staging-local rule 350 action 'accept'
set firewall ipv4 name staging-local rule 350 description 'Rule: accept prometheus metrics scrape'
set firewall ipv4 name staging-local rule 350 destination group port-group 'prometheus-metrics'
set firewall ipv4 name staging-local rule 350 protocol 'tcp'

# From TRUSTED to HOMELAB
set firewall ipv4 name trusted-homelab rule 520 action 'accept'
set firewall ipv4 name trusted-homelab rule 520 description 'Rule: accept scotte'
set firewall ipv4 name trusted-homelab rule 520 source group address-group 'scotte-devices'
set firewall ipv4 name trusted-homelab rule 530 action 'accept'
set firewall ipv4 name trusted-homelab rule 530 description 'Rule: accept sophie'
set firewall ipv4 name trusted-homelab rule 530 source group address-group 'sophie-devices'

# From TRUSTED to IOT
# set firewall ipv4 name trusted-iot rule 430 action 'accept'
# set firewall ipv4 name trusted-iot rule 430 description 'Rule: accept_tcp_from_sonos_controllers_to_sonos_players'
# set firewall ipv4 name trusted-iot rule 430 destination group address-group 'sonos-players'
# set firewall ipv4 name trusted-iot rule 430 destination port '1400,1443,4444,7000,30000-65535'
# set firewall ipv4 name trusted-iot rule 430 protocol 'tcp'
# set firewall ipv4 name trusted-iot rule 430 source group address-group 'sonos-controllers'
# set firewall ipv4 name trusted-iot rule 431 action 'accept'
# set firewall ipv4 name trusted-iot rule 431 description 'Rule: accept_udp_from_sonos_controllers_to_sonos_players'
# set firewall ipv4 name trusted-iot rule 431 destination group address-group 'sonos-players'
# set firewall ipv4 name trusted-iot rule 431 destination port '319,320,30000-65535'
# set firewall ipv4 name trusted-iot rule 431 protocol 'udp'
# set firewall ipv4 name trusted-iot rule 431 source group address-group 'sonos-controllers'

# From TRUSTED to LAN
set firewall ipv4 name trusted-lan rule 520 action 'accept'
set firewall ipv4 name trusted-lan rule 520 description 'Rule: accept scotte'
set firewall ipv4 name trusted-lan rule 520 source group address-group 'scotte-devices'
set firewall ipv4 name trusted-lan rule 540 action 'accept'
set firewall ipv4 name trusted-lan rule 540 description 'Rule: accept cameras'
set firewall ipv4 name trusted-lan rule 540 source group address-group 'unifi-cameras'

# From TRUSTED to LOCAL
set firewall ipv4 name trusted-local rule 320 action 'accept'
set firewall ipv4 name trusted-local rule 320 description 'Rule: accept vnstat'
set firewall ipv4 name trusted-local rule 320 destination port '8685'
set firewall ipv4 name trusted-local rule 320 protocol 'tcp'
set firewall ipv4 name trusted-local rule 340 action 'drop'
set firewall ipv4 name trusted-local rule 340 description 'Rule: ignore scansnap probe'
set firewall ipv4 name trusted-local rule 340 destination address '255.255.255.255'
set firewall ipv4 name trusted-local rule 340 destination port '52217'
set firewall ipv4 name trusted-local rule 340 protocol 'udp'
set firewall ipv4 name trusted-local rule 340 source group address-group 'scanner-clients'
# set firewall ipv4 name trusted-local rule 450 action 'accept'
# set firewall ipv4 name trusted-local rule 450 description 'Rule: accept_discovery_from_sonos_controllers'
# set firewall ipv4 name trusted-local rule 450 destination port '1900,1901,1902,57621'
# set firewall ipv4 name trusted-local rule 450 protocol 'udp'
# set firewall ipv4 name trusted-local rule 450 source group address-group 'sonos-controllers'

# From TRUSTED to SERVERS
set firewall ipv4 name trusted-servers rule 520 action 'accept'
set firewall ipv4 name trusted-servers rule 520 description 'Rule: accept scotte'
set firewall ipv4 name trusted-servers rule 520 source group address-group 'scotte-devices'
set firewall ipv4 name trusted-servers rule 530 action 'accept'
set firewall ipv4 name trusted-servers rule 530 description 'Rule: accept sophie'
set firewall ipv4 name trusted-servers rule 530 source group address-group 'sophie-devices'

# From TRUSTED to STAGING
set firewall ipv4 name trusted-staging rule 520 action 'accept'
set firewall ipv4 name trusted-staging rule 520 description 'Rule: accept scotte'
set firewall ipv4 name trusted-staging rule 520 source group address-group 'scotte-devices'
