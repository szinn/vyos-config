#!/bin/vbash
# shellcheck disable=all

set service dhcp-server global-parameters 'option space ubnt;'
set service dhcp-server global-parameters 'option ubnt.unifi-address code 1 = ip-address;'
set service dhcp-server global-parameters 'class &quot;ubnt&quot; {'
set service dhcp-server global-parameters 'match if substring (option vendor-class-identifier, 0, 4) = &quot;ubnt&quot;;'
set service dhcp-server global-parameters 'option vendor-class-identifier &quot;ubnt&quot;;'
set service dhcp-server global-parameters 'vendor-option-space ubnt;'
set service dhcp-server global-parameters '}'

# LAN
set service dhcp-server shared-network-name LAN authoritative
set service dhcp-server shared-network-name LAN ping-check
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 default-router '10.0.0.1'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 lease '86400'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 name-server '10.0.5.4'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 range 0 start '10.0.0.208'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 range 0 stop '10.0.0.239'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 subnet-parameters 'option ubnt.unifi-address 10.0.5.2;'

# LAN Switches
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-pro24 ip-address '10.0.0.16'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-pro24 mac-address '74:ac:b9:4a:50:2b'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-flex-xg ip-address '10.0.0.17'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-flex-xg mac-address 'd0:21:f9:e7:7b:95'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-flex ip-address '10.0.0.18'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-flex mac-address 'f4:92:bf:a6:e7:5f'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-ent8-1 ip-address '10.0.0.19'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-ent8-1 mac-address '78:45:58:8e:59:59'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-ent8-2 ip-address '10.0.0.20'
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping usw-ent8-2 mac-address 'ac:8b:a9:61:1c:db'

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
set service dhcp-server shared-network-name LAN subnet 10.0.0.0/24 static-mapping zeus mac-address 'F4:92:BF:86:2F:79'
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

# LAN (service port - eth4)
set service dhcp-server shared-network-name SERVICE authoritative
set service dhcp-server shared-network-name SERVICE ping-check
set service dhcp-server shared-network-name SERVICE subnet 10.0.4.0/24 default-router '10.0.4.1'
set service dhcp-server shared-network-name SERVICE subnet 10.0.4.0/24 lease '86400'
set service dhcp-server shared-network-name SERVICE subnet 10.0.4.0/24 name-server '10.0.5.4'
set service dhcp-server shared-network-name SERVICE subnet 10.0.4.0/24 range 0 start '10.0.4.208'
set service dhcp-server shared-network-name SERVICE subnet 10.0.4.0/24 range 0 stop '10.0.4.239'

# Servers VLAN
set service dhcp-server shared-network-name SERVERS authoritative
set service dhcp-server shared-network-name SERVERS ping-check
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 default-router '10.10.0.1'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 domain-name 'zinn.tech'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 lease '86400'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 name-server '10.0.5.4'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 range 0 start '10.10.0.208'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 range 0 stop '10.10.0.239'

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
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping artemis ip-address '10.10.0.7'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping artemis mac-address 'd8:3a:dd:0d:14:08'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping hera ip-address '10.10.0.8'
set service dhcp-server shared-network-name SERVERS subnet 10.10.0.0/24 static-mapping hera mac-address '48:21:0b:58:33:b6'

# Homelab VLAN
set service dhcp-server shared-network-name HOMELAB authoritative
set service dhcp-server shared-network-name HOMELAB ping-check
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 default-router '10.11.0.1'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 domain-name 'zinn.tech'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 lease '86400'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 name-server '10.0.5.4'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 range 0 start '10.11.0.208'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 range 0 stop '10.11.0.239'

# k8s Main Cluster
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 static-mapping k8s-1 ip-address '10.11.0.16'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 static-mapping k8s-1 mac-address '7c:83:34:b1:82:d7'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 static-mapping k8s-2 ip-address '10.11.0.17'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 static-mapping k8s-2 mac-address '7c:83:34:b1:fe:32'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 static-mapping k8s-3 ip-address '10.11.0.18'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 static-mapping k8s-3 mac-address '7c:83:34:b1:7b:8b'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 static-mapping k8s-4 ip-address '10.11.0.19'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 static-mapping k8s-4 mac-address '1c:69:7a:a5:63:05'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 static-mapping k8s-5 ip-address '10.11.0.20'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 static-mapping k8s-5 mac-address '1c:69:7a:a5:a4:a7'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 static-mapping k8s-6 ip-address '10.11.0.21'
set service dhcp-server shared-network-name HOMELAB subnet 10.11.0.0/24 static-mapping k8s-6 mac-address '1c:69:7a:a5:c1:19'

# Staging VLAN
set service dhcp-server shared-network-name STAGING authoritative
set service dhcp-server shared-network-name STAGING ping-check
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 default-router '10.12.0.1'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 domain-name 'zinn.tech'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 lease '86400'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 name-server '10.0.5.4'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 range 0 start '10.12.0.208'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 range 0 stop '10.12.0.239'

# k8s Staging Cluster
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 static-mapping stage-1 ip-address '10.12.0.16'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 static-mapping stage-1 mac-address 'de:ca:ff:10:12:10'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 static-mapping stage-2 ip-address '10.12.0.17'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 static-mapping stage-2 mac-address 'de:ca:ff:10:12:11'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 static-mapping stage-3 ip-address '10.12.0.18'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 static-mapping stage-3 mac-address 'de:ca:ff:10:12:12'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 static-mapping stage-4 ip-address '10.12.0.19'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 static-mapping stage-4 mac-address 'de:ca:ff:10:12:13'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 static-mapping stage-5 ip-address '10.12.0.20'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 static-mapping stage-5 mac-address 'de:ca:ff:10:12:14'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 static-mapping stage-6 ip-address '10.12.0.21'
set service dhcp-server shared-network-name STAGING subnet 10.12.0.0/24 static-mapping stage-6 mac-address 'de:ca:ff:10:12:15'

# TRUSTED VLAN
set service dhcp-server shared-network-name TRUSTED authoritative
set service dhcp-server shared-network-name TRUSTED ping-check
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 default-router '10.20.0.1'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 domain-name 'zinn.tech'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 lease '86400'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 name-server '10.0.5.4'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 range 0 start '10.20.0.208'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 range 0 stop '10.20.0.239'

# Unifi Devices
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping g4-front-door ip-address '10.20.0.8'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping g4-front-door mac-address 'e0:63:da:00:9f:e1'

# Scotte's devices
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-iphone ip-address '10.20.0.16'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-iphone mac-address '7c:ec:b1:ab:9a:c2'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-iwatch ip-address '10.20.0.17'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-iwatch mac-address '08:25:73:ce:4f:4b'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-ipad ip-address '10.20.0.18'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping scotte-ipad mac-address '4c:2e:b4:7d:90:76'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping odin ip-address '10.20.0.19'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping odin mac-address '64:4b:f0:38:77:85'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping odin-wifi ip-address '10.20.0.20'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping odin-wifi mac-address 'f4:d4:88:5d:e7:21'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping odin-macvm ip-address '10.20.0.25'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping odin-macvm mac-address 'DE:CA:FF:20:00:19'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping odin-nixvm ip-address '10.20.0.26'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping odin-nixvm mac-address 'DE:CA:FF:20:00:1A'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping odin-athena ip-address '10.20.0.27'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping odin-athena mac-address 'DE:CA:FF:20:00:1B'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping odin-win11 ip-address '10.20.0.28'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping odin-win11 mac-address '00:1c:42:0b:1e:65'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping usbc1 ip-address '10.20.0.29'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping usbc1 mac-address '00:e0:4c:a9:19:4a'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping usbc2 ip-address '10.20.0.30'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping usbc2 mac-address '00:e0:4c:a9:e9:59'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping block ip-address '10.20.0.31'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping block mac-address 'f4:d4:88:68:6b:3d'

# Sophie's devices
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-iphone ip-address '10.20.0.32'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-iphone mac-address 'a0:4e:cf:20:08:40'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-iwatch ip-address '10.20.0.33'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-iwatch mac-address 'c4:c3:6b:da:e5:18'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-ipad ip-address '10.20.0.34'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-ipad mac-address 'b4:f6:1c:5b:43:34'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-desktop ip-address '10.20.0.35'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-desktop mac-address '78:7b:8a:b9:bb:1c'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-desktop-wifi ip-address '10.20.0.36'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping sophie-desktop-wifi mac-address '98:9e:63:39:b9:8c'

# VyOS Proxmox Canary
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping vyos-canary-20 ip-address '10.20.0.240'
set service dhcp-server shared-network-name TRUSTED subnet 10.20.0.0/24 static-mapping vyos-canary-20 mac-address 'DE:CA:FF:20:00:F0'

# IOT VLAN
set service dhcp-server shared-network-name IOT authoritative
set service dhcp-server shared-network-name IOT ping-check
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 default-router '192.168.1.1'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 domain-name 'zinn.tech'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 lease '86400'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 name-server '1.1.1.1'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 range 0 start '192.168.1.208'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 range 0 stop '192.168.1.239'

# IOT devices
# set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping kvm ip-address '192.168.1.10'  # Address is hard-coded
# set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping kvm mac-address '84:c2:e4:26:4e:8c'

set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping wyze-camera-1 ip-address '192.168.1.25'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping wyze-camera-1 mac-address '2c:aa:8e:6e:90:d3'
# set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping wyze-camera-2 ip-address '192.168.1.26'
# set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping wyze-camera-2 mac-address '64:16:66:cd:f8:e8'

set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tplink-energy ip-address '192.168.1.32'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tplink-energy mac-address '54:af:97:08:14:34'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tplink-switch-1 ip-address '192.168.1.33'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tplink-switch-1 mac-address '70:4f:57:b0:10:09'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tplink-switch-2 ip-address '192.168.1.34'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tplink-switch-2 mac-address '70:4f:57:b0:20:24'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tplink-switch-3 ip-address '192.168.1.35'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping tplink-switch-3 mac-address '70:4f:57:b4:5b:ca'

set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping octo ip-address '192.168.1.48'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping octo mac-address 'b8:27:eb:e4:eb:5a'
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

set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-basement ip-address '192.168.1.64'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-basement mac-address '64:16:66:ce:90:da'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-furnace ip-address '192.168.1.65'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-furnace mac-address '64:16:66:cc:7d:3b'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-front-door ip-address '192.168.1.66'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-front-door mac-address '18:b4:30:ae:8a:85'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-kitchen ip-address '192.168.1.67'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-kitchen mac-address '64:16:66:cd:f6:08'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-upstairs ip-address '192.168.1.68'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping nest-upstairs mac-address '64:16:66:cd:f8:e8'

set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping laser ip-address '192.168.1.96'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping laser mac-address '78:8c:77:12:04:16'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping fujitsu-scanner-office ip-address '192.168.1.97'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping fujitsu-scanner-office mac-address '84:25:3f:6d:b8:8c'

# Sonos devices
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-tv-playbar ip-address '192.168.1.128'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-tv-playbar mac-address '5c:aa:fd:10:e6:6a'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-tv-sub ip-address '192.168.1.129'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-tv-sub mac-address 'b8:e9:37:67:46:f4'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-tv-r ip-address '192.168.1.130'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-tv-r mac-address '5c:aa:fd:25:80:68'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-tv-l ip-address '192.168.1.131'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-tv-l mac-address '5c:aa:fd:28:5e:98'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-livingroom-r ip-address '192.168.1.132'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-livingroom-r mac-address '00:0e:58:7a:b1:84'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-livingroom-l ip-address '192.168.1.133'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-livingroom-l mac-address '00:0e:58:fd:ad:c8'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-sunroom ip-address '192.168.1.134'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-sunroom mac-address '5c:aa:fd:50:60:2e'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-scotte-desk ip-address '192.168.1.135'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-scotte-desk mac-address '48:a6:b8:23:81:2e'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-kitchen ip-address '192.168.1.136'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-kitchen mac-address '34:7e:5c:d0:6c:72'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-bedroom ip-address '192.168.1.137'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-bedroom mac-address '38:42:0b:66:1c:82'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-yard ip-address '192.168.1.138'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping sonos-yard mac-address 'f0:f6:c1:5f:6f:0e'

# VyOS Proxmox Canary
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping vyos-canary-98 ip-address '192.168.1.240'
set service dhcp-server shared-network-name IOT subnet 192.168.1.0/24 static-mapping vyos-canary-98 mac-address 'DE:CA:FF:98:01:F0'

# GUEST VLAN
set service dhcp-server shared-network-name GUEST authoritative
set service dhcp-server shared-network-name GUEST ping-check
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 default-router '192.168.2.1'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 lease '86400'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 name-server '10.0.5.4'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 range 0 start '192.168.2.208'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 range 0 stop '192.168.2.239'
#
# Guest devices
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping scotte-iphone ip-address '192.168.2.64'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping scotte-iphone mac-address '7c:ec:b1:ab:9a:c2'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping julia-iphone ip-address '192.168.2.65'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping julia-iphone mac-address '74:b5:87:35:3a:b2'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping charles-laptop ip-address '192.168.2.66'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping charles-laptop mac-address '5c:e9:1e:88:6c:e2'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping ben-iphone ip-address '192.168.2.67'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping ben-iphone mac-address '88:20:0d:2f:b0:3e'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping molly-laptop ip-address '192.168.2.68'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping molly-laptop mac-address '74:a6:cd:be:06:c6'

# 192.168.2.67 Ben Laptop
# 192.168.2.68 Molly iPhone
# 192.168.2.69 Molly Laptop

# VyOS Proxmox Canary
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping vyos-canary-99 ip-address '192.168.2.240'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping vyos-canary-99 mac-address 'DE:CA:FF:99:02:F0'
