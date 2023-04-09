#!/bin/vbash

# Forward HTTP(S) to ingress
set nat destination rule 100 description 'HTTPS'
set nat destination rule 100 destination port '443'
set nat destination rule 100 inbound-interface 'eth5'
set nat destination rule 100 protocol 'tcp'
set nat destination rule 100 translation address '10.10.1.2'
set nat destination rule 100 translation port '443'

# Force NTP
set nat destination rule 200 description 'Force NTP for Servers'
set nat destination rule 200 destination address '!10.10.0.1'
set nat destination rule 200 destination port '123'
set nat destination rule 200 inbound-interface 'eth0.10'
set nat destination rule 200 protocol 'udp'
set nat destination rule 200 translation address '10.10.0.1'
set nat destination rule 200 translation port '123'

set nat destination rule 201 description 'Force NTP for Trusted'
set nat destination rule 201 destination address '!10.20.0.1'
set nat destination rule 201 destination port '123'
set nat destination rule 201 inbound-interface 'eth0.20'
set nat destination rule 201 protocol 'udp'
set nat destination rule 201 translation address '10.20.0.1'
set nat destination rule 201 translation port '123'

set nat destination rule 202 description 'Force NTP for Wireguard'
set nat destination rule 202 destination address '!10.20.1.1'
set nat destination rule 202 destination port '123'
set nat destination rule 202 inbound-interface 'eth0.10'
set nat destination rule 202 protocol 'udp'
set nat destination rule 202 translation address '10.20.1.1'
set nat destination rule 202 translation port '123'

set nat destination rule 203 description 'Force NTP for IoT'
set nat destination rule 203 destination address '!192.168.1.1'
set nat destination rule 203 destination port '123'
set nat destination rule 203 inbound-interface 'eth0.98'
set nat destination rule 203 protocol 'udp'
set nat destination rule 203 translation address '192.168.1.1'
set nat destination rule 203 translation port '123'

# LAN -> WAN masquerade
set nat source rule 100 description 'ALL -> WAN'
set nat source rule 100 outbound-interface 'eth5'
set nat source rule 100 destination address '0.0.0.0/0'
set nat source rule 100 translation address 'masquerade'
