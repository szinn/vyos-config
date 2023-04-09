#!/bin/vbash

# General configuration
set firewall state-policy established action 'accept'
set firewall state-policy invalid action 'drop'
set firewall state-policy related action 'accept'

# Services containers
set firewall group address-group unifi-controller address '10.0.5.2'
set firewall group address-group unifi-unvr address '10.0.0.32'

# k8s cluster ingress
set firewall group address-group k8s_main_ingress address '10.10.1.2'
set firewall group address-group k8s_staging_ingress address '10.10.2.2'

set firewall group address-group plex-server description 'Plex Server'
set firewall group address-group plex-server address '10.10.1.14'

# Cloudflare IPv4 Network
set firewall group network-group cloudflare-networks-ipv4 description 'Task Managed: Cloudflare IPv4 Networks'
set firewall group network-group cloudflare-networks-ipv4 network '173.245.48.0/20'
set firewall group network-group cloudflare-networks-ipv4 network '103.21.244.0/22'
set firewall group network-group cloudflare-networks-ipv4 network '103.22.200.0/22'
set firewall group network-group cloudflare-networks-ipv4 network '103.31.4.0/22'
set firewall group network-group cloudflare-networks-ipv4 network '141.101.64.0/18'
set firewall group network-group cloudflare-networks-ipv4 network '108.162.192.0/18'
set firewall group network-group cloudflare-networks-ipv4 network '190.93.240.0/20'
set firewall group network-group cloudflare-networks-ipv4 network '188.114.96.0/20'
set firewall group network-group cloudflare-networks-ipv4 network '197.234.240.0/22'
set firewall group network-group cloudflare-networks-ipv4 network '198.41.128.0/17'
set firewall group network-group cloudflare-networks-ipv4 network '162.158.0.0/15'
set firewall group network-group cloudflare-networks-ipv4 network '104.16.0.0/13'
set firewall group network-group cloudflare-networks-ipv4 network '104.24.0.0/14'
set firewall group network-group cloudflare-networks-ipv4 network '172.64.0.0/13'
set firewall group network-group cloudflare-networks-ipv4 network '131.0.72.0/22'

# Unifi IoT Devices
set firewall group address-group iot-plex-users description 'Plex IoT users'
set firewall group address-group iot-plex-users address '192.168.1.52'
