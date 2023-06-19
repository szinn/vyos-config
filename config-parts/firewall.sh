#!/bin/vbash
# shellcheck disable=all

# General configuration
set firewall state-policy established action 'accept'
set firewall state-policy invalid action 'drop'
set firewall state-policy related action 'accept'

# Services containers
set firewall group address-group unifi-controller address '10.0.5.2'
set firewall group address-group unifi-unvr address '10.0.0.32'

# k8s cluster services
set firewall group network-group k8s-main network '10.11.1.0/24'
set firewall group network-group k8s-staging network '10.12.1.0/24'

set firewall group address-group plex-server description 'Plex Server'
set firewall group address-group plex-server address '10.11.1.14'

# Unifi cameras
set firewall group address-group unifi-cameras description 'Unifi Cameras'
set firewall group address-group unifi-cameras address '10.20.0.8'

# Scanner client machines
set firewall group address-group scanner-clients address '10.20.0.19'
set firewall group address-group scanner-clients address '10.20.0.20'

# Printers
set firewall group address-group printers address '192.168.1.96'

# Scanner ports
set firewall group port-group scanner-outbound-ports port 52217
set firewall group port-group scanner-outbound-ports port 53220
set firewall group port-group scanner-outbound-ports port 55265

# Plex users
set firewall group address-group plex-users description 'Plex users'
set firewall group address-group plex-users address '192.168.1.52'
set firewall group address-group plex-users address '192.168.2.64' # Scotte iPhone
set firewall group address-group plex-users address '192.168.2.65' # Julia iPhone
set firewall group address-group plex-users address '192.168.2.66' # Charles laptop

# Prometheus ports for metrics
set firewall group port-group prometheus-metrics port 9798 # speedtest
set firewall group port-group prometheus-metrics port 9100 # node-exporter
set firewall group port-group prometheus-metrics port 9342 # frr-exporter
set firewall group port-group prometheus-metrics port 9273 # vyos

# Sonos Music Library
set firewall group address-group sonos-library address '10.11.1.15'

# Sonos Controllers
set firewall group address-group sonos-controllers address '10.11.0.16' # Homelab
set firewall group address-group sonos-controllers address '10.11.0.17'
set firewall group address-group sonos-controllers address '10.11.0.18'
set firewall group address-group sonos-controllers address '10.11.0.19'
set firewall group address-group sonos-controllers address '10.11.0.20'
set firewall group address-group sonos-controllers address '10.11.0.21'
set firewall group address-group sonos-controllers address '10.11.1.15'
set firewall group address-group sonos-controllers address '10.20.0.16' # Scotte
set firewall group address-group sonos-controllers address '10.20.0.17'
set firewall group address-group sonos-controllers address '10.20.0.18'
set firewall group address-group sonos-controllers address '10.20.0.19'
set firewall group address-group sonos-controllers address '10.20.0.20'
set firewall group address-group sonos-controllers address '10.20.0.30'
set firewall group address-group sonos-controllers address '10.20.0.31'
set firewall group address-group sonos-controllers address '10.20.0.32' # Sophie
set firewall group address-group sonos-controllers address '10.20.0.33'
set firewall group address-group sonos-controllers address '10.20.0.34'
set firewall group address-group sonos-controllers address '10.20.0.35'
set firewall group address-group sonos-controllers address '10.20.0.36'
set firewall group address-group sonos-controllers address '192.168.2.64' # Scotte iPhone
set firewall group address-group sonos-controllers address '192.168.2.65' # Julia iPhone
set firewall group address-group sonos-controllers address '192.168.2.66' # Charles laptop

# Sonos Players
set firewall group address-group sonos-players address '192.168.1.52' # SonyTV
set firewall group address-group sonos-players address '192.168.1.128'
set firewall group address-group sonos-players address '192.168.1.129'
set firewall group address-group sonos-players address '192.168.1.130'
set firewall group address-group sonos-players address '192.168.1.131'
set firewall group address-group sonos-players address '192.168.1.132'
set firewall group address-group sonos-players address '192.168.1.133'
set firewall group address-group sonos-players address '192.168.1.134'
set firewall group address-group sonos-players address '192.168.1.135'
set firewall group address-group sonos-players address '192.168.1.136'
set firewall group address-group sonos-players address '192.168.1.137'
set firewall group address-group sonos-players address '192.168.1.138'

# Scotte devices
set firewall group address-group scotte-devices address '10.20.0.16'
set firewall group address-group scotte-devices address '10.20.0.17'
set firewall group address-group scotte-devices address '10.20.0.18'
set firewall group address-group scotte-devices address '10.20.0.19'
set firewall group address-group scotte-devices address '10.20.0.20'
set firewall group address-group scotte-devices address '10.20.1.2'
set firewall group address-group scotte-devices address '10.20.1.3'
set firewall group address-group scotte-devices address '10.20.1.4'

# Sophie devices
set firewall group address-group sophie-devices address '10.20.0.32'
set firewall group address-group sophie-devices address '10.20.0.33'
set firewall group address-group sophie-devices address '10.20.0.34'
set firewall group address-group sophie-devices address '10.20.0.35'
set firewall group address-group sophie-devices address '10.20.0.36'
