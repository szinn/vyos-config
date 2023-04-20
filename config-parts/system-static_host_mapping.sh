# Gateway and Services
set system static-host-mapping host-name gateway.zinn.tech inet 10.0.0.1
set system static-host-mapping host-name gateway.zinn.tech alias vpn.zinn.ca
set system static-host-mapping host-name styx.zinn.tech inet 10.0.5.2
set system static-host-mapping host-name styx.zinn.tech alias styx.zinn.ca
set system static-host-mapping host-name gatus.zinn.tech inet 10.0.5.5
set system static-host-mapping host-name onepassword-connect.zinn.tech inet 10.0.5.6

# Unifi UNVR
set system static-host-mapping host-name zeus.zinn.tech inet 10.0.0.32
set system static-host-mapping host-name zeus.zinn.tech alias zeus.zinn.ca

# Servers
set system static-host-mapping host-name ragnar.zinn.tech inet 10.10.0.2
set system static-host-mapping host-name ragnar.zinn.tech alias atlas.zinn.tech
set system static-host-mapping host-name ares.zinn.tech inet 10.10.0.4
set system static-host-mapping host-name ares.zinn.tech alias ares.zinn.ca
set system static-host-mapping host-name pikvm.zinn.tech inet 10.10.0.5
set system static-host-mapping host-name pikvm.zinn.tech alias pikvm.zinn.ca

# k8s Clusters
set system static-host-mapping host-name main.zinn.tech inet 10.0.5.10
set system static-host-mapping host-name staging.zinn.tech inet 10.0.5.11
