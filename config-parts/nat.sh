#!/bin/vbash

# Forward HTTP(S) to ingress
set nat destination rule 100 description 'HTTPS'
set nat destination rule 100 destination port '443'
set nat destination rule 100 inbound-interface 'eth5'
set nat destination rule 100 protocol 'tcp'
set nat destination rule 100 translation address '10.11.1.2'
set nat destination rule 100 translation port '443'

# Force NTP
set nat destination rule 200 description 'Force NTP for Servers'
set nat destination rule 200 destination address '!10.10.0.1'
set nat destination rule 200 destination port '123'
set nat destination rule 200 inbound-interface 'bond0.10'
set nat destination rule 200 protocol 'udp'
set nat destination rule 200 translation address '10.10.0.1'
set nat destination rule 200 translation port '123'

set nat destination rule 201 description 'Force NTP for Trusted'
set nat destination rule 201 destination address '!10.20.0.1'
set nat destination rule 201 destination port '123'
set nat destination rule 201 inbound-interface 'bond0.20'
set nat destination rule 201 protocol 'udp'
set nat destination rule 201 translation address '10.20.0.1'
set nat destination rule 201 translation port '123'

set nat destination rule 202 description 'Force NTP for Wireguard'
set nat destination rule 202 destination address '!10.20.1.1'
set nat destination rule 202 destination port '123'
set nat destination rule 202 inbound-interface 'bond0.10'
set nat destination rule 202 protocol 'udp'
set nat destination rule 202 translation address '10.20.1.1'
set nat destination rule 202 translation port '123'

set nat destination rule 203 description 'Force NTP for IoT'
set nat destination rule 203 destination address '!192.168.1.1'
set nat destination rule 203 destination port '123'
set nat destination rule 203 inbound-interface 'bond0.98'
set nat destination rule 203 protocol 'udp'
set nat destination rule 203 translation address '192.168.1.1'
set nat destination rule 203 translation port '123'

set nat destination rule 204 description 'Force NTP for Guest'
set nat destination rule 204 destination address '!192.168.2.1'
set nat destination rule 204 destination port '123'
set nat destination rule 204 inbound-interface 'bond0.99'
set nat destination rule 204 protocol 'udp'
set nat destination rule 204 translation address '192.168.2.1'
set nat destination rule 204 translation port '123'

set nat destination rule 205 description 'Force NTP for Homelab'
set nat destination rule 205 destination address '!10.11.0.1'
set nat destination rule 205 destination port '123'
set nat destination rule 205 inbound-interface 'bond0.11'
set nat destination rule 205 protocol 'udp'
set nat destination rule 205 translation address '10.11.0.1'
set nat destination rule 205 translation port '123'

set nat destination rule 206 description 'Force NTP for Staging'
set nat destination rule 206 destination address '!10.12.0.1'
set nat destination rule 206 destination port '123'
set nat destination rule 206 inbound-interface 'bond0.12'
set nat destination rule 206 protocol 'udp'
set nat destination rule 206 translation address '10.12.0.1'
set nat destination rule 206 translation port '123'

# LAN -> WAN masquerade
set nat source rule 100 description 'ALL -> WAN'
set nat source rule 100 outbound-interface 'eth5'
set nat source rule 100 destination address '0.0.0.0/0'
set nat source rule 100 translation address 'masquerade'
