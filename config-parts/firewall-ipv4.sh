#!/bin/vbash
# shellcheck disable=all

create-firewall-rules guest
  interfaces bond0.99
  to-vlan homelab drop-log
  to-vlan iot drop-log
  to-vlan lan drop-log
  to-vlan local drop-log
  to-vlan servers drop-log
  to-vlan services drop-log
  to-vlan staging drop-log
  to-vlan trusted drop-log
  to-vlan wan accept

create-firewall-rules homelab
  interfaces bond0.11
  to-vlan guest drop-log
  to-vlan iot accept
  to-vlan lan drop-log
  to-vlan local drop-log
  to-vlan servers accept
  to-vlan services accept
  to-vlan staging accept
  to-vlan trusted drop
  to-vlan wan accept

create-firewall-rules iot
  interfaces bond0.98
  to-vlan guest drop-log
  to-vlan homelab drop-log
  to-vlan lan drop-log
  to-vlan local drop-log
  to-vlan servers drop-log
  to-vlan services drop-log
  to-vlan staging drop-log
  to-vlan trusted drop-log
  to-vlan wan accept

create-firewall-rules lan
  interfaces bond0 eth4
  to-vlan guest drop-log
  to-vlan homelab drop-log
  to-vlan iot drop-log
  to-vlan local drop-log
  to-vlan servers drop-log
  to-vlan services accept-log
  to-vlan staging drop-log
  to-vlan trusted drop-log
  to-vlan wan accept

create-firewall-rules local
  interfaces local-zone
  to-vlan guest drop-log
  to-vlan homelab drop-log
  to-vlan iot drop-log
  to-vlan lan drop-log
  to-vlan servers drop-log
  to-vlan services accept
  to-vlan staging drop-log
  to-vlan trusted drop-log
  to-vlan wan accept

create-firewall-rules servers
  interfaces bond0.10
  to-vlan guest drop-log
  to-vlan homelab accept
  to-vlan iot accept
  to-vlan lan drop-log
  to-vlan local drop-log
  to-vlan services accept
  to-vlan staging accept
  to-vlan trusted drop
  to-vlan wan accept

create-firewall-rules services
  interfaces pod-services
  to-vlan guest drop-log
  to-vlan homelab accept
  to-vlan iot drop-log
  to-vlan lan accept-log
  to-vlan local accept-log
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
  to-vlan local drop-log
  to-vlan servers accept
  to-vlan services accept
  to-vlan trusted drop
  to-vlan wan accept

create-firewall-rules trusted
  interfaces bond0.20 eth4.20 wg01
  to-vlan guest drop-log
  to-vlan homelab drop-log
  to-vlan iot accept
  to-vlan lan drop-log
  to-vlan local drop-log
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
  to-vlan servers drop-log
  to-vlan services drop-log
  to-vlan staging drop-log
  to-vlan trusted drop-log

# From GUEST to HOMELAB
# set firewall ipv4 name guest-homelab description 'From GUEST to HOMELAB'
# set firewall ipv4 name guest-homelab default-action 'drop'
# set firewall ipv4 name guest-homelab default-log
set firewall ipv4 name guest-homelab rule 370 action 'accept'
set firewall ipv4 name guest-homelab rule 370 description 'Rule: accept plex users'
set firewall ipv4 name guest-homelab rule 370 destination group address-group 'plex-server'
set firewall ipv4 name guest-homelab rule 370 destination port '32400'
set firewall ipv4 name guest-homelab rule 370 protocol 'tcp'
set firewall ipv4 name guest-homelab rule 370 source group address-group 'plex-users'

# From GUEST to IOT
# set firewall ipv4 name guest-iot description 'From GUEST to IOT'
# set firewall ipv4 name guest-iot default-action 'drop'
# set firewall ipv4 name guest-iot default-log
set firewall ipv4 name guest-iot rule 380 action 'accept'
set firewall ipv4 name guest-iot rule 380 description 'Rule: accept_tcp_printer_from_allowed_devices'
set firewall ipv4 name guest-iot rule 380 destination group address-group 'printers'
set firewall ipv4 name guest-iot rule 380 destination port 'http,https,9100'
set firewall ipv4 name guest-iot rule 380 protocol 'tcp'
set firewall ipv4 name guest-iot rule 430 action 'accept'
set firewall ipv4 name guest-iot rule 430 description 'Rule: accept_tcp_from_sonos_controllers_to_sonos_players'
set firewall ipv4 name guest-iot rule 430 destination group address-group 'sonos-players'
set firewall ipv4 name guest-iot rule 430 destination port '1400,1443,4444,7000,30000-65535'
set firewall ipv4 name guest-iot rule 430 protocol 'tcp'
set firewall ipv4 name guest-iot rule 430 source group address-group 'sonos-controllers'
set firewall ipv4 name guest-iot rule 431 action 'accept'
set firewall ipv4 name guest-iot rule 431 description 'Rule: accept_udp_from_sonos_controllers_to_sonos_players'
set firewall ipv4 name guest-iot rule 431 destination group address-group 'sonos-players'
set firewall ipv4 name guest-iot rule 431 destination port '319,320,30000-65535'
set firewall ipv4 name guest-iot rule 431 protocol 'udp'
set firewall ipv4 name guest-iot rule 431 source group address-group 'sonos-controllers'

# From GUEST to LAN
# set firewall ipv4 name guest-lan description 'From GUEST to LAN'
# set firewall ipv4 name guest-lan default-action 'drop'
# set firewall ipv4 name guest-lan default-log

# From GUEST to LOCAL
# set firewall ipv4 name guest-local description 'From GUEST to LOCAL'
# set firewall ipv4 name guest-local default-action 'drop'
# set firewall ipv4 name guest-local default-log
set firewall ipv4 name guest-local rule 100 action 'accept'
set firewall ipv4 name guest-local rule 100 description 'Rule: accept ntp'
set firewall ipv4 name guest-local rule 100 destination port 'ntp'
set firewall ipv4 name guest-local rule 100 protocol 'udp'
set firewall ipv4 name guest-local rule 110 action 'accept'
set firewall ipv4 name guest-local rule 110 description 'Rule: accept dhcp'
set firewall ipv4 name guest-local rule 110 destination port 'bootps,bootpc'
set firewall ipv4 name guest-local rule 110 protocol 'udp'
set firewall ipv4 name guest-local rule 110 source port 'bootps,bootpc'
set firewall ipv4 name guest-local rule 120 action 'accept'
set firewall ipv4 name guest-local rule 120 description 'Rule: accept igmp'
set firewall ipv4 name guest-local rule 120 protocol '2'
set firewall ipv4 name guest-local rule 130 action 'accept'
set firewall ipv4 name guest-local rule 130 description 'Rule: accept mdns'
set firewall ipv4 name guest-local rule 130 destination port 'mdns'
set firewall ipv4 name guest-local rule 130 protocol 'udp'
set firewall ipv4 name guest-local rule 130 source port 'mdns'
set firewall ipv4 name guest-local rule 450 action 'accept'
set firewall ipv4 name guest-local rule 450 description 'Rule: accept_discovery_from_sonos_controllers'
set firewall ipv4 name guest-local rule 450 destination port '1900,1901,1902,57621'
set firewall ipv4 name guest-local rule 450 protocol 'udp'
set firewall ipv4 name guest-local rule 450 source group address-group 'sonos-controllers'

# From GUEST to SERVERS
# set firewall ipv4 name guest-servers description 'From GUEST to SERVERS'
# set firewall ipv4 name guest-servers default-action 'drop'
# set firewall ipv4 name guest-servers default-log

# From GUEST to SERVICES
# set firewall ipv4 name guest-services description 'From GUEST to SERVICES'
# set firewall ipv4 name guest-services default-action 'drop'
# set firewall ipv4 name guest-services default-log
set firewall ipv4 name guest-services rule 170 action 'accept'
set firewall ipv4 name guest-services rule 170 description 'Rule: accept dns'
set firewall ipv4 name guest-services rule 170 destination port 'domain,domain-s'
set firewall ipv4 name guest-services rule 170 protocol 'tcp_udp'

# From GUEST to STAGING
# set firewall ipv4 name guest-staging description 'From GUEST to STAGING'
# set firewall ipv4 name guest-staging default-action 'drop'
# set firewall ipv4 name guest-staging default-log

# From GUEST to TRUSTED
# set firewall ipv4 name guest-trusted description 'From GUEST to TRUSTED'
# set firewall ipv4 name guest-trusted default-action 'drop'
# set firewall ipv4 name guest-trusted default-log

# From GUEST to WAN
# set firewall ipv4 name guest-wan description 'From IOT to WAN'
# set firewall ipv4 name guest-wan default-action 'accept'

# From HOMELAB to GUEST
# set firewall ipv4 name homelab-guest description 'From HOMELAB to GUEST'
# set firewall ipv4 name homelab-guest default-action 'drop'
# set firewall ipv4 name homelab-guest default-log

# From HOMELAB to IOT
# set firewall ipv4 name homelab-iot description 'From HOMELAB to IOT'
# set firewall ipv4 name homelab-iot default-action 'accept'

# From HOMELAB to LAN
# set firewall ipv4 name homelab-lan description 'From HOMELAB to LAN'
# set firewall ipv4 name homelab-lan default-action 'drop'
# set firewall ipv4 name homelab-lan default-log
set firewall ipv4 name homelab-lan rule 140 action 'accept'
set firewall ipv4 name homelab-lan rule 140 description 'Rule: accept icmp'
set firewall ipv4 name homelab-lan rule 140 protocol 'icmp'
set firewall ipv4 name homelab-lan rule 500 action 'accept'
set firewall ipv4 name homelab-lan rule 500 description 'Rule: accept rtsp'
set firewall ipv4 name homelab-lan rule 500 destination group address-group 'unifi-unvr'

# From HOMELAB to LOCAL
# set firewall ipv4 name homelab-local description 'From HOMELAB to LOCAL'
# set firewall ipv4 name homelab-local default-action 'drop'
# set firewall ipv4 name homelab-local default-log
set firewall ipv4 name homelab-local rule 100 action 'accept'
set firewall ipv4 name homelab-local rule 100 description 'Rule: accept ntp'
set firewall ipv4 name homelab-local rule 100 destination port 'ntp'
set firewall ipv4 name homelab-local rule 100 protocol 'udp'
set firewall ipv4 name homelab-local rule 110 action 'accept'
set firewall ipv4 name homelab-local rule 110 description 'Rule: accept dhcp'
set firewall ipv4 name homelab-local rule 110 destination port 'bootps,bootpc'
set firewall ipv4 name homelab-local rule 110 protocol 'udp'
set firewall ipv4 name homelab-local rule 110 source port 'bootps,bootpc'
set firewall ipv4 name homelab-local rule 140 action 'accept'
set firewall ipv4 name homelab-local rule 140 description 'Rule: accept icmp'
set firewall ipv4 name homelab-local rule 140 protocol 'icmp'
set firewall ipv4 name homelab-local rule 150 action 'accept'
set firewall ipv4 name homelab-local rule 150 description 'Rule: accept bgp'
set firewall ipv4 name homelab-local rule 150 destination port 'bgp'
set firewall ipv4 name homelab-local rule 150 protocol 'tcp'
set firewall ipv4 name homelab-local rule 330 action 'accept'
set firewall ipv4 name homelab-local rule 330 description 'Rule: accept iperf'
set firewall ipv4 name homelab-local rule 330 destination port '5001'
set firewall ipv4 name homelab-local rule 330 protocol 'tcp'
set firewall ipv4 name homelab-local rule 350 action 'accept'
set firewall ipv4 name homelab-local rule 350 description 'Rule: accept prometheus metrics scrape'
set firewall ipv4 name homelab-local rule 350 destination group port-group 'prometheus-metrics'
set firewall ipv4 name homelab-local rule 350 protocol 'tcp'
set firewall ipv4 name homelab-local rule 450 action 'accept'
set firewall ipv4 name homelab-local rule 450 description 'Rule: accept_discovery_from_sonos_controllers'
set firewall ipv4 name homelab-local rule 450 destination port '1900,1901,1902,57621'
set firewall ipv4 name homelab-local rule 450 protocol 'udp'
set firewall ipv4 name homelab-local rule 450 source group address-group 'sonos-controllers'
set firewall ipv4 name homelab-local rule 910 action 'drop'
set firewall ipv4 name homelab-local rule 910 description 'Rule: drop multicast to 224.0.0.1 (no log)'
set firewall ipv4 name homelab-local rule 910 destination address '224.0.0.1'
set firewall ipv4 name homelab-local rule 910 protocol '2'

# From HOMELAB to SERVERS
# set firewall ipv4 name homelab-servers description 'From HOMELAB to SERVERS'
# set firewall ipv4 name homelab-servers default-action 'accept'

# From HOMELAB to SERVICES
# set firewall ipv4 name homelab-services description 'From HOMELAB to SERVICES'
# set firewall ipv4 name homelab-services default-action 'accept'

# From HOMELAB to STAGING
# set firewall ipv4 name homelab-staging description 'From HOMELAB to STAGING'
# set firewall ipv4 name homelab-staging default-action 'accept'

# From HOMELAB to TRUSTED
# set firewall ipv4 name homelab-trusted description 'From HOMELAB to TRUSTED'
# set firewall ipv4 name homelab-trusted default-action 'drop'
set firewall ipv4 name homelab-trusted rule 140 action 'accept'
set firewall ipv4 name homelab-trusted rule 140 description 'Rule: accept icmp'
set firewall ipv4 name homelab-trusted rule 140 protocol 'icmp'

# From HOMELAB to WAN
# set firewall ipv4 name homelab-wan description 'From HOMELAB to WAN'
# set firewall ipv4 name homelab-wan default-action 'accept'

# From IOT to GUEST
# set firewall ipv4 name iot-guest description 'From IOT to GUEST'
# set firewall ipv4 name iot-guest default-action 'drop'
# set firewall ipv4 name iot-guest default-log
set firewall ipv4 name iot-guest rule 420 action 'accept'
set firewall ipv4 name iot-guest rule 420 description 'Rule: accept_udp_from_sonos_players_to_sonos_controllers'
set firewall ipv4 name iot-guest rule 420 destination group address-group 'sonos-controllers'
set firewall ipv4 name iot-guest rule 420 destination port '319,320,30000-65535'
set firewall ipv4 name iot-guest rule 420 protocol 'udp'
set firewall ipv4 name iot-guest rule 420 source group address-group 'sonos-players'
set firewall ipv4 name iot-guest rule 421 action 'accept'
set firewall ipv4 name iot-guest rule 421 description 'Rule: accept_tcp_from_sonos_players_to_sonos_controllers'
set firewall ipv4 name iot-guest rule 421 destination group address-group 'sonos-controllers'
set firewall ipv4 name iot-guest rule 421 destination port '1400,3400,3401,3500,30000-65535'
set firewall ipv4 name iot-guest rule 421 protocol 'tcp'
set firewall ipv4 name iot-guest rule 421 source group address-group 'sonos-players'

# From IOT to HOMELAB
# set firewall ipv4 name iot-homelab description 'From IOT to HOMELAB'
# set firewall ipv4 name iot-homelab default-action 'drop'
# set firewall ipv4 name iot-homelab default-log
set firewall ipv4 name iot-homelab rule 370 action 'accept'
set firewall ipv4 name iot-homelab rule 370 description 'Rule: accept plex users'
set firewall ipv4 name iot-homelab rule 370 destination group address-group 'plex-server'
set firewall ipv4 name iot-homelab rule 370 destination port '32400'
set firewall ipv4 name iot-homelab rule 370 protocol 'tcp'
set firewall ipv4 name iot-homelab rule 370 source group address-group 'plex-users'
set firewall ipv4 name iot-homelab rule 420 action 'accept'
set firewall ipv4 name iot-homelab rule 420 description 'Rule: accept_udp_from_sonos_players_to_sonos_controllers'
set firewall ipv4 name iot-homelab rule 420 destination group address-group 'sonos-controllers'
set firewall ipv4 name iot-homelab rule 420 destination port '319,320,30000-65535'
set firewall ipv4 name iot-homelab rule 420 protocol 'udp'
set firewall ipv4 name iot-homelab rule 420 source group address-group 'sonos-players'
set firewall ipv4 name iot-homelab rule 421 action 'accept'
set firewall ipv4 name iot-homelab rule 421 description 'Rule: accept_tcp_from_sonos_players_to_sonos_controllers'
set firewall ipv4 name iot-homelab rule 421 destination group address-group 'sonos-controllers'
set firewall ipv4 name iot-homelab rule 421 destination port '1400,3400,3401,3500,30000-65535'
set firewall ipv4 name iot-homelab rule 421 protocol 'tcp'
set firewall ipv4 name iot-homelab rule 421 source group address-group 'sonos-players'
set firewall ipv4 name iot-homelab rule 460 action 'accept'
set firewall ipv4 name iot-homelab rule 460 description 'Rule: accept_music_library_sonos_players'
set firewall ipv4 name iot-homelab rule 460 destination group address-group 'sonos-library'
set firewall ipv4 name iot-homelab rule 460 destination port '4534,http,https'
set firewall ipv4 name iot-homelab rule 460 protocol 'tcp'
set firewall ipv4 name iot-homelab rule 460 source group address-group 'sonos-players'

# From IOT to LAN
# set firewall ipv4 name iot-lan description 'From IOT to LAN'
# set firewall ipv4 name iot-lan default-action 'drop'
# set firewall ipv4 name iot-lan default-log

# From IOT to LOCAL
# set firewall ipv4 name iot-local description 'From IOT to LOCAL'
# set firewall ipv4 name iot-local default-action 'drop'
# set firewall ipv4 name iot-local default-log
set firewall ipv4 name iot-local rule 100 action 'accept'
set firewall ipv4 name iot-local rule 100 description 'Rule: accept ntp'
set firewall ipv4 name iot-local rule 100 destination port 'ntp'
set firewall ipv4 name iot-local rule 100 protocol 'udp'
set firewall ipv4 name iot-local rule 110 action 'accept'
set firewall ipv4 name iot-local rule 110 description 'Rule: accept dhcp'
set firewall ipv4 name iot-local rule 110 destination port 'bootps,bootpc'
set firewall ipv4 name iot-local rule 110 protocol 'udp'
set firewall ipv4 name iot-local rule 110 source port 'bootps,bootpc'
set firewall ipv4 name iot-local rule 120 action 'accept'
set firewall ipv4 name iot-local rule 120 description 'Rule: accept igmp'
set firewall ipv4 name iot-local rule 120 protocol '2'
set firewall ipv4 name iot-local rule 130 action 'accept'
set firewall ipv4 name iot-local rule 130 description 'Rule: accept mdns'
set firewall ipv4 name iot-local rule 130 destination port 'mdns'
set firewall ipv4 name iot-local rule 130 protocol 'udp'
set firewall ipv4 name iot-local rule 130 source port 'mdns'
set firewall ipv4 name iot-local rule 440 action 'accept'
set firewall ipv4 name iot-local rule 440 description 'Rule: accept_discovery_from_sonos_players'
set firewall ipv4 name iot-local rule 440 destination port '1900,1901,1902'
set firewall ipv4 name iot-local rule 440 protocol 'udp'
set firewall ipv4 name iot-local rule 440 source group address-group 'sonos-players'

# From IOT to SERVERS
# set firewall ipv4 name iot-servers description 'From IOT to SERVERS'
# set firewall ipv4 name iot-servers default-action 'drop'
# set firewall ipv4 name iot-servers default-log

# From IOT to SERVICES
# set firewall ipv4 name iot-services description 'From IOT to SERVICES'
# set firewall ipv4 name iot-services default-action 'drop'
# set firewall ipv4 name iot-services default-log

# From IOT to STAGING
# set firewall ipv4 name iot-staging description 'From IOT to STAGING'
# set firewall ipv4 name iot-staging default-action 'drop'
# set firewall ipv4 name iot-staging default-log

# From IOT to TRUSTED
# set firewall ipv4 name iot-trusted description 'From IOT to TRUSTED'
# set firewall ipv4 name iot-trusted default-action 'drop'
# set firewall ipv4 name iot-trusted default-log
set firewall ipv4 name iot-trusted rule 360 action 'accept'
set firewall ipv4 name iot-trusted rule 360 description 'Rule: accept scanner traffic'
set firewall ipv4 name iot-trusted rule 360 destination group address-group 'scanner-clients'
set firewall ipv4 name iot-trusted rule 360 destination group port-group 'scanner-outbound-ports'
set firewall ipv4 name iot-trusted rule 360 protocol 'udp'
set firewall ipv4 name iot-trusted rule 420 action 'accept'
set firewall ipv4 name iot-trusted rule 420 description 'Rule: accept_udp_from_sonos_players_to_sonos_controllers'
set firewall ipv4 name iot-trusted rule 420 destination group address-group 'sonos-controllers'
set firewall ipv4 name iot-trusted rule 420 destination port '319,320,30000-65535'
set firewall ipv4 name iot-trusted rule 420 protocol 'udp'
set firewall ipv4 name iot-trusted rule 420 source group address-group 'sonos-players'
set firewall ipv4 name iot-trusted rule 421 action 'accept'
set firewall ipv4 name iot-trusted rule 421 description 'Rule: accept_tcp_from_sonos_players_to_sonos_controllers'
set firewall ipv4 name iot-trusted rule 421 destination group address-group 'sonos-controllers'
set firewall ipv4 name iot-trusted rule 421 destination port '1400,3400,3401,3500,30000-65535'
set firewall ipv4 name iot-trusted rule 421 protocol 'tcp'
set firewall ipv4 name iot-trusted rule 421 source group address-group 'sonos-players'

# From IOT to WAN
# set firewall ipv4 name iot-wan description 'From IOT to WAN'
# set firewall ipv4 name iot-wan default-action 'accept'

# From LAN to GUEST
# set firewall ipv4 name lan-guest description 'From LAN to GUEST'
# set firewall ipv4 name lan-guest default-action 'drop'
# set firewall ipv4 name lan-guest default-log

# From LAN to HOMELAB
# set firewall ipv4 name lan-homelab description 'From LAN to HOMELAB'
# set firewall ipv4 name lan-homelab default-action 'drop'
# set firewall ipv4 name lan-homelab default-log

# From LAN to IOT
# set firewall ipv4 name lan-iot description 'From LAN to IOT'
# set firewall ipv4 name lan-iot default-action 'drop'
# set firewall ipv4 name lan-iot default-log

# From LAN to LOCAL
# set firewall ipv4 name lan-local description 'From LAN to LOCAL'
# set firewall ipv4 name lan-local default-action 'drop'
# set firewall ipv4 name lan-local default-log
set firewall ipv4 name lan-local rule 100 action 'accept'
set firewall ipv4 name lan-local rule 100 description 'Rule: accept ntp'
set firewall ipv4 name lan-local rule 100 destination port 'ntp'
set firewall ipv4 name lan-local rule 100 protocol 'udp'
set firewall ipv4 name lan-local rule 110 action 'accept'
set firewall ipv4 name lan-local rule 110 description 'Rule: accept dhcp'
set firewall ipv4 name lan-local rule 110 destination port 'bootps,bootpc'
set firewall ipv4 name lan-local rule 110 protocol 'udp'
set firewall ipv4 name lan-local rule 110 source port 'bootps,bootpc'
set firewall ipv4 name lan-local rule 160 action 'accept'
set firewall ipv4 name lan-local rule 160 description 'Rule: accept ssh'
set firewall ipv4 name lan-local rule 160 destination port 'ssh'
set firewall ipv4 name lan-local rule 160 protocol 'tcp'
set firewall ipv4 name lan-local rule 900 action 'drop'
set firewall ipv4 name lan-local rule 900 description 'Rule: drop 10001 (no log)'
set firewall ipv4 name lan-local rule 900 destination port '10001'
set firewall ipv4 name lan-local rule 900 protocol 'udp'
set firewall ipv4 name lan-local rule 910 action 'drop'
set firewall ipv4 name lan-local rule 910 description 'Rule: drop multicast to 224.0.0.1 (no log)'
set firewall ipv4 name lan-local rule 910 destination address '224.0.0.1'
set firewall ipv4 name lan-local rule 910 protocol '2'

# From LAN to SERVERS
# set firewall ipv4 name lan-servers description 'From LAN to SERVERS'
# set firewall ipv4 name lan-servers default-action 'drop'
# set firewall ipv4 name lan-servers default-log

# From LAN to SERVICES
# set firewall ipv4 name lan-services description 'From LAN to SERVICES'
# set firewall ipv4 name lan-services default-action 'accept'
# set firewall ipv4 name lan-services default-log
set firewall ipv4 name lan-services rule 170 action 'accept'
set firewall ipv4 name lan-services rule 170 description 'Rule: accept dns'
set firewall ipv4 name lan-services rule 170 destination port 'domain,domain-s'
set firewall ipv4 name lan-services rule 170 protocol 'tcp_udp'
set firewall ipv4 name lan-services rule 300 action 'accept'
set firewall ipv4 name lan-services rule 300 description 'Rule: accept unifi'
set firewall ipv4 name lan-services rule 300 destination group address-group 'unifi-controller'

# From LAN to STAGING
# set firewall ipv4 name lan-staging description 'From LAN to STAGING'
# set firewall ipv4 name lan-staging default-action 'drop'
# set firewall ipv4 name lan-staging default-log

# From LAN to TRUSTED
# set firewall ipv4 name lan-trusted description 'From LAN to TRUSTED'
# set firewall ipv4 name lan-trusted default-action 'drop'
# set firewall ipv4 name lan-trusted default-log
set firewall ipv4 name lan-trusted rule 900 action 'drop'
set firewall ipv4 name lan-trusted rule 900 description 'Rule: drop 10001 (no log)'
set firewall ipv4 name lan-trusted rule 900 destination port '10001'
set firewall ipv4 name lan-trusted rule 900 protocol 'udp'

# From LAN to WAN
# set firewall ipv4 name lan-wan description 'From LAN to WAN'
# set firewall ipv4 name lan-wan default-action 'accept'

# From LOCAL to GUEST
# set firewall ipv4 name local-guest description 'From LOCAL to GUEST'
# set firewall ipv4 name local-guest default-action 'drop'
# set firewall ipv4 name local-guest default-log
set firewall ipv4 name local-guest rule 120 action 'accept'
set firewall ipv4 name local-guest rule 120 description 'Rule: accept igmp'
set firewall ipv4 name local-guest rule 120 protocol '2'
set firewall ipv4 name local-guest rule 130 action 'accept'
set firewall ipv4 name local-guest rule 130 description 'Rule: accept mdns'
set firewall ipv4 name local-guest rule 130 destination port 'mdns'
set firewall ipv4 name local-guest rule 130 protocol 'udp'
set firewall ipv4 name local-guest rule 130 source port 'mdns'
set firewall ipv4 name local-guest rule 410 action 'accept'
set firewall ipv4 name local-guest rule 410 description 'Rule: accept_discovery_from_sonos_players'
set firewall ipv4 name local-guest rule 410 destination port '1900,1901,1902'
set firewall ipv4 name local-guest rule 410 protocol 'udp'
set firewall ipv4 name local-guest rule 410 source group address-group 'sonos-players'

# From LOCAL to HOMELAB
# set firewall ipv4 name local-homelab description 'From LOCAL to HOMELAB'
# set firewall ipv4 name local-homelab default-action 'drop'
# set firewall ipv4 name local-homelab default-log
set firewall ipv4 name local-homelab rule 140 action 'accept'
set firewall ipv4 name local-homelab rule 140 description 'Rule: accept icmp'
set firewall ipv4 name local-homelab rule 140 protocol 'icmp'
set firewall ipv4 name local-homelab rule 150 action 'accept'
set firewall ipv4 name local-homelab rule 150 description 'Rule: accept bgp'
set firewall ipv4 name local-homelab rule 150 destination port 'bgp'
set firewall ipv4 name local-homelab rule 150 protocol 'tcp'
set firewall ipv4 name local-homelab rule 310 action 'accept'
set firewall ipv4 name local-homelab rule 310 description 'Rule: accept vector syslog'
set firewall ipv4 name local-homelab rule 310 destination port '6003'
set firewall ipv4 name local-homelab rule 310 protocol 'tcp'
set firewall ipv4 name local-homelab rule 410 action 'accept'
set firewall ipv4 name local-homelab rule 410 description 'Rule: accept_discovery_from_sonos_players'
set firewall ipv4 name local-homelab rule 410 destination port '1900,1901,1902'
set firewall ipv4 name local-homelab rule 410 protocol 'udp'
set firewall ipv4 name local-homelab rule 410 source group address-group 'sonos-players'

# From LOCAL to IOT
# set firewall ipv4 name local-iot description 'From LOCAL to IOT'
# set firewall ipv4 name local-iot default-action 'drop'
# set firewall ipv4 name local-iot default-log
set firewall ipv4 name local-iot rule 120 action 'accept'
set firewall ipv4 name local-iot rule 120 description 'Rule: accept igmp'
set firewall ipv4 name local-iot rule 120 protocol '2'
set firewall ipv4 name local-iot rule 130 action 'accept'
set firewall ipv4 name local-iot rule 130 description 'Rule: accept mdns'
set firewall ipv4 name local-iot rule 130 destination port 'mdns'
set firewall ipv4 name local-iot rule 130 protocol 'udp'
set firewall ipv4 name local-iot rule 130 source port 'mdns'
set firewall ipv4 name local-iot rule 140 action 'accept'
set firewall ipv4 name local-iot rule 140 description 'Rule: accept icmp'
set firewall ipv4 name local-iot rule 140 protocol 'icmp'
set firewall ipv4 name local-iot rule 400 action 'accept'
set firewall ipv4 name local-iot rule 400 description 'Rule: accept_discovery_from_sonos_controllers'
set firewall ipv4 name local-iot rule 400 destination port '1900,1901,1902,57621'
set firewall ipv4 name local-iot rule 400 protocol 'udp'
set firewall ipv4 name local-iot rule 400 source group address-group 'sonos-controllers'

# From LOCAL to LAN
# set firewall ipv4 name local-lan description 'From LOCAL to LAN'
# set firewall ipv4 name local-lan default-action 'drop'
# set firewall ipv4 name local-lan default-log
set firewall ipv4 name local-lan rule 140 action 'accept'
set firewall ipv4 name local-lan rule 140 description 'Rule: accept icmp'
set firewall ipv4 name local-lan rule 140 protocol 'icmp'
set firewall ipv4 name local-lan rule 160 action 'accept'
set firewall ipv4 name local-lan rule 160 description 'Rule: accept ssh'
set firewall ipv4 name local-lan rule 160 destination port 'ssh'
set firewall ipv4 name local-lan rule 160 protocol 'tcp'

# From LOCAL to SERVERS
# set firewall ipv4 name local-servers description 'From LOCAL to SERVERS'
# set firewall ipv4 name local-servers default-action 'drop'
# set firewall ipv4 name local-servers default-log
set firewall ipv4 name local-servers rule 140 action 'accept'
set firewall ipv4 name local-servers rule 140 description 'Rule: accept icmp'
set firewall ipv4 name local-servers rule 140 protocol 'icmp'
set firewall ipv4 name local-servers rule 150 action 'accept'
set firewall ipv4 name local-servers rule 150 description 'Rule: accept bgp'
set firewall ipv4 name local-servers rule 150 destination port 'bgp'
set firewall ipv4 name local-servers rule 150 protocol 'tcp'

# From LOCAL to SERVICES
# set firewall ipv4 name local-services description 'From LOCAL to SERVICES'
# set firewall ipv4 name local-services default-action 'accept'

# From LOCAL to STAGING
# set firewall ipv4 name local-staging description 'From LOCAL to STAGING'
# set firewall ipv4 name local-staging default-action 'drop'
# set firewall ipv4 name local-staging default-log
set firewall ipv4 name local-staging rule 140 action 'accept'
set firewall ipv4 name local-staging rule 140 description 'Rule: accept icmp'
set firewall ipv4 name local-staging rule 140 protocol 'icmp'
set firewall ipv4 name local-staging rule 150 action 'accept'
set firewall ipv4 name local-staging rule 150 description 'Rule: accept bgp'
set firewall ipv4 name local-staging rule 150 destination port 'bgp'
set firewall ipv4 name local-staging rule 150 protocol 'tcp'

# From LOCAL to TRUSTED
# set firewall ipv4 name local-trusted description 'From LOCAL to TRUSTED'
# set firewall ipv4 name local-trusted default-action 'drop'
# set firewall ipv4 name local-trusted default-log
set firewall ipv4 name local-trusted rule 120 action 'accept'
set firewall ipv4 name local-trusted rule 120 description 'Rule: accept igmp'
set firewall ipv4 name local-trusted rule 120 protocol '2'
set firewall ipv4 name local-trusted rule 130 action 'accept'
set firewall ipv4 name local-trusted rule 130 description 'Rule: accept mdns'
set firewall ipv4 name local-trusted rule 130 destination port 'mdns'
set firewall ipv4 name local-trusted rule 130 protocol 'udp'
set firewall ipv4 name local-trusted rule 130 source port 'mdns'
set firewall ipv4 name local-trusted rule 140 action 'accept'
set firewall ipv4 name local-trusted rule 140 description 'Rule: accept icmp'
set firewall ipv4 name local-trusted rule 140 protocol 'icmp'
set firewall ipv4 name local-trusted rule 180 action 'accept'
set firewall ipv4 name local-trusted rule 180 description 'Rule: accept wireguard'
set firewall ipv4 name local-trusted rule 180 destination port '51820'
set firewall ipv4 name local-trusted rule 180 protocol 'udp'
set firewall ipv4 name local-trusted rule 410 action 'accept'
set firewall ipv4 name local-trusted rule 410 description 'Rule: accept_discovery_from_sonos_players'
set firewall ipv4 name local-trusted rule 410 destination port '1900,1901,1902'
set firewall ipv4 name local-trusted rule 410 protocol 'udp'
set firewall ipv4 name local-trusted rule 410 source group address-group 'sonos-players'

# From LOCAL to WAN
# set firewall ipv4 name local-wan description 'From LOCAL to WAN'
# set firewall ipv4 name local-wan default-action 'accept'

# From SERVERS to GUEST
# set firewall ipv4 name servers-guest description 'From SERVERS to GUEST'
# set firewall ipv4 name servers-guest default-action 'drop'
# set firewall ipv4 name servers-guest default-log

# From SERVERS to HOMELAB
# set firewall ipv4 name servers-homelab description 'From SERVERS to HOMELAB'
# set firewall ipv4 name servers-homelab default-action 'accept'

# From SERVERS to IOT
# set firewall ipv4 name servers-iot description 'From SERVERS to IOT'
# set firewall ipv4 name servers-iot default-action 'accept'

# From SERVERS to LAN
# set firewall ipv4 name servers-lan description 'From SERVERS to LAN'
# set firewall ipv4 name servers-lan default-action 'drop'
# set firewall ipv4 name servers-lan default-log
set firewall ipv4 name servers-lan rule 140 action 'accept'
set firewall ipv4 name servers-lan rule 140 description 'Rule: accept icmp'
set firewall ipv4 name servers-lan rule 140 protocol 'icmp'
set firewall ipv4 name servers-lan rule 500 action 'accept'
set firewall ipv4 name servers-lan rule 500 description 'Rule: accept rtsp'
set firewall ipv4 name servers-lan rule 500 destination group address-group 'unifi-unvr'

# From SERVERS to LOCAL
# set firewall ipv4 name servers-local description 'From SERVERS to LOCAL'
# set firewall ipv4 name servers-local default-action 'drop'
# set firewall ipv4 name servers-local default-log
set firewall ipv4 name servers-local rule 100 action 'accept'
set firewall ipv4 name servers-local rule 100 description 'Rule: accept ntp'
set firewall ipv4 name servers-local rule 100 destination port 'ntp'
set firewall ipv4 name servers-local rule 100 protocol 'udp'
set firewall ipv4 name servers-local rule 110 action 'accept'
set firewall ipv4 name servers-local rule 110 description 'Rule: accept dhcp'
set firewall ipv4 name servers-local rule 110 destination port 'bootps,bootpc'
set firewall ipv4 name servers-local rule 110 protocol 'udp'
set firewall ipv4 name servers-local rule 110 source port 'bootps,bootpc'
set firewall ipv4 name servers-local rule 140 action 'accept'
set firewall ipv4 name servers-local rule 140 description 'Rule: accept icmp'
set firewall ipv4 name servers-local rule 140 protocol 'icmp'
set firewall ipv4 name servers-local rule 150 action 'accept'
set firewall ipv4 name servers-local rule 150 description 'Rule: accept bgp'
set firewall ipv4 name servers-local rule 150 destination port 'bgp'
set firewall ipv4 name servers-local rule 150 protocol 'tcp'
set firewall ipv4 name servers-local rule 160 action 'accept'
set firewall ipv4 name servers-local rule 160 description 'Rule: accept ssh'
set firewall ipv4 name servers-local rule 160 destination port 'ssh'
set firewall ipv4 name servers-local rule 160 protocol 'tcp'
set firewall ipv4 name servers-local rule 330 action 'accept'
set firewall ipv4 name servers-local rule 330 description 'Rule: accept iperf'
set firewall ipv4 name servers-local rule 330 destination port '5001'
set firewall ipv4 name servers-local rule 330 protocol 'tcp'
set firewall ipv4 name servers-local rule 910 action 'drop'
set firewall ipv4 name servers-local rule 910 description 'Rule: drop multicast to 224.0.0.1 (no log)'
set firewall ipv4 name servers-local rule 910 destination address '224.0.0.1'
set firewall ipv4 name servers-local rule 910 protocol '2'

# From SERVERS to SERVICES
# set firewall ipv4 name servers-services description 'From SERVERS to SERVICES'
# set firewall ipv4 name servers-services default-action 'accept'

# From SERVERS to STAGING
# set firewall ipv4 name servers-staging description 'From SERVERS to STAGING'
# set firewall ipv4 name servers-staging default-action 'accept'

# From SERVERS to TRUSTED
# set firewall ipv4 name servers-trusted description 'From SERVERS to TRUSTED'
# set firewall ipv4 name servers-trusted default-action 'drop'
set firewall ipv4 name servers-trusted rule 140 action 'accept'
set firewall ipv4 name servers-trusted rule 140 description 'Rule: accept icmp'
set firewall ipv4 name servers-trusted rule 140 protocol 'icmp'
set firewall ipv4 name servers-trusted rule 160 action 'accept'
set firewall ipv4 name servers-trusted rule 160 description 'Rule: accept ssh'
set firewall ipv4 name servers-trusted rule 160 destination port 'ssh'
set firewall ipv4 name servers-trusted rule 160 protocol 'tcp'

# From SERVERS to WAN
# set firewall ipv4 name servers-wan description 'From SERVERS to WAN'
# set firewall ipv4 name servers-wan default-action 'accept'

# From SERVICES to GUEST
# set firewall ipv4 name services-guest description 'From SERVICES to GUEST'
# set firewall ipv4 name services-guest default-action 'drop'
# set firewall ipv4 name services-guest default-log

# From SERVICES to HOMELAB
# set firewall ipv4 name services-homelab description 'From SERVICES to HOMELAB'
# set firewall ipv4 name services-homelab default-action 'accept'

# From SERVICES to IOT
# set firewall ipv4 name services-iot description 'From SERVICES to IOT'
# set firewall ipv4 name services-iot default-action 'drop'
# set firewall ipv4 name services-iot default-log
set firewall ipv4 name services-iot rule 140 action 'accept'
set firewall ipv4 name services-iot rule 140 description 'Rule: accept icmp'
set firewall ipv4 name services-iot rule 140 protocol 'icmp'

# From SERVICES to LAN
# set firewall ipv4 name services-lan description 'From SERVICES to LAN'
# set firewall ipv4 name services-lan default-action 'accept'
# set firewall ipv4 name services-lan default-log
set firewall ipv4 name services-lan rule 140 action 'accept'
set firewall ipv4 name services-lan rule 140 description 'Rule: accept icmp'
set firewall ipv4 name services-lan rule 140 protocol 'icmp'

# From SERVICES to LOCAL
# set firewall ipv4 name services-local description 'From SERVICES to LOCAL'
# set firewall ipv4 name services-local default-action 'accept'
# set firewall ipv4 name services-local default-log
set firewall ipv4 name services-local rule 100 action 'accept'
set firewall ipv4 name services-local rule 100 description 'Rule: accept ntp'
set firewall ipv4 name services-local rule 100 destination port 'ntp'
set firewall ipv4 name services-local rule 100 protocol 'udp'
set firewall ipv4 name services-local rule 110 action 'accept'
set firewall ipv4 name services-local rule 110 description 'Rule: accept dhcp'
set firewall ipv4 name services-local rule 110 destination port 'bootps,bootpc'
set firewall ipv4 name services-local rule 110 protocol 'udp'
set firewall ipv4 name services-local rule 110 source port 'bootps,bootpc'

# From SERVICES to SERVERS
# set firewall ipv4 name services-servers description 'From SERVICES to SERVERS'
# set firewall ipv4 name services-servers default-action 'accept'

# From SERVICES to STAGING
# set firewall ipv4 name services-staging description 'From SERVICES to STAGING'
# set firewall ipv4 name services-staging default-action 'accept'

# From SERVICES to TRUSTED
# set firewall ipv4 name services-trusted description 'From SERVICES to TRUSTED'
# set firewall ipv4 name services-trusted default-action 'drop'
# set firewall ipv4 name services-trusted default-log

# From SERVICES to WAN
# set firewall ipv4 name services-wan description 'From SERVICES to WAN'
# set firewall ipv4 name services-wan default-action 'accept'

# From STAGING to GUEST
# set firewall ipv4 name staging-guest description 'From STAGING to GUEST'
# set firewall ipv4 name staging-guest default-action 'drop'
# set firewall ipv4 name staging-guest default-log

# From STAGING to HOMELAB
# set firewall ipv4 name staging-homelab description 'From STAGING to HOMELAB'
# set firewall ipv4 name staging-homelab default-action 'accept'

# From STAGING to IOT
# set firewall ipv4 name staging-iot description 'From STAGING to IOT'
# set firewall ipv4 name staging-iot default-action 'accept'

# From STAGING to LAN
# set firewall ipv4 name staging-lan description 'From STAGING to LAN'
# set firewall ipv4 name staging-lan default-action 'drop'
# set firewall ipv4 name staging-lan default-log
set firewall ipv4 name staging-lan rule 140 action 'accept'
set firewall ipv4 name staging-lan rule 140 description 'Rule: accept icmp'
set firewall ipv4 name staging-lan rule 140 protocol 'icmp'

# From STAGING to LOCAL
# set firewall ipv4 name staging-local description 'From STAGING to LOCAL'
# set firewall ipv4 name staging-local default-action 'drop'
# set firewall ipv4 name staging-local default-log
set firewall ipv4 name staging-local rule 100 action 'accept'
set firewall ipv4 name staging-local rule 100 description 'Rule: accept ntp'
set firewall ipv4 name staging-local rule 100 destination port 'ntp'
set firewall ipv4 name staging-local rule 100 protocol 'udp'
set firewall ipv4 name staging-local rule 110 action 'accept'
set firewall ipv4 name staging-local rule 110 description 'Rule: accept dhcp'
set firewall ipv4 name staging-local rule 110 destination port 'bootps,bootpc'
set firewall ipv4 name staging-local rule 110 protocol 'udp'
set firewall ipv4 name staging-local rule 110 source port 'bootps,bootpc'
set firewall ipv4 name staging-local rule 140 action 'accept'
set firewall ipv4 name staging-local rule 140 description 'Rule: accept icmp'
set firewall ipv4 name staging-local rule 140 protocol 'icmp'
set firewall ipv4 name staging-local rule 150 action 'accept'
set firewall ipv4 name staging-local rule 150 description 'Rule: accept bgp'
set firewall ipv4 name staging-local rule 150 destination port 'bgp'
set firewall ipv4 name staging-local rule 150 protocol 'tcp'
set firewall ipv4 name staging-local rule 350 action 'accept'
set firewall ipv4 name staging-local rule 350 description 'Rule: accept prometheus metrics scrape'
set firewall ipv4 name staging-local rule 350 destination group port-group 'prometheus-metrics'
set firewall ipv4 name staging-local rule 350 protocol 'tcp'
set firewall ipv4 name staging-local rule 910 action 'drop'
set firewall ipv4 name staging-local rule 910 description 'Rule: drop multicast to 224.0.0.1 (no log)'
set firewall ipv4 name staging-local rule 910 destination address '224.0.0.1'
set firewall ipv4 name staging-local rule 910 protocol '2'

# From STAGING to SERVERS
# set firewall ipv4 name staging-servers description 'From STAGING to SERVERS'
# set firewall ipv4 name staging-servers default-action 'accept'

# From STAGING to SERVICES
# set firewall ipv4 name staging-services description 'From STAGING to SERVICES'
# set firewall ipv4 name staging-services default-action 'accept'

# From STAGING to TRUSTED
# set firewall ipv4 name staging-trusted description 'From STAGING to TRUSTED'
# set firewall ipv4 name staging-trusted default-action 'drop'
set firewall ipv4 name staging-trusted rule 140 action 'accept'
set firewall ipv4 name staging-trusted rule 140 description 'Rule: accept icmp'
set firewall ipv4 name staging-trusted rule 140 protocol 'icmp'

# From STAGING to WAN
# set firewall ipv4 name staging-wan description 'From STAGING to WAN'
# set firewall ipv4 name staging-wan default-action 'accept'

# From TRUSTED to GUEST
# set firewall ipv4 name trusted-guest description 'From TRUSTED to GUEST'
# set firewall ipv4 name trusted-guest default-action 'drop'
# set firewall ipv4 name trusted-guest default-log

# From TRUSTED to HOMELAB
# set firewall ipv4 name trusted-homelab description 'From TRUSTED to HOMELAB'
# set firewall ipv4 name trusted-homelab default-action 'drop'
# set firewall ipv4 name trusted-homelab default-log
set firewall ipv4 name trusted-homelab rule 520 action 'accept'
set firewall ipv4 name trusted-homelab rule 520 description 'Rule: accept scotte'
set firewall ipv4 name trusted-homelab rule 520 source group address-group 'scotte-devices'
set firewall ipv4 name trusted-homelab rule 530 action 'accept'
set firewall ipv4 name trusted-homelab rule 530 description 'Rule: accept sophie'
set firewall ipv4 name trusted-homelab rule 530 source group address-group 'sophie-devices'

# From TRUSTED to IOT
# set firewall ipv4 name trusted-iot description 'From TRUSTED to IOT'
# set firewall ipv4 name trusted-iot default-action 'accept'
set firewall ipv4 name trusted-iot rule 430 action 'accept'
set firewall ipv4 name trusted-iot rule 430 description 'Rule: accept_tcp_from_sonos_controllers_to_sonos_players'
set firewall ipv4 name trusted-iot rule 430 destination group address-group 'sonos-players'
set firewall ipv4 name trusted-iot rule 430 destination port '1400,1443,4444,7000,30000-65535'
set firewall ipv4 name trusted-iot rule 430 protocol 'tcp'
set firewall ipv4 name trusted-iot rule 430 source group address-group 'sonos-controllers'
set firewall ipv4 name trusted-iot rule 431 action 'accept'
set firewall ipv4 name trusted-iot rule 431 description 'Rule: accept_udp_from_sonos_controllers_to_sonos_players'
set firewall ipv4 name trusted-iot rule 431 destination group address-group 'sonos-players'
set firewall ipv4 name trusted-iot rule 431 destination port '319,320,30000-65535'
set firewall ipv4 name trusted-iot rule 431 protocol 'udp'
set firewall ipv4 name trusted-iot rule 431 source group address-group 'sonos-controllers'

# From TRUSTED to LAN
# set firewall ipv4 name trusted-lan description 'From TRUSTED to LAN'
# set firewall ipv4 name trusted-lan default-action 'drop'
# set firewall ipv4 name trusted-lan default-log
set firewall ipv4 name trusted-lan rule 520 action 'accept'
set firewall ipv4 name trusted-lan rule 520 description 'Rule: accept scotte'
set firewall ipv4 name trusted-lan rule 520 source group address-group 'scotte-devices'
set firewall ipv4 name trusted-lan rule 540 action 'accept'
set firewall ipv4 name trusted-lan rule 540 description 'Rule: accept cameras'
set firewall ipv4 name trusted-lan rule 540 source group address-group 'unifi-cameras'

# From TRUSTED to LOCAL
# set firewall ipv4 name trusted-local description 'From TRUSTED to LOCAL'
# set firewall ipv4 name trusted-local default-action 'drop'
# set firewall ipv4 name trusted-local default-log
set firewall ipv4 name trusted-local rule 100 action 'accept'
set firewall ipv4 name trusted-local rule 100 description 'Rule: accept ntp'
set firewall ipv4 name trusted-local rule 100 destination port 'ntp'
set firewall ipv4 name trusted-local rule 100 protocol 'udp'
set firewall ipv4 name trusted-local rule 110 action 'accept'
set firewall ipv4 name trusted-local rule 110 description 'Rule: accept dhcp'
set firewall ipv4 name trusted-local rule 110 destination port 'bootps,bootpc'
set firewall ipv4 name trusted-local rule 110 protocol 'udp'
set firewall ipv4 name trusted-local rule 110 source port 'bootps,bootpc'
set firewall ipv4 name trusted-local rule 120 action 'accept'
set firewall ipv4 name trusted-local rule 120 description 'Rule: accept igmp'
set firewall ipv4 name trusted-local rule 120 protocol '2'
set firewall ipv4 name trusted-local rule 130 action 'accept'
set firewall ipv4 name trusted-local rule 130 description 'Rule: accept mdns'
set firewall ipv4 name trusted-local rule 130 destination port 'mdns'
set firewall ipv4 name trusted-local rule 130 protocol 'udp'
set firewall ipv4 name trusted-local rule 130 source port 'mdns'
set firewall ipv4 name trusted-local rule 140 action 'accept'
set firewall ipv4 name trusted-local rule 140 description 'Rule: accept icmp'
set firewall ipv4 name trusted-local rule 140 protocol 'icmp'
set firewall ipv4 name trusted-local rule 160 action 'accept'
set firewall ipv4 name trusted-local rule 160 description 'Rule: accept ssh'
set firewall ipv4 name trusted-local rule 160 destination port 'ssh'
set firewall ipv4 name trusted-local rule 160 protocol 'tcp'
set firewall ipv4 name trusted-local rule 320 action 'accept'
set firewall ipv4 name trusted-local rule 320 description 'Rule: accept vnstat'
set firewall ipv4 name trusted-local rule 320 destination port '8685'
set firewall ipv4 name trusted-local rule 320 protocol 'tcp'
set firewall ipv4 name trusted-local rule 330 action 'accept'
set firewall ipv4 name trusted-local rule 330 description 'Rule: accept iperf'
set firewall ipv4 name trusted-local rule 330 destination port '5001'
set firewall ipv4 name trusted-local rule 330 protocol 'tcp'
set firewall ipv4 name trusted-local rule 340 action 'drop'
set firewall ipv4 name trusted-local rule 340 description 'Rule: ignore scansnap probe'
set firewall ipv4 name trusted-local rule 340 destination address '255.255.255.255'
set firewall ipv4 name trusted-local rule 340 destination port '52217'
set firewall ipv4 name trusted-local rule 340 protocol 'udp'
set firewall ipv4 name trusted-local rule 340 source group address-group 'scanner-clients'
set firewall ipv4 name trusted-local rule 450 action 'accept'
set firewall ipv4 name trusted-local rule 450 description 'Rule: accept_discovery_from_sonos_controllers'
set firewall ipv4 name trusted-local rule 450 destination port '1900,1901,1902,57621'
set firewall ipv4 name trusted-local rule 450 protocol 'udp'
set firewall ipv4 name trusted-local rule 450 source group address-group 'sonos-controllers'

# From TRUSTED to SERVERS
# set firewall ipv4 name trusted-servers description 'From TRUSTED to SERVERS'
# set firewall ipv4 name trusted-servers default-action 'drop'
# set firewall ipv4 name trusted-servers default-log
set firewall ipv4 name trusted-servers rule 520 action 'accept'
set firewall ipv4 name trusted-servers rule 520 description 'Rule: accept scotte'
set firewall ipv4 name trusted-servers rule 520 source group address-group 'scotte-devices'
set firewall ipv4 name trusted-servers rule 530 action 'accept'
set firewall ipv4 name trusted-servers rule 530 description 'Rule: accept sophie'
set firewall ipv4 name trusted-servers rule 530 source group address-group 'sophie-devices'

# From TRUSTED to SERVICES
# set firewall ipv4 name trusted-services description 'From TRUSTED to SERVICES'
# set firewall ipv4 name trusted-services default-action 'accept'

# From TRUSTED to STAGING
# set firewall ipv4 name trusted-staging description 'From TRUSTED to STAGING'
# set firewall ipv4 name trusted-staging default-action 'drop'
# set firewall ipv4 name trusted-staging default-log
set firewall ipv4 name trusted-staging rule 520 action 'accept'
set firewall ipv4 name trusted-staging rule 520 description 'Rule: accept scotte'
set firewall ipv4 name trusted-staging rule 520 source group address-group 'scotte-devices'

# From TRUSTED to WAN
# set firewall ipv4 name trusted-wan description 'From TRUSTED to WAN'
# set firewall ipv4 name trusted-wan default-action 'accept'

# From WAN to GUEST
# set firewall ipv4 name wan-guest description 'From WAN to GUEST'
# set firewall ipv4 name wan-guest default-action 'drop'
# set firewall ipv4 name wan-guest default-log

# From WAN to HOMELAB
# set firewall ipv4 name wan-homelab description 'From WAN to HOMELAB'
# set firewall ipv4 name wan-homelab default-action 'drop'
# set firewall ipv4 name wan-homelab default-log

# From WAN to IOT
# set firewall ipv4 name wan-iot description 'From WAN to IOT'
# set firewall ipv4 name wan-iot default-action 'drop'
# set firewall ipv4 name wan-iot default-log

# From WAN to LAN
# set firewall ipv4 name wan-lan description 'From WAN to LAN'
# set firewall ipv4 name wan-lan default-action 'drop'
# set firewall ipv4 name wan-lan default-log

# From WAN to LOCAL
# set firewall ipv4 name wan-local description 'From WAN to LOCAL'
# set firewall ipv4 name wan-local default-action 'drop'
# set firewall ipv4 name wan-local default-log
set firewall ipv4 name wan-local rule 180 action 'accept'
set firewall ipv4 name wan-local rule 180 description 'Rule: accept wireguard'
set firewall ipv4 name wan-local rule 180 destination port '51820'
set firewall ipv4 name wan-local rule 180 protocol 'udp'

# From WAN to SERVERS
# set firewall ipv4 name wan-servers description 'From WAN to SERVERS'
# set firewall ipv4 name wan-servers default-action 'drop'
# set firewall ipv4 name wan-servers default-log

# From WAN to SERVICES
# set firewall ipv4 name wan-services description 'From WAN to SERVICES'
# set firewall ipv4 name wan-services default-action 'drop'
# set firewall ipv4 name wan-services default-log

# From WAN to STAGING
# set firewall ipv4 name wan-staging description 'From WAN to STAGING'
# set firewall ipv4 name wan-staging default-action 'drop'
# set firewall ipv4 name wan-staging default-log

# From WAN to TRUSTED
# set firewall ipv4 name wan-trusted description 'From WAN to TRUSTED'
# set firewall ipv4 name wan-trusted default-action 'drop'
# set firewall ipv4 name wan-trusted default-log
