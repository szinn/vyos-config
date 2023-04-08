#!/bin/vbash

# Container networks
set container network services prefix '10.0.5.0/24'
set container network services description 'Network for VyOS containers'

# unifi
set container name unifi environment TZ value 'America/Toronto'
set container name unifi image 'ghcr.io/goofball222/unifi:7.4-beta'
set container name unifi memory '0'
set container name unifi network services address '10.0.5.2'
set container name unifi restart 'on-failure'
set container name unifi shared-memory '0'
set container name unifi volume unifi-cert destination '/usr/lib/unifi/cert'
set container name unifi volume unifi-cert mode 'rw'
set container name unifi volume unifi-cert source '/config/containers/unifi/cert'
set container name unifi volume unifi-data destination '/usr/lib/unifi/data'
set container name unifi volume unifi-data mode 'rw'
set container name unifi volume unifi-data source '/config/containers/unifi/data'
set container name unifi volume unifi-logs destination '/usr/lib/unifi/logs'
set container name unifi volume unifi-logs mode 'rw'
set container name unifi volume unifi-logs source '/config/containers/unifi/logs'

# coredns
set container name coredns cap-add 'net-bind-service'
set container name coredns image 'docker.io/coredns/coredns:1.10.1'
set container name coredns memory '0'
set container name coredns network services address '10.0.5.3'
set container name coredns restart 'on-failure'
set container name coredns shared-memory '0'
set container name coredns volume config destination '/config'
set container name coredns volume config source '/config/containers/coredns/config'
set container name coredns volume config mode 'ro'
set container name coredns volume corefile destination '/Corefile'
set container name coredns volume corefile source '/config/containers/coredns/config/Corefile'
set container name coredns volume corefile mode 'ro'
set container name coredns volume vyoshosts destination '/host/etc/hosts'
set container name coredns volume vyoshosts source '/etc/hosts'
set container name coredns volume vyoshosts mode 'ro'

# dnsdist
set container name dnsdist cap-add 'net-bind-service'
set container name dnsdist environment TZ value 'Europe/Amsterdam'
set container name dnsdist image 'docker.io/powerdns/dnsdist-17:1.7.3'
set container name dnsdist memory '0'
set container name dnsdist network services address '10.0.5.4'
set container name dnsdist restart 'on-failure'
set container name dnsdist shared-memory '0'
set container name dnsdist volume config destination '/etc/dnsdist/dnsdist.conf'
set container name dnsdist volume config source '/config/containers/dnsdist/config/dnsdist.conf'
set container name dnsdist volume config mode 'ro'

# haproxy - main cluster
set container name main-k8s-api image 'docker.io/library/haproxy:2.7.6'
set container name main-k8s-api memory '0'
set container name main-k8s-api network services address '10.0.5.10'
set container name main-k8s-api restart 'on-failure'
set container name main-k8s-api shared-memory '0'
set container name main-k8s-api volume config destination '/usr/local/etc/haproxy/haproxy.cfg'
set container name main-k8s-api volume config source '/config/containers/main-k8s/config/haproxy.cfg'
set container name main-k8s-api volume config mode 'ro'

# haproxy - staging cluster
set container name staging-k8s-api image 'docker.io/library/haproxy:2.7.6'
set container name staging-k8s-api memory '0'
set container name staging-k8s-api network services address '10.0.5.11'
set container name staging-k8s-api restart 'on-failure'
set container name staging-k8s-api shared-memory '0'
set container name staging-k8s-api volume config destination '/usr/local/etc/haproxy/haproxy.cfg'
set container name staging-k8s-api volume config source '/config/containers/staging-k8s/config/haproxy.cfg'
set container name staging-k8s-api volume config mode 'ro'

# udp-broadcast-relay-mdns
set container name udp-broadcast-relay-mdns allow-host-networks
set container name udp-broadcast-relay-mdns cap-add 'net-raw'
set container name udp-broadcast-relay-mdns environment CFG_DEV value 'eth0;eth0.20;eth0.98'
set container name udp-broadcast-relay-mdns environment CFG_ID value '2'
set container name udp-broadcast-relay-mdns environment CFG_MULTICAST value '224.0.0.251'
set container name udp-broadcast-relay-mdns environment CFG_PORT value '5353'
set container name udp-broadcast-relay-mdns environment SEPARATOR value ';'
set container name udp-broadcast-relay-mdns image 'ghcr.io/onedr0p/udp-broadcast-relay-redux:1.0.27'
set container name udp-broadcast-relay-mdns memory '0'
set container name udp-broadcast-relay-mdns restart 'on-failure'
set container name udp-broadcast-relay-mdns shared-memory '0'

# speedtest-exporter
set container name speedtest-exporter image 'ghcr.io/miguelndecarvalho/speedtest-exporter:v3.5.3'
set container name speedtest-exporter memory '0'
set container name speedtest-exporter allow-host-networks
set container name speedtest-exporter restart 'on-failure'
set container name speedtest-exporter shared-memory '0'
