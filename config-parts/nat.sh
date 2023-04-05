#!/bin/vbash

# Forward HTTP(S) to ingress
set nat destination rule 100 description 'HTTPS'
set nat destination rule 100 destination port '443'
set nat destination rule 100 inbound-interface 'eth5'
set nat destination rule 100 protocol 'tcp'
set nat destination rule 100 translation address '10.10.1.2'
set nat destination rule 100 translation port '443'

# set nat destination rule 101 description 'HTTP'
# set nat destination rule 101 destination port '80'
# set nat destination rule 101 inbound-interface 'eth5'
# set nat destination rule 101 protocol 'tcp'
# set nat destination rule 101 translation address '10.11.0.1'
# set nat destination rule 101 translation port '80'

# Force DNS
# set nat destination rule 102 description 'Force DNS for IoT'
# set nat destination rule 102 destination address '!10.5.0.4'
# set nat destination rule 102 destination port '53'
# set nat destination rule 102 inbound-interface 'eth1.40'
# set nat destination rule 102 protocol 'tcp_udp'
# set nat destination rule 102 translation address '10.5.0.4'
# set nat destination rule 102 translation port '53'

# Force NTP
# set nat destination rule 105 description 'Force NTP for Servers'
# set nat destination rule 105 destination address '!10.1.1.1'
# set nat destination rule 105 destination port '123'
# set nat destination rule 105 inbound-interface 'eth1.10'
# set nat destination rule 105 protocol 'udp'
# set nat destination rule 105 translation address '10.1.1.1'
# set nat destination rule 105 translation port '123'

# LAN -> WAN masquerade
set nat source rule 100 description 'ALL -> WAN'
set nat source rule 100 outbound-interface 'eth5'
set nat source rule 100 destination address '0.0.0.0/0'
set nat source rule 100 translation address 'masquerade'
