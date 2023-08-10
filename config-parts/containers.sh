#!/bin/vbash
# shellcheck disable=all

# Container networks
set container network services description 'Network for VyOS containers'
set container network services prefix '10.0.5.0/24'

# unifi
set container name unifi environment TZ value 'America/Toronto'
set container name unifi environment UNIFI_GID value '999'
set container name unifi environment UNIFI_STDOUT value 'true'
set container name unifi environment UNIFI_UID value '999'
set container name unifi environment CERT_IS_CHAIN value 'true'
set container name unifi image 'ghcr.io/jacobalberty/unifi-docker:v7.4.162'
set container name unifi memory '0'
set container name unifi network services address '10.0.5.2'
set container name unifi restart 'on-failure'
set container name unifi shared-memory '0'
set container name unifi volume data source '/config/containers/unifi'
set container name unifi volume data destination '/unifi'
set container name unifi volume data mode 'rw'

# bind
set container name bind cap-add 'net-bind-service'
set container name bind image 'docker.io/internetsystemsconsortium/bind9:9.19'
set container name bind command '/usr/sbin/named -4 -f -c /etc/bind/named.conf -u bind'
set container name bind memory '0'
set container name bind network services address '10.0.5.3'
set container name bind restart 'on-failure'
set container name bind shared-memory '0'
set container name bind volume config source '/config/containers/bind/config'
set container name bind volume config destination '/etc/bind'
set container name bind volume config mode 'ro'
set container name bind volume cache source '/tmp/bind/cache'
set container name bind volume cache destination '/var/cache/bind'
set container name bind volume cache mode 'rw'

# dnsdist
set container name dnsdist cap-add 'net-bind-service'
set container name dnsdist environment TZ value 'Europe/Amsterdam'
set container name dnsdist image 'docker.io/powerdns/dnsdist-18:1.8.0'
set container name dnsdist arguments '--log-timestamps'
set container name dnsdist memory '0'
set container name dnsdist network services address '10.0.5.4'
set container name dnsdist restart 'on-failure'
set container name dnsdist shared-memory '0'
set container name dnsdist volume config source '/config/containers/dnsdist/config/dnsdist.conf'
set container name dnsdist volume config destination '/etc/dnsdist/dnsdist.conf'
set container name dnsdist volume config mode 'ro'

# gatus
set container name gatus cap-add 'net-bind-service'
set container name gatus cap-add 'net-raw'
set container name gatus environment DISCORD_WEBHOOK_URL value ${DISCORD_WEBHOOK_URL}
set container name gatus image 'ghcr.io/twin/gatus:v5.5.1'
set container name gatus memory '0'
set container name gatus network services address '10.0.5.5'
set container name gatus shared-memory '0'
set container name gatus volume gatus-config source '/config/containers/gatus/config/config.yaml'
set container name gatus volume gatus-config destination '/config/config.yaml'
set container name gatus volume gatus-config mode 'ro'
set container name gatus volume gatus-certificate-crt source '/config/secrets/certificate.crt'
set container name gatus volume gatus-certificate-crt destination '/config/certificate.crt'
set container name gatus volume gatus-certificate-crt mode 'ro'
set container name gatus volume gatus-certificate-key source '/config/secrets/certificate.key'
set container name gatus volume gatus-certificate-key destination '/config/certificate.key'
set container name gatus volume gatus-certificate-key mode 'ro'

# onepassword-connect
set container name onepassword-connect image 'docker.io/1password/connect-api:1.7.1'
set container name onepassword-connect environment OP_HTTP_PORT value '8438'
set container name onepassword-connect memory '0'
set container name onepassword-connect network services address '10.0.5.6'
set container name onepassword-connect shared-memory '0'
set container name onepassword-connect volume credentials source '/config/secrets/1password-credentials.json'
set container name onepassword-connect volume credentials destination '/home/opuser/.op/1password-credentials.json'
set container name onepassword-connect volume credentials mode 'ro'
set container name onepassword-connect volume data source '/tmp/onepassword/data'
set container name onepassword-connect volume data destination '/home/opuser/.op/data'
set container name onepassword-connect volume data mode 'rw'

# onepassword-sync
set container name onepassword-sync image 'docker.io/1password/connect-sync:1.7.1'
set container name onepassword-sync memory '0'
set container name onepassword-sync shared-memory '0'
set container name onepassword-sync network services address '10.0.5.7'
set container name onepassword-sync volume credentials source '/config/secrets/1password-credentials.json'
set container name onepassword-sync volume credentials destination '/home/opuser/.op/1password-credentials.json'
set container name onepassword-sync volume credentials mode 'ro'
set container name onepassword-sync volume data source '/tmp/onepassword/data'
set container name onepassword-sync volume data destination '/home/opuser/.op/data'
set container name onepassword-sync volume data mode 'rw'

# pihole/unbound
set container name pihole description 'Pi-hole'
set container name pihole image 'ghcr.io/szinn/pihole-unbound:2023.05.2'
set container name pihole memory '0'
set container name pihole network services address '10.0.5.8'
set container name pihole shared-memory '0'
set container name pihole restart 'on-failure'
set container name pihole environment TZ value 'America/Toronto'
set container name pihole environment HOSTNAME value 'pihole'
set container name pihole environment PIHOLE_DOMAIN value 'zinn.tech'
set container name pihole environment WEBPASSWORD value "${SECRET_PIHOLE_WEBPASSWORD}"
set container name pihole environment WEBTHEME value 'default-auto'
set container name pihole environment DNSSEC value 'true'
set container name pihole environment DNS_BOGUS_PRIV value 'true'
set container name pihole environment DNS_FQDN_REQUIRED value 'true'
set container name pihole environment DNSMASQ_LISTENING value 'single'
set container name pihole environment FTLCONF_LOCAL_IPV4 value '10.0.5.8'
set container name pihole environment REV_SERVER value 'true'
set container name pihole environment REV_SERVER_DOMAIN value 'zinn.tech'
set container name pihole environment REV_SERVER_TARGET value '10.0.5.3'
set container name pihole environment REV_SERVER_CIDR value '10.0.0.0/8'
set container name pihole environment PIHOLE_DNS_ value '127.0.0.1#5335'
set container name pihole volume pihole source '/config/containers/pihole/pihole'
set container name pihole volume pihole destination '/etc/pihole'
set container name pihole volume pihole mode 'rw'
set container name pihole volume dnsmasq source '/config/containers/pihole/dnsmasq'
set container name pihole volume dnsmasq destination '/etc/dnsmasq.d'
set container name pihole volume dnsmasq mode 'rw'
set container name pihole volume pihole-ssl source '/config/containers/pihole/10-pihole-ssl.conf'
set container name pihole volume pihole-ssl destination '/etc/lighttpd/conf-enabled/10-pihole-ssl.conf'
set container name pihole volume pihole-ssl mode 'rw'
set container name pihole volume certificate-pem source '/config/secrets/certificate.pem'
set container name pihole volume certificate-pem destination '/etc/lighttpd/certs/pihole.pem'
set container name pihole volume certificate-pem mode 'ro'

# haproxy - main cluster
set container name main-k8s-api image 'docker.io/library/haproxy:2.8.2'
set container name main-k8s-api memory '0'
set container name main-k8s-api network services address '10.0.5.10'
set container name main-k8s-api restart 'on-failure'
set container name main-k8s-api shared-memory '0'
set container name main-k8s-api volume config source '/config/containers/main-k8s/config/haproxy.cfg'
set container name main-k8s-api volume config destination '/usr/local/etc/haproxy/haproxy.cfg'
set container name main-k8s-api volume config mode 'ro'

# haproxy - staging cluster
set container name staging-k8s-api image 'docker.io/library/haproxy:2.8.2'
set container name staging-k8s-api memory '0'
set container name staging-k8s-api network services address '10.0.5.11'
set container name staging-k8s-api restart 'on-failure'
set container name staging-k8s-api shared-memory '0'
set container name staging-k8s-api volume config source '/config/containers/staging-k8s/config/haproxy.cfg'
set container name staging-k8s-api volume config destination '/usr/local/etc/haproxy/haproxy.cfg'
set container name staging-k8s-api volume config mode 'ro'

# udp-broadcast-relay-mdns
set container name udp-broadcast-relay-mdns allow-host-networks
set container name udp-broadcast-relay-mdns cap-add 'net-raw'
set container name udp-broadcast-relay-mdns environment CFG_DEV value 'bond0.20;bond0.98;bond0.99'
set container name udp-broadcast-relay-mdns environment CFG_ID value '2'
set container name udp-broadcast-relay-mdns environment CFG_MULTICAST value '224.0.0.251'
set container name udp-broadcast-relay-mdns environment CFG_PORT value '5353'
set container name udp-broadcast-relay-mdns environment SEPARATOR value ';'
set container name udp-broadcast-relay-mdns image 'ghcr.io/onedr0p/udp-broadcast-relay-redux:1.0.27'
set container name udp-broadcast-relay-mdns memory '0'
set container name udp-broadcast-relay-mdns restart 'on-failure'
set container name udp-broadcast-relay-mdns shared-memory '0'

# udp-broadcast-relay-sonos
set container name udp-broadcast-relay-sonos allow-host-networks
set container name udp-broadcast-relay-sonos cap-add 'net-raw'
set container name udp-broadcast-relay-sonos environment CFG_DEV value 'bond0.20;bond0.98;bond0.99'
set container name udp-broadcast-relay-sonos environment CFG_ID value '1'
set container name udp-broadcast-relay-sonos environment CFG_MULTICAST value '239.255.255.250'
set container name udp-broadcast-relay-sonos environment CFG_PORT value '1900'
set container name udp-broadcast-relay-sonos environment SEPARATOR value ';'
set container name udp-broadcast-relay-sonos image 'ghcr.io/onedr0p/udp-broadcast-relay-redux:1.0.27'
set container name udp-broadcast-relay-sonos memory '0'
set container name udp-broadcast-relay-sonos restart 'on-failure'
set container name udp-broadcast-relay-sonos shared-memory '0'

# speedtest-exporter
set container name speedtest-exporter image 'ghcr.io/miguelndecarvalho/speedtest-exporter:v3.5.4'
set container name speedtest-exporter memory '0'
set container name speedtest-exporter allow-host-networks
set container name speedtest-exporter restart 'on-failure'
set container name speedtest-exporter shared-memory '0'

# cloudflare-ddns
set container name cloudflare-ddns allow-host-networks
set container name cloudflare-ddns environment CF_API_TOKEN value "${SECRET_CLOUDFLARE_API_TOKEN}"
set container name cloudflare-ddns environment DOMAINS value 'zinn.tech,vpn.zinn.tech'
set container name cloudflare-ddns environment IP6_PROVIDER value "none"
set container name cloudflare-ddns environment TZ value 'America/Toronto'
set container name cloudflare-ddns environment PGID value "1000"
set container name cloudflare-ddns environment PUID value "1000"
set container name cloudflare-ddns image 'docker.io/favonia/cloudflare-ddns:1.9.4'
set container name cloudflare-ddns memory '0'
set container name cloudflare-ddns restart 'on-failure'
set container name cloudflare-ddns shared-memory '0'

# node exporter
set container name node-exporter allow-host-networks
set container name node-exporter environment procfs value '/host/proc'
set container name node-exporter environment rootfs value '/rootfs'
set container name node-exporter environment sysfs value '/host/sys'
set container name node-exporter image 'quay.io/prometheus/node-exporter:v1.6.1'
set container name node-exporter memory '0'
set container name node-exporter shared-memory '0'
set container name node-exporter volume node-exporter-procfs source '/proc'
set container name node-exporter volume node-exporter-procfs destination '/host/proc'
set container name node-exporter volume node-exporter-procfs mode 'ro'
set container name node-exporter volume node-exporter-rootfs source '/'
set container name node-exporter volume node-exporter-rootfs destination '/rootfs'
set container name node-exporter volume node-exporter-rootfs mode 'ro'
set container name node-exporter volume node-exporter-sysfs source '/sys'
set container name node-exporter volume node-exporter-sysfs destination '/host/sys'
set container name node-exporter volume node-exporter-sysfs mode 'ro'

# vnstat
set container name vnstat allow-host-networks
set container name vnstat environment EXCLUDE_PATTERN value '^docker|^veth|^br-|^lxc|eth[0123]'
set container name vnstat environment TZ value 'America/New_York'
set container name vnstat image 'ghcr.io/vergoh/vnstat:2.10'
set container name vnstat memory '0'
set container name vnstat shared-memory '0'
set container name vnstat volume vnstat-data source '/config/containers/vnstat'
set container name vnstat volume vnstat-data destination '/var/lib/vnstat'
set container name vnstat volume vnstat-data mode 'rw'
