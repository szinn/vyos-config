#!/bin/vbash

set interfaces ethernet eth5 address 'dhcp'
set interfaces ethernet eth5 description 'WAN'
# set interfaces ethernet eth5 hw-id 'e4:3a:6e:5f:33:9c'

set interfaces ethernet eth0 address '10.0.0.1/24'
set interfaces ethernet eth0 description 'LAN'
# set interfaces ethernet eth0 hw-id 'e4:3a:6e:5f:33:9c'
set interfaces ethernet eth0 vif 10 address '10.10.0.1/16'
set interfaces ethernet eth0 vif 10 description 'SERVERS'
set interfaces ethernet eth0 vif 20 address '10.20.0.1/16'
set interfaces ethernet eth0 vif 20 description 'TRUSTED'
set interfaces ethernet eth0 vif 98 address '192.168.1.1/24'
set interfaces ethernet eth0 vif 98 description 'IOT'
set interfaces ethernet eth0 vif 99 address '192.168.2.1/24'
set interfaces ethernet eth0 vif 99 description 'GUEST'

set interfaces ethernet eth1 address '10.0.1.1/24'
set interfaces ethernet eth1 description 'SERVICE'
# set interfaces ethernet eth1 hw-id 'e4:3a:6e:5f:33:9c'

# set interfaces ethernet eth2 hw-id 'e4:3a:6e:5f:33:9e'
# set interfaces ethernet eth3 hw-id 'e4:3a:6e:5f:33:9f'
# set interfaces ethernet eth4 hw-id 'e4:3a:6e:5f:33:a0'
