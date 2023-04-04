#!/bin/vbash

set service dhcp-server hostfile-update
set service dhcp-server host-decl-name

# LAN
set service dhcp-server shared-network-name LAN authoritative
set service dhcp-server shared-network-name LAN ping-check
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 default-router '10.0.0.1'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 lease '900'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 name-server '10.0.5.2'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 range 0 start '10.0.0.208'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 range 0 stop '10.0.0.254'

# LAN Switches
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-pro24 ip-address '10.0.0.16'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-pro24 mac-address '74:ac:b9:4a:50:2b'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-flex-mini ip-address '10.0.0.17'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-flex-mini mac-address '74:ac:b9:a9:c9:90'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-flex ip-address '10.0.0.18'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-flex mac-address 'f4:92:bf:a6:e7:5f'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-ent8-1 ip-address '10.0.0.19'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-ent8-1 mac-address '78:45:58:8e:59:59'
#set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-ent8-2 ip-address '10.0.0.20'
#set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-ent8-2 mac-address '44:d9:e7:fc:21:f9'

# LAN AP
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping sunroom-ap ip-address '10.0.0.24'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping sunroom-ap mac-address 'f4:92:bf:95:30:26'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping mediaroom-ap ip-address '10.0.0.25'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping mediaroom-ap mac-address 'f4:92:bf:95:2f:1e'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping livingroom-ap ip-address '10.0.0.26'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping livingroom-ap mac-address '68:d7:9a:27:78:bf'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping backyard-ap ip-address '10.0.0.27'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping backyard-ap mac-address '68:d7:9a:44:08:bd'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping basement-ap ip-address '10.0.0.28'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping basement-ap mac-address '78:45:58:e7:f3:23' # IAP-U6-LR

# LAN Protect
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping zeus ip-address '10.0.0.32'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping zeus mac-address 'F4:92:BF:86:2F:78'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping driveway-cam ip-address '10.0.0.33'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping driveway-cam mac-address '74:ac:b9:01:93:bd'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping backdoor-cam ip-address '10.0.0.34'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping backdoor-cam mac-address '74:ac:b9:01:89:df'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping deck-cam ip-address '10.0.0.35'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping deck-cam mac-address '74:ac:b9:01:89:82'

# LAN Power
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usp-pdu-pro ip-address '10.0.0.40'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usp-pdu-pro mac-address '60:22:32:99:68:95'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usp-plug ip-address '10.0.0.41'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usp-plug mac-address 'fc:ec:da:76:74:9a' # USP-Plug

# LAN (service port)
set service dhcp-server shared-network-name LAN authoritative
set service dhcp-server shared-network-name LAN ping-check
set service dhcp-server shared-network-name LAN subnet 10.0.1.0/24 default-router '10.0.1.1'
set service dhcp-server shared-network-name LAN subnet 10.0.1.0/24 lease '900'
set service dhcp-server shared-network-name LAN subnet 10.0.1.0/24 name-server '10.0.5.2'
set service dhcp-server shared-network-name LAN subnet 10.0.1.0/24 range 0 start '10.0.1.208'
set service dhcp-server shared-network-name LAN subnet 10.0.1.0/24 range 0 stop '10.0.1.254'

# Servers VLAN
set service dhcp-server shared-network-name SERVERS authoritative
set service dhcp-server shared-network-name SERVERS ping-check
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 default-router '10.10.0.1'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 domain-name 'zinn.tech'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 lease '900'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 name-server '10.0.5.2'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 range 0 start '10.10.0.200'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 range 0 stop '10.10.0.254'

set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping ragnar ip-address '10.10.0.2'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping ragnar mac-address 'd8:5e:d3:82:27:fd'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping hades ip-address '10.10.0.3'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping hades mac-address '00:11:32:c0:04:19'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping ares ip-address '10.10.0.4'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping ares mac-address '48:21:0b:32:87:c8'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping pikvm ip-address '10.10.0.5'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping pikvm mac-address 'e4:5f:01:92:ba:8f'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping pihole ip-address '10.10.0.6'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping pihole mac-address 'b8:27:eb:e9:34:f4'

# k8s Main Cluster
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping k8s-1 ip-address '10.10.0.16'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping k8s-1 mac-address '7c:83:34:b1:82:d7'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping k8s-2 ip-address '10.10.0.17'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping k8s-2 mac-address '7c:83:34:b1:fe:32'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping k8s-3 ip-address '10.10.0.18'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping k8s-3 mac-address '7c:83:34:b1:7b:8b'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping k8s-4 ip-address '10.10.0.19'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping k8s-4 mac-address '1c:69:7a:a5:63:05'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping k8s-5 ip-address '10.10.0.20'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping k8s-5 mac-address '1c:69:7a:a5:a4:a7'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping k8s-6 ip-address '10.10.0.21'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping k8s-6 mac-address '1c:69:7a:a5:c1:19'

# k8s Staging Cluster
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping stage-1 ip-address '10.10.0.24'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping stage-1 mac-address 'de:ca:ff:10:00:18'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping stage-2 ip-address '10.10.0.25'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping stage-2 mac-address 'de:ca:ff:10:00:19'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping stage-3 ip-address '10.10.0.26'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping stage-3 mac-address 'de:ca:ff:10:00:1a'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping stage-4 ip-address '10.10.0.27'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping stage-4 mac-address 'de:ca:ff:10:00:1b'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping stage-5 ip-address '10.10.0.28'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping stage-5 mac-address 'de:ca:ff:10:00:1c'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping stage-6 ip-address '10.10.0.29'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping stage-6 mac-address 'de:ca:ff:10:00:1d'

# TRUSTED VLAN
set service dhcp-server shared-network-name TRUSTED authoritative
set service dhcp-server shared-network-name TRUSTED ping-check
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 default-router '10.20.0.1'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 domain-name 'zinn.tech'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 lease '900'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 name-server '10.0.5.2'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 range 0 start '10.20.0.200'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 range 0 stop '10.20.0.254'

# Scotte's devices
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-iphone ip-address '10.20.0.16'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-iphone mac-address '12:44:75:4c:12:fa'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-iwatch ip-address '10.20.0.17'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-iwatch mac-address 'c4:c3:6b:da:e5:18'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-ipad ip-address '10.20.0.18'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-ipad mac-address '5e:4b:ab:35:92:14'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-odin-dock ip-address '10.20.0.19'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-odin-dock mac-address '00:23:a4:06:1a:e8'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-odin-wifi ip-address '10.20.0.20'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-odin-wifi mac-address 'f4:d4:88:5d:e7:21'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-odin-win11 ip-address '10.20.0.29'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-odin-win11 mac-address '00:1c:42:0b:1e:65'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-usbc ip-address '10.20.0.30'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-usbc mac-address '00:e0:4c:a9:e9:59'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-block-macbook ip-address '10.20.0.31'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-block-macbook mac-address 'f4:d4:88:68:6b:3d'

# Sophie's devices
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-iphone ip-address '10.20.0.32'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-iphone mac-address 'aa:68:ae:5d:8e:00'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-iwatch ip-address '10.20.0.33'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-iwatch mac-address 'c4:c3:6b:da:e5:18'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-ipad ip-address '10.20.0.34'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-ipad mac-address '5e:4b:ab:35:92:14'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-desktop ip-address '10.20.0.35'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-desktop mac-address '78:7b:8a:b9:bb:1c'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-desktop-wifi ip-address '10.20.0.36'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-desktop-wifi mac-address '98:9e:63:39:b9:8c'

# Sonos devices
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-tv-playbar ip-address '10.20.0.128'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-tv-playbar mac-address '5c:aa:fd:10:e6:6a'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-tv-sub ip-address '10.20.0.129'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-tv-sub mac-address 'b8:e9:37:67:46:f4'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-tv-r ip-address '10.20.0.130'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-tv-r mac-address '5c:aa:fd:25:80:68'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-tv-l ip-address '10.20.0.131'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-tv-l mac-address '5c:aa:fd:28:5e:98'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-livingroom-r ip-address '10.20.0.132'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-livingroom-r mac-address '00:0e:58:7a:b1:84'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-livingroom-l ip-address '10.20.0.133'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-livingroom-l mac-address '00:0e:58:fd:ad:c8'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-sunroom ip-address '10.20.0.134'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-sunroom mac-address '5c:aa:fd:50:60:2e'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-scotte-desk ip-address '10.20.0.135'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-scotte-desk mac-address '48:a6:b8:23:81:2e'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-kitchen ip-address '10.20.0.136'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-kitchen mac-address '34:7e:5c:d0:6c:72'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-bedroom ip-address '10.20.0.137'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sonos-bedroom mac-address '38:42:0b:66:1c:82'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta ip-address '10.20.0.16'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta mac-address 'de:ca:ff:10:00:18' # stage-1
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta ip-address '10.20.0.16'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta mac-address 'de:ca:ff:10:00:18' # stage-1
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta ip-address '10.20.0.16'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta mac-address 'de:ca:ff:10:00:18' # stage-1
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta ip-address '10.20.0.16'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta mac-address 'de:ca:ff:10:00:18' # stage-1
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta ip-address '10.20.0.16'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta mac-address 'de:ca:ff:10:00:18' # stage-1
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta ip-address '10.20.0.16'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta mac-address 'de:ca:ff:10:00:18' # stage-1
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta ip-address '10.20.0.16'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta mac-address 'de:ca:ff:10:00:18' # stage-1
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta ip-address '10.20.0.16'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta mac-address 'de:ca:ff:10:00:18' # stage-1
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta ip-address '10.20.0.16'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta mac-address 'de:ca:ff:10:00:18' # stage-1
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta ip-address '10.20.0.16'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping delta mac-address 'de:ca:ff:10:00:18' # stage-1

# IOT VLAN
set service dhcp-server shared-network-name IOT authoritative
set service dhcp-server shared-network-name IOT ping-check
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 default-router '192.168.1.1'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 domain-name 'zinn.tech'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 lease '900'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 name-server '1.1.1.1'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 range 0 start '192.168.1.200'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 range 0 stop '192.168.1.254'

# IOT devices
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping kvm-switch ip-address '192.168.1.10'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping kvm-switch mac-address '84:c2:e4:26:4e:8c'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-basement ip-address '192.168.1.16'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-basement mac-address '64:16:66:ce:90:da'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-furnace ip-address '192.168.1.17'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-furnace mac-address '64:16:66:cc:7d:3b'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-front-door ip-address '192.168.1.18'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-front-door mac-address '18:b4:30:ae:8a:85'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-kitchen ip-address '192.168.1.19'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-kitchen mac-address '16:66:cd:f6:08'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-upstairs ip-address '192.168.1.20'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-upstairs mac-address '64:16:66:cd:f8:e8'

set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping g4-front-door ip-address '192.168.1.24'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping g4-front-door mac-address 'e0:63:da:00:9f:e1'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping wyze-camera-1 ip-address '192.168.1.25'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping wyze-camera-1 mac-address '2c:aa:8e:6e:90:d3'
#set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping wyze-camera-2 ip-address '192.168.1.26'
#set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping wyze-camera-2 mac-address '64:16:66:cd:f8:e8'

set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tplink-energy ip-address '192.168.1.32'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tplink-energy mac-address '54:af:97:08:14:34'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tpllink-switch-1 ip-address '192.168.1.33'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tpllink-switch-1 mac-address '70:4f:57:b0:10:09'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tpllink-switch-2 ip-address '192.168.1.34'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tpllink-switch-2 mac-address '70:4f:57:b0:20:24'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tpllink-switch-3 ip-address '192.168.1.35'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tpllink-switch-3 mac-address '70:4f:57:b4:5b:ca'

set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping printer-3d-octoprint ip-address '192.168.1.48'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping printer-3d-octoprint mac-address 'b8:27:eb:e4:eb:5a'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping ecobee ip-address '192.168.1.49'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping ecobee mac-address '44:61:32:ac:20:ff'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping hottub ip-address '192.168.1.50'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping hottub mac-address '00:15:27:39:1f:16'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping philips-hue ip-address '192.168.1.51'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping philips-hue mac-address '00:17:88:24:d0:d9'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sony-tv ip-address '192.168.1.52'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sony-tv mac-address 'cc:98:8b:fb:6d:36'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping chargepoint ip-address '192.168.1.53'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping chargepoint mac-address '00:24:b1:04:16:b5'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping peleton ip-address '192.168.1.54'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping peleton mac-address 'ac:04:0b:6f:0c:bc'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tesla-whisper ip-address '192.168.1.55'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tesla-whisper mac-address '4c:fc:aa:03:d8:81'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping aria-scale ip-address '192.168.1.56'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping aria-scale mac-address '18:00:db:0c:e8:e2'

# GUEST VLAN
set service dhcp-server shared-network-name GUEST authoritative
set service dhcp-server shared-network-name GUEST ping-check
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 default-router '192.168.2.1'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 domain-name 'zinn.tech'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 lease '900'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 name-server '1.1.1.1'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 range 0 start '192.168.2.200'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 range 0 stop '192.168.2.254'
