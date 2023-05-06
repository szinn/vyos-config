#!/bin/vbash

# General configuration
set firewall state-policy established action 'accept'
set firewall state-policy invalid action 'drop'
set firewall state-policy related action 'accept'

# Services containers
set firewall group address-group unifi-controller address '10.0.5.2'
set firewall group address-group unifi-unvr address '10.0.0.32'

# k8s cluster ingress
set firewall group address-group k8s_main_ingress address '10.11.1.2'
set firewall group address-group k8s_staging_ingress address '10.12.1.2'

set firewall group address-group plex-server description 'Plex Server'
set firewall group address-group plex-server address '10.11.1.14'

# Scanner client machines
set firewall group address-group scanner-clients address '10.20.0.19'
set firewall group address-group scanner-clients address '10.20.0.20'

# Scanner ports
set firewall group port-group scanner-outbound-ports port 52217
set firewall group port-group scanner-outbound-ports port 53220
set firewall group port-group scanner-outbound-ports port 55265

# Unifi IoT Devices
set firewall group address-group iot-plex-users description 'Plex IoT users'
set firewall group address-group iot-plex-users address '192.168.1.52'

# Prometheus ports for metrics
set firewall group port-group prometheus-metrics port 9798 # speedtest
set firewall group port-group prometheus-metrics port 9100 # node-exporter
set firewall group port-group prometheus-metrics port 9342 # frr-exporter
set firewall group port-group prometheus-metrics port 9273 # vyos
