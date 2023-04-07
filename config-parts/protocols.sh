#!/bin/vbash

# BGP configuration
set protocols bgp neighbor 10.10.0.16 description 'k8s-1'
set protocols bgp neighbor 10.10.0.16 address-family ipv4-unicast
set protocols bgp neighbor 10.10.0.16 remote-as '64512'
set protocols bgp neighbor 10.10.0.17 description 'k8s-2'
set protocols bgp neighbor 10.10.0.17 address-family ipv4-unicast
set protocols bgp neighbor 10.10.0.17 remote-as '64512'
set protocols bgp neighbor 10.10.0.18 description 'k8s-3'
set protocols bgp neighbor 10.10.0.18 address-family ipv4-unicast
set protocols bgp neighbor 10.10.0.18 remote-as '64512'
set protocols bgp neighbor 10.10.0.19 description 'k8s-4'
set protocols bgp neighbor 10.10.0.19 address-family ipv4-unicast
set protocols bgp neighbor 10.10.0.19 remote-as '64512'
set protocols bgp neighbor 10.10.0.20 description 'k8s-5'
set protocols bgp neighbor 10.10.0.20 address-family ipv4-unicast
set protocols bgp neighbor 10.10.0.20 remote-as '64512'
set protocols bgp neighbor 10.10.0.21 description 'k8s-6'
set protocols bgp neighbor 10.10.0.21 address-family ipv4-unicast
set protocols bgp neighbor 10.10.0.21 remote-as '64512'

set protocols bgp neighbor 10.10.0.24 description 'stage-1'
set protocols bgp neighbor 10.10.0.24 address-family ipv4-unicast
set protocols bgp neighbor 10.10.0.24 remote-as '64512'
set protocols bgp neighbor 10.10.0.25 description 'stage-2'
set protocols bgp neighbor 10.10.0.25 address-family ipv4-unicast
set protocols bgp neighbor 10.10.0.25 remote-as '64512'
set protocols bgp neighbor 10.10.0.26 description 'stage-3'
set protocols bgp neighbor 10.10.0.26 address-family ipv4-unicast
set protocols bgp neighbor 10.10.0.26 remote-as '64512'
set protocols bgp neighbor 10.10.0.27 description 'stage-4'
set protocols bgp neighbor 10.10.0.27 address-family ipv4-unicast
set protocols bgp neighbor 10.10.0.27 remote-as '64512'
set protocols bgp neighbor 10.10.0.28 description 'stage-5'
set protocols bgp neighbor 10.10.0.28 address-family ipv4-unicast
set protocols bgp neighbor 10.10.0.28 remote-as '64512'
set protocols bgp neighbor 10.10.0.29 description 'stage-6'
set protocols bgp neighbor 10.10.0.29 address-family ipv4-unicast
set protocols bgp neighbor 10.10.0.29 remote-as '64512'

set protocols bgp parameters router-id '10.0.0.1'
set protocols bgp system-as '64512'
