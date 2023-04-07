#!/bin/vbash

# Container networks
set container network services prefix '10.0.5.0/24'
set container network services description 'Network for VyOS containers'

# unifi
set container name unifi environment RUNAS_UID0 value 'false'
set container name unifi environment TZ value 'America/Toronto'
set container name unifi environment UNIFI_GID value '999'
set container name unifi environment UNIFI_STDOUT value 'true'
set container name unifi environment UNIFI_UID value '999'
set container name unifi environment CERT_IS_CHAIN value 'true'
set container name unifi image 'ghcr.io/jacobalberty/unifi-docker:v7.3.83'
set container name unifi memory '0'
set container name unifi network services address '10.0.5.2'
set container name unifi restart 'on-failure'
set container name unifi shared-memory '0'
set container name unifi volume data destination '/unifi'
set container name unifi volume data source '/config/containers/unifi'

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

