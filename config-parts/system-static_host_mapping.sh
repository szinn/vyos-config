# External Services
# set system static-host-mapping host-name ghs.google.com alias calendar.zinn.ca
# set system static-host-mapping host-name ghs.google.com alias docs.zinn.ca
# set system static-host-mapping host-name ghs.google.com alias mail.zinn.ca

# Gateway
set system static-host-mapping host-name gateway.zinn.tech inet 10.0.0.1
set system static-host-mapping host-name gateway.zinn.tech alias vpn.zinn.ca

# Unifi controller and UNVR
set system static-host-mapping host-name styx.zinn.tech inet 10.0.5.2
set system static-host-mapping host-name styx.zinn.tech alias styx.zinn.ca
set system static-host-mapping host-name zeus.zinn.tech inet 10.0.0.32
set system static-host-mapping host-name zeus.zinn.tech alias zeus.zinn.ca

# Servers
set system static-host-mapping host-name ragnar.zinn.tech inet 10.10.0.2
set system static-host-mapping host-name ragnar.zinn.tech alias atlas.zinn.tech
set system static-host-mapping host-name ragnar.zinn.tech alias onepassword-connect.zinn.tech
set system static-host-mapping host-name hades.zinn.tech inet 10.10.0.3
set system static-host-mapping host-name ares.zinn.tech inet 10.10.0.4
set system static-host-mapping host-name ares.zinn.tech alias ares.zinn.ca
set system static-host-mapping host-name pikvm.zinn.tech inet 10.10.0.5
set system static-host-mapping host-name pikvm.zinn.tech alias pikvm.zinn.ca
set system static-host-mapping host-name pihole.zinn.tech inet 10.10.0.6

# Trusted
set system static-host-mapping host-name odin.zinn.tech inet 10.20.0.19
set system static-host-mapping host-name odin-wifi.zinn.tech inet 10.20.0.20

# k8s Main Cluster
set system static-host-mapping host-name main.zinn.tech inet 10.0.5.10
set system static-host-mapping host-name k8s-1.zinn.tech inet 10.10.0.16
set system static-host-mapping host-name k8s-2.zinn.tech inet 10.10.0.17
set system static-host-mapping host-name k8s-3.zinn.tech inet 10.10.0.18
set system static-host-mapping host-name k8s-4.zinn.tech inet 10.10.0.19
set system static-host-mapping host-name k8s-5.zinn.tech inet 10.10.0.20
set system static-host-mapping host-name k8s-6.zinn.tech inet 10.10.0.21

# k8s Staging Cluster
set system static-host-mapping host-name staging.zinn.tech inet 10.0.5.11
set system static-host-mapping host-name stage-1.zinn.tech inet 10.10.0.24
set system static-host-mapping host-name stage-2.zinn.tech inet 10.10.0.25
set system static-host-mapping host-name stage-3.zinn.tech inet 10.10.0.26
set system static-host-mapping host-name stage-4.zinn.tech inet 10.10.0.27
set system static-host-mapping host-name stage-5.zinn.tech inet 10.10.0.28
set system static-host-mapping host-name stage-6.zinn.tech inet 10.10.0.29

# Other devices
set system static-host-mapping host-name kvm.zinn.tech inet 192.168.1.10
set system static-host-mapping host-name octo.zinn.tech inet 192.168.1.48
set system static-host-mapping host-name hottub.zinn.tech inet 192.168.1.50
