#!/bin/bash

load /opt/vyatta/etc/config.boot.default

set interfaces ethernet eth0 address '10.0.0.1/24'
set interfaces ethernet eth0 description 'LAN'

set interfaces ethernet eth1 address '10.0.1.1/24'
set interfaces ethernet eth1 description 'SERVICE'

set interfaces ethernet eth5 address 'dhcp'
set interfaces ethernet eth5 description 'WAN'

set system login user vyos authentication public-keys scotte key 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDP1JMwwIE7/qpqLNOvIcYNy6CHhfR8S/Tm0ZCBFchcsPuvtQ2yuqjmi6DGaDiUzV2ln8tFzBVhi+eOor9r5l/XwK0wcNpuBbdNf0/C0z6SklEKZctU5sCFvEIw4V4WfNctChrarPCfZo7lae/7PJKtYQDuqwC0KWY2I43+kPPkR0o+sRYcMdvYgBHcNfUQNcXoO0nWlMcaEocmcFBq82E7RI8uY5RR6liF/VvpIj5C9FviTd7IIFdhVy+w6p7QJr/kUQAQCYF2sVrAH+ZqVVUh18LhaA0SM4mqnJyaCqKfdl8orufRaI61uxS70RlnJH0WYALejOqtx7IBMJGOdTM0ZlCYYpfqqUrRvbYQdiMlfXSCoMk8r3ldSY+FLw3FBMnOzUK35Srio1g6xoYsRChQbLZiJKDBRcGNghmiLuT3EsGF37+hjOOtKWLXXSnPZQKQckc5O1spSW4oR8Ij4JXfDyKL0n5H+MPn8oThK+jePTmCPLKMUo9OpFAtz/maZ8z8mAkHpdVt7mjL3D1sEGkIbo6XDjICfFEjLbnVJhKWAXluuAkzL9Bp52lkop8V4ALk5oTVe/c52oJQhiD6XVjwjJJ0DrvGScLhDzZARpd1d2eaGE4fbow8NgkkW5lpaXNvW0bN6L/+7N4nHLPWD9WKRU6Lee2FXk0C5Gnn1QB0zQ=='
set system login user vyos authentication public-keys scotte type 'ssh-rsa'

set service ssh disable-password-authentication
set service ssh port '22'

delete system host-name
set system domain-name 'zinn.tech'
set system host-name 'gateway'

set system ipv6 disable-forwarding

set system name-server '1.1.1.1'

set system sysctl parameter kernel.pty.max value '24000'

set system time-zone 'America/Toronto'

set service dhcp-server hostfile-update
set service dhcp-server host-decl-name

set service dhcp-server shared-network-name LAN authoritative
set service dhcp-server shared-network-name LAN ping-check
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 default-router '10.0.0.1'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 lease '900'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 name-server '1.1.1.1'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 range 0 start '10.0.0.208'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 range 0 stop '10.0.0.254'

set service dhcp-server shared-network-name LAN authoritative
set service dhcp-server shared-network-name LAN ping-check
set service dhcp-server shared-network-name LAN subnet 10.0.1.0/24 default-router '10.0.1.1'
set service dhcp-server shared-network-name LAN subnet 10.0.1.0/24 lease '900'
set service dhcp-server shared-network-name LAN subnet 10.0.1.0/24 name-server '1.1.1.1'
set service dhcp-server shared-network-name LAN subnet 10.0.1.0/24 range 0 start '10.0.1.208'
set service dhcp-server shared-network-name LAN subnet 10.0.1.0/24 range 0 stop '10.0.1.254'

# ALL -> WAN masquerade
set nat source rule 100 description 'ALL -> WAN'
set nat source rule 100 outbound-interface 'eth5'
set nat source rule 100 destination address '0.0.0.0/0'
set nat source rule 100 translation address 'masquerade'

# General configuration
set firewall state-policy established action 'accept'
set firewall state-policy invalid action 'drop'
set firewall state-policy related action 'accept'

set firewall zone lan default-action 'drop'
set firewall zone lan from local firewall name 'local-lan'
set firewall zone lan from services firewall name 'services-lan'
set firewall zone lan from wan firewall name 'wan-lan'
set firewall zone lan interface 'eth0'
set firewall zone lan interface 'eth1'

set firewall zone local default-action 'drop'
set firewall zone local description 'Local router zone'
set firewall zone local from lan firewall name 'lan-local'
set firewall zone local from services firewall name 'services-local'
set firewall zone local from wan firewall name 'wan-local'
set firewall zone local local-zone

set firewall zone services default-action 'drop'
set firewall zone services description 'VyOS services zone'
set firewall zone services from lan firewall name 'lan-services'
set firewall zone services from local firewall name 'local-services'
set firewall zone services from wan firewall name 'wan-services'
set firewall zone services interface 'cni-services'

set firewall zone wan from lan firewall name 'lan-wan'
set firewall zone wan from local firewall name 'local-wan'
set firewall zone wan from services firewall name 'services-wan'
set firewall zone wan interface 'eth5'

# From LAN to LOCAL
set firewall name lan-local default-action 'accept'
set firewall name lan-local description 'From LAN to LOCAL'
set firewall name lan-local enable-default-log

# From LAN to SERVICES
set firewall name lan-services default-action 'accept'
set firewall name lan-services description 'From LAN to SERVICES'
set firewall name lan-services enable-default-log

# From LAN to WAN
set firewall name lan-wan default-action 'accept'
set firewall name lan-wan description 'From LAN to WAN'
set firewall name lan-wan enable-default-log

# From LOCAL to LAN
set firewall name local-lan default-action 'drop'
set firewall name local-lan description 'From LOCAL to LAN'
set firewall name local-lan enable-default-log

# From LOCAL to SERVICES
set firewall name local-services default-action 'accept'
set firewall name local-services description 'From LOCAL to SERVICES'
set firewall name local-services enable-default-log

# From LOCAL to WAN
set firewall name local-wan default-action 'accept'
set firewall name local-wan description 'From LOCAL to WAN'
set firewall name local-wan enable-default-log

# From SERVICES to LAN
set firewall name services-lan default-action 'drop'
set firewall name services-lan description 'From SERVICES to LAN'
set firewall name services-lan enable-default-log

# From SERVICES to LOCAL
set firewall name services-local default-action 'accept'
set firewall name services-local description 'From SERVICES to LOCAL'

# From SERVICES to WAN
set firewall name services-wan default-action 'accept'
set firewall name services-wan description 'From SERVICES to WAN'

# From WAN to LAN
set firewall name wan-lan default-action 'drop'
set firewall name wan-lan description 'From WAN to LAN'
set firewall name wan-lan enable-default-log

# From WAN to LOCAL
set firewall name wan-local default-action 'drop'
set firewall name wan-local description 'From WAN to LOCAL'
set firewall name wan-local enable-default-log

# From WAN to SERVICES
set firewall name wan-services default-action 'drop'
set firewall name wan-services description 'From WAN to SERVICES'
set firewall name wan-services enable-default-log

# Container networks
set container network services prefix '10.0.5.0/24'

# unifi
mkdir -p /config/containers/unifi
set container name unifi environment RUNAS_UID0 value 'false'
set container name unifi environment TZ value 'America/Toronto'
set container name unifi environment UNIFI_GID value '999'
set container name unifi environment UNIFI_STDOUT value 'true'
set container name unifi environment UNIFI_UID value '999'
set container name unifi environment CERT_IS_CHAIN value 'true'
set container name unifi image 'ghcr.io/jacobalberty/unifi-docker:v7.3.83'
set container name unifi memory '0'
set container name unifi network services address '10.0.5.2'
set container name unifi restart 'on-failure'
set container name unifi shared-memory '0'
set container name unifi volume data destination '/unifi'
set container name unifi volume data source '/config/containers/unifi'
