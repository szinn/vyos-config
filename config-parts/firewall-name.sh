#!/bin/vbash

# From LAN to LOCAL
set firewall name lan-local description 'From LAN to LOCAL'
set firewall name lan-local default-action 'drop'
set firewall name lan-local enable-default-log
set firewall name lan-local rule 3 description 'Rule: accept ntp'
set firewall name lan-local rule 3 action 'accept'
set firewall name lan-local rule 3 destination port 'ntp'
set firewall name lan-local rule 3 protocol 'udp'
set firewall name lan-local rule 4 description 'Rule: accept dhcp'
set firewall name lan-local rule 4 action 'accept'
set firewall name lan-local rule 4 destination port 'bootps,bootpc'
set firewall name lan-local rule 4 protocol 'udp'
set firewall name lan-local rule 4 source port 'bootps,bootpc'
set firewall name lan-local rule 5 description 'Rule: drop 10001 (no log)'
set firewall name lan-local rule 5 action 'drop'
set firewall name lan-local rule 5 destination port '10001'
set firewall name lan-local rule 5 protocol 'udp'
set firewall name lan-local rule 6 description 'Rule: drop multicast to 224.0.0.1 (no log)'
set firewall name lan-local rule 6 action 'drop'
set firewall name lan-local rule 6 destination address '224.0.0.1'
set firewall name lan-local rule 6 protocol '2'

# From LAN to SERVICES
set firewall name lan-services description 'From LAN to SERVICES'
set firewall name lan-services default-action 'accept'
set firewall name lan-services enable-default-log
set firewall name lan-services rule 1 description 'Rule: accept unifi'
set firewall name lan-services rule 1 action 'accept'
set firewall name lan-services rule 1 destination group address-group 'unifi-controller'
set firewall name lan-services rule 2 description 'Rule: accept dns'
set firewall name lan-services rule 2 action 'accept'
set firewall name lan-services rule 2 destination port 'domain,domain-s'
set firewall name lan-services rule 2 protocol 'tcp_udp'

# From LAN to SERVERS
set firewall name lan-servers description 'From LAN to SERVERS'
set firewall name lan-servers default-action 'drop'
set firewall name lan-servers enable-default-log

# From LAN to TRUSTED
set firewall name lan-trusted description 'From LAN to TRUSTED'
set firewall name lan-trusted default-action 'drop'
set firewall name lan-trusted enable-default-log
set firewall name lan-trusted rule 1 description 'Rule: drop 10001 (no log)'
set firewall name lan-trusted rule 1 action 'drop'
set firewall name lan-trusted rule 1 destination port '10001'
set firewall name lan-trusted rule 1 protocol 'udp'

# From LAN to IOT
set firewall name lan-iot description 'From LAN to IOT'
set firewall name lan-iot default-action 'drop'
set firewall name lan-iot enable-default-log

# From LAN to GUEST
set firewall name lan-guest description 'From LAN to GUEST'
set firewall name lan-guest default-action 'drop'
set firewall name lan-guest enable-default-log

# From LAN to WAN
set firewall name lan-wan description 'From LAN to WAN'
set firewall name lan-wan default-action 'accept'

# ---------------------------------

# From LOCAL to LAN
set firewall name local-lan description 'From LOCAL to LAN'
set firewall name local-lan default-action 'drop'
set firewall name local-lan enable-default-log

# From LOCAL to SERVICES
set firewall name local-services default-action 'accept'
set firewall name local-services description 'From LOCAL to SERVICES'
set firewall name local-services enable-default-log

# From LOCAL to SERVERS
set firewall name local-servers description 'From LOCAL to SERVERS'
set firewall name local-servers default-action 'drop'
set firewall name local-servers enable-default-log
set firewall name local-servers rule 1 description 'Rule: accept bgp'
set firewall name local-servers rule 1 action 'accept'
set firewall name local-servers rule 1 destination port 'bgp'
set firewall name local-servers rule 1 protocol 'tcp'
set firewall name local-servers rule 2 description 'Rule: accept vector syslog'
set firewall name local-servers rule 2 action 'accept'
set firewall name local-servers rule 2 destination port '6003'
set firewall name local-servers rule 2 protocol 'tcp'

# From LOCAL to TRUSTED
set firewall name local-trusted description 'From LOCAL to TRUSTED'
set firewall name local-trusted default-action 'drop'
set firewall name local-trusted enable-default-log
set firewall name local-trusted rule 1 action 'accept'
set firewall name local-trusted rule 1 description 'Rule: accept igmp'
set firewall name local-trusted rule 1 protocol '2'
set firewall name local-trusted rule 2 description 'Rule: accept mdns'
set firewall name local-trusted rule 2 action 'accept'
set firewall name local-trusted rule 2 destination port 'mdns'
set firewall name local-trusted rule 2 protocol 'udp'
set firewall name local-trusted rule 2 source port 'mdns'
set firewall name local-trusted rule 3 description 'Rule: accept wireguard'
set firewall name local-trusted rule 3 action 'accept'
set firewall name local-trusted rule 3 destination port '51820'
set firewall name local-trusted rule 3 protocol 'udp'

# From LOCAL to IOT
set firewall name local-iot description 'From LOCAL to IOT'
set firewall name local-iot default-action 'drop'
set firewall name local-iot enable-default-log
set firewall name local-iot rule 1 description 'Rule: accept igmp'
set firewall name local-iot rule 1 action 'accept'
set firewall name local-iot rule 1 protocol '2'
set firewall name local-iot rule 2 description 'Rule: accept mdns'
set firewall name local-iot rule 2 action 'accept'
set firewall name local-iot rule 2 destination port 'mdns'
set firewall name local-iot rule 2 protocol 'udp'
set firewall name local-iot rule 2 source port 'mdns'

# From LOCAL to GUEST
set firewall name local-guest description 'From LOCAL to GUEST'
set firewall name local-guest default-action 'drop'
set firewall name local-guest enable-default-log
set firewall name local-guest rule 1 description 'Rule: accept igmp'
set firewall name local-guest rule 1 action 'accept'
set firewall name local-guest rule 1 protocol '2'
set firewall name local-guest rule 2 description 'Rule: accept mdns'
set firewall name local-guest rule 2 action 'accept'
set firewall name local-guest rule 2 destination port 'mdns'
set firewall name local-guest rule 2 protocol 'udp'
set firewall name local-guest rule 2 source port 'mdns'

# From LOCAL to WAN
set firewall name local-wan description 'From LOCAL to WAN'
set firewall name local-wan default-action 'accept'

# ---------------------------------

# From SERVICES to LAN
set firewall name services-lan description 'From SERVICES to LAN'
set firewall name services-lan default-action 'accept'
set firewall name services-lan enable-default-log
set firewall name services-lan rule 1 description 'Rule: accept icmp'
set firewall name services-lan rule 1 action 'accept'
set firewall name services-lan rule 1 protocol 'icmp'

# From SERVICES to LOCAL
set firewall name services-local description 'From SERVICES to LOCAL'
set firewall name services-local default-action 'drop'
set firewall name services-local enable-default-log
set firewall name services-local rule 1 description 'Rule: accept ntp'
set firewall name services-local rule 1 action 'accept'
set firewall name services-local rule 1 destination port 'ntp'
set firewall name services-local rule 1 protocol 'udp'
set firewall name services-local rule 2 description 'Rule: accept dhcp'
set firewall name services-local rule 2 action 'accept'
set firewall name services-local rule 2 destination port 'bootps,bootpc'
set firewall name services-local rule 2 protocol 'udp'
set firewall name services-local rule 2 source port 'bootps,bootpc'

# From SERVICES to SERVERS
set firewall name services-servers description 'From SERVICES to SERVERS'
set firewall name services-servers default-action 'accept'

# From SERVICES to TRUSTED
set firewall name services-trusted description 'From SERVICES to TRUSTED'
set firewall name services-trusted default-action 'drop'
set firewall name services-trusted enable-default-log

# From SERVICES to IOT
set firewall name services-iot description 'From SERVICES to IOT'
set firewall name services-iot default-action 'drop'
set firewall name services-iot enable-default-log
set firewall name services-iot rule 1 description 'Rule: accept icmp'
set firewall name services-iot rule 1 action 'accept'
set firewall name services-iot rule 1 protocol 'icmp'

# From SERVICES to GUEST
set firewall name services-guest description 'From SERVICES to GUEST'
set firewall name services-guest default-action 'drop'
set firewall name services-guest enable-default-log

# From SERVICES to WAN
set firewall name services-wan description 'From SERVICES to WAN'
set firewall name services-wan default-action 'accept'

# ---------------------------------

# From SERVERS to LAN
set firewall name servers-lan description 'From SERVERS to LAN'
set firewall name servers-lan default-action 'drop'
set firewall name servers-lan enable-default-log
set firewall name servers-lan rule 1 description 'Rule: accept icmp'
set firewall name servers-lan rule 1 action 'accept'
set firewall name servers-lan rule 1 protocol 'icmp'

# From SERVERS to LOCAL
set firewall name servers-local description 'From SERVERS to LOCAL'
set firewall name servers-local default-action 'drop'
set firewall name servers-local enable-default-log
set firewall name servers-local rule 1 description 'Rule: accept bgp'
set firewall name servers-local rule 1 action 'accept'
set firewall name servers-local rule 1 destination port 'bgp'
set firewall name servers-local rule 1 protocol 'tcp'
set firewall name servers-local rule 3 description 'Rule: accept ntp'
set firewall name servers-local rule 3 action 'accept'
set firewall name servers-local rule 3 destination port 'ntp'
set firewall name servers-local rule 3 protocol 'udp'
set firewall name servers-local rule 4 description 'Rule: accept dhcp'
set firewall name servers-local rule 4 action 'accept'
set firewall name servers-local rule 4 destination port 'bootps,bootpc'
set firewall name servers-local rule 4 protocol 'udp'
set firewall name servers-local rule 4 source port 'bootps,bootpc'
set firewall name servers-local rule 5 description 'Rule: accept icmp'
set firewall name servers-local rule 5 action 'accept'
set firewall name servers-local rule 5 protocol 'icmp'
set firewall name servers-local rule 6 description 'Rule: drop multicast to 224.0.0.1 (no log)'
set firewall name servers-local rule 6 action 'drop'
set firewall name servers-local rule 6 destination address '224.0.0.1'
set firewall name servers-local rule 6 protocol '2'
set firewall name servers-local rule 7 description 'Rule: accept ssh'
set firewall name servers-local rule 7 action 'accept'
set firewall name servers-local rule 7 destination port 'ssh'
set firewall name servers-local rule 7 protocol 'tcp'
set firewall name servers-local rule 8 description 'Rule: accept prometheus metrics scrape'
set firewall name servers-local rule 8 action 'accept'
set firewall name servers-local rule 8 destination group port-group prometheus-metrics
set firewall name servers-local rule 8 protocol 'tcp'

# From SERVERS to SERVICES
set firewall name servers-services description 'From SERVERS to SERVICES'
set firewall name servers-services default-action 'accept'

# From SERVERS to TRUSTED
set firewall name servers-trusted description 'From SERVERS to TRUSTED'
set firewall name servers-trusted default-action 'drop'
set firewall name servers-trusted rule 1 description 'Rule: accept icmp'
set firewall name servers-trusted rule 1 action 'accept'
set firewall name servers-trusted rule 1 protocol 'icmp'
set firewall name servers-trusted rule 2 description 'Rule: accept ssh'
set firewall name servers-trusted rule 2 action 'accept'
set firewall name servers-trusted rule 2 destination group address-group 'trusted-ssh'
set firewall name servers-trusted rule 2 destination port 'ssh'
set firewall name servers-trusted rule 2 protocol 'tcp'

# From SERVERS to IOT
set firewall name servers-iot description 'From SERVERS to IOT'
set firewall name servers-iot default-action 'accept'

# From SERVERS to GUEST
set firewall name servers-guest description 'From SERVERS to GUEST'
set firewall name servers-guest default-action 'drop'
set firewall name servers-guest enable-default-log

# From SERVERS to WAN
set firewall name servers-wan description 'From SERVERS to WAN'
set firewall name servers-wan default-action 'accept'

# ---------------------------------

# From TRUSTED to LAN
set firewall name trusted-lan description 'From TRUSTED to LAN'
set firewall name trusted-lan default-action 'accept'

# From TRUSTED to LOCAL
set firewall name trusted-local description 'From TRUSTED to LOCAL'
set firewall name trusted-local default-action 'drop'
set firewall name trusted-local enable-default-log
set firewall name trusted-local rule 3 description 'Rule: accept ntp'
set firewall name trusted-local rule 3 action 'accept'
set firewall name trusted-local rule 3 destination port 'ntp'
set firewall name trusted-local rule 3 protocol 'udp'
set firewall name trusted-local rule 4 description 'Rule: accept dhcp'
set firewall name trusted-local rule 4 action 'accept'
set firewall name trusted-local rule 4 destination port 'bootps,bootpc'
set firewall name trusted-local rule 4 protocol 'udp'
set firewall name trusted-local rule 4 source port 'bootps,bootpc'
set firewall name trusted-local rule 5 description 'Rule: accept icmp'
set firewall name trusted-local rule 5 action 'accept'
set firewall name trusted-local rule 5 protocol 'icmp'
set firewall name trusted-local rule 6 description 'Rule: accept ssh'
set firewall name trusted-local rule 6 action 'accept'
set firewall name trusted-local rule 6 destination port 'ssh'
set firewall name trusted-local rule 6 protocol 'tcp'
set firewall name trusted-local rule 7 description 'Rule: accept igmp'
set firewall name trusted-local rule 7 action 'accept'
set firewall name trusted-local rule 7 protocol '2'
set firewall name trusted-local rule 8 description 'Rule: accept mdns'
set firewall name trusted-local rule 8 action 'accept'
set firewall name trusted-local rule 8 destination port 'mdns'
set firewall name trusted-local rule 8 protocol 'udp'
set firewall name trusted-local rule 8 source port 'mdns'
set firewall name trusted-local rule 9 description 'Rule: accept vnstat'
set firewall name trusted-local rule 9 action 'accept'
set firewall name trusted-local rule 9 destination port '8685'
set firewall name trusted-local rule 9 protocol 'tcp'

# From TRUSTED to SERVICES
set firewall name trusted-services description 'From TRUSTED to SERVICES'
set firewall name trusted-services default-action 'accept'

# From TRUSTED to SERVERS
set firewall name trusted-servers description 'From TRUSTED to SERVERS'
set firewall name trusted-servers default-action 'accept'

# From TRUSTED to IOT
set firewall name trusted-iot description 'From TRUSTED to IOT'
set firewall name trusted-iot default-action 'accept'

# From TRUSTED to GUEST
set firewall name trusted-guest description 'From TRUSTED to GUEST'
set firewall name trusted-guest default-action 'drop'
set firewall name trusted-guest enable-default-log

# From TRUSTED to WAN
set firewall name trusted-wan description 'From TRUSTED to WAN'
set firewall name trusted-wan default-action 'accept'

# ---------------------------------

# From IOT to LAN
set firewall name iot-lan description 'From IOT to LAN'
set firewall name iot-lan default-action 'drop'
set firewall name iot-lan enable-default-log

# From IOT to LOCAL
set firewall name iot-local description 'From IOT to LOCAL'
set firewall name iot-local default-action 'drop'
set firewall name iot-local enable-default-log
set firewall name iot-local rule 1 description 'Rule: accept ntp'
set firewall name iot-local rule 1 action 'accept'
set firewall name iot-local rule 1 destination port 'ntp'
set firewall name iot-local rule 1 protocol 'udp'
set firewall name iot-local rule 2 description 'Rule: accept dhcp'
set firewall name iot-local rule 2 action 'accept'
set firewall name iot-local rule 2 destination port 'bootps,bootpc'
set firewall name iot-local rule 2 protocol 'udp'
set firewall name iot-local rule 2 source port 'bootps,bootpc'
set firewall name iot-local rule 3 description 'Rule: accept igmp'
set firewall name iot-local rule 3 action 'accept'
set firewall name iot-local rule 3 protocol '2'
set firewall name iot-local rule 4 action 'accept'
set firewall name iot-local rule 4 description 'Rule: accept mdns'
set firewall name iot-local rule 4 destination port 'mdns'
set firewall name iot-local rule 4 protocol 'udp'
set firewall name iot-local rule 4 source port 'mdns'

# From IOT to SERVICES
set firewall name iot-services description 'From IOT to SERVICES'
set firewall name iot-services default-action 'drop'
set firewall name iot-services enable-default-log

# From IOT to SERVERS
set firewall name iot-servers description 'From IOT to SERVERS'
set firewall name iot-servers default-action 'drop'
set firewall name iot-servers enable-default-log
set firewall name iot-servers rule 1 description 'Rule: accept plex iot users'
set firewall name iot-servers rule 1 action 'accept'
set firewall name iot-servers rule 1 source group address-group 'iot-plex-users'
set firewall name iot-servers rule 1 destination group address-group 'plex-server'
set firewall name iot-servers rule 1 destination port '32400'
set firewall name iot-servers rule 1 protocol 'tcp'

# From IOT to TRUSTED
set firewall name iot-trusted description 'From IOT to TRUSTED'
set firewall name iot-trusted default-action 'drop'
set firewall name iot-trusted enable-default-log
set firewall name iot-trusted rule 1 action 'accept'
set firewall name iot-trusted rule 1 description 'Rule: accept mdns'
set firewall name iot-trusted rule 1 destination port 'mdns'
set firewall name iot-trusted rule 1 protocol 'udp'
set firewall name iot-trusted rule 1 source port 'mdns'

# From IOT to GUEST
set firewall name iot-guest description 'From IOT to GUEST'
set firewall name iot-guest default-action 'drop'
set firewall name iot-guest enable-default-log

# From IOT to WAN
set firewall name iot-wan description 'From IOT to WAN'
set firewall name iot-wan default-action 'accept'

# ---------------------------------

# From GUEST to LAN
set firewall name guest-lan description 'From GUEST to LAN'
set firewall name guest-lan default-action 'drop'
set firewall name guest-lan enable-default-log

# From GUEST to LOCAL
set firewall name guest-local description 'From GUEST to LOCAL'
set firewall name guest-local default-action 'drop'
set firewall name guest-local enable-default-log
set firewall name guest-local rule 3 description 'Rule: accept ntp'
set firewall name guest-local rule 3 action 'accept'
set firewall name guest-local rule 3 destination port 'ntp'
set firewall name guest-local rule 3 protocol 'udp'
set firewall name guest-local rule 4 description 'Rule: accept dhcp'
set firewall name guest-local rule 4 action 'accept'
set firewall name guest-local rule 4 destination port 'bootps,bootpc'
set firewall name guest-local rule 4 protocol 'udp'
set firewall name guest-local rule 4 source port 'bootps,bootpc'

# From GUEST to SERVICES
set firewall name guest-services description 'From GUEST to SERVICES'
set firewall name guest-services default-action 'drop'
set firewall name guest-services enable-default-log

# From GUEST to SERVERS
set firewall name guest-servers description 'From GUEST to SERVERS'
set firewall name guest-servers default-action 'drop'
set firewall name guest-servers enable-default-log

# From GUEST to TRUSTED
set firewall name guest-trusted description 'From GUEST to TRUSTED'
set firewall name guest-trusted default-action 'drop'
set firewall name guest-trusted enable-default-log

# From GUEST to IOT
set firewall name guest-iot description 'From GUEST to IOT'
set firewall name guest-iot default-action 'drop'
set firewall name guest-iot enable-default-log

# From GUEST to WAN
set firewall name guest-wan description 'From IOT to WAN'
set firewall name guest-wan default-action 'accept'

# ---------------------------------

# From WAN to LAN
set firewall name wan-lan description 'From WAN to LAN'
set firewall name wan-lan default-action 'drop'
set firewall name wan-lan enable-default-log

# From WAN to LOCAL
set firewall name wan-local description 'From WAN to LOCAL'
set firewall name wan-local default-action 'drop'
set firewall name wan-local enable-default-log
set firewall name wan-local rule 1 description 'Rule: accept wireguard'
set firewall name wan-local rule 1 action 'accept'
set firewall name wan-local rule 1 destination port '51820'
set firewall name wan-local rule 1 protocol 'udp'

# From WAN to SERVICES
set firewall name wan-services description 'From WAN to SERVICES'
set firewall name wan-services default-action 'drop'
set firewall name wan-services enable-default-log

# From WAN to SERVERS
set firewall name wan-servers description 'From WAN to SERVERS'
set firewall name wan-servers default-action 'drop'
set firewall name wan-servers enable-default-log
set firewall name wan-servers rule 1 description 'Rule: accept ingress from cloudflare'
set firewall name wan-servers rule 1 action 'accept'
set firewall name wan-servers rule 1 source group network-group 'cloudflare-networks-ipv4'
set firewall name wan-servers rule 1 destination group address-group 'k8s_main_ingress'
set firewall name wan-servers rule 1 destination port 'https'
set firewall name wan-servers rule 1 protocol 'tcp'

# From WAN to IOT
set firewall name wan-iot description 'From WAN to IOT'
set firewall name wan-iot default-action 'drop'
set firewall name wan-iot enable-default-log

# From WAN to GUEST
set firewall name wan-guest description 'From WAN to GUEST'
set firewall name wan-guest default-action 'drop'
set firewall name wan-guest enable-default-log

# From WAN to TRUSTED
set firewall name wan-trusted description 'From WAN to TRUSTED'
set firewall name wan-trusted default-action 'drop'
set firewall name wan-trusted enable-default-log
