# LAN
set system static-host-mapping host-name gateway.zinn.tech inet 10.0.0.1
set system static-host-mapping host-name gateway.zinn.tech alias vpn.zinn.tech
set system static-host-mapping host-name zeus.zinn.tech inet 10.0.0.32

# Services
set system static-host-mapping host-name styx.zinn.tech inet 10.0.5.2
set system static-host-mapping host-name gatus.zinn.tech inet 10.0.5.5
set system static-host-mapping host-name onepassword-connect.zinn.tech inet 10.0.5.6
set system static-host-mapping host-name main.zinn.tech inet 10.0.5.10
set system static-host-mapping host-name staging.zinn.tech inet 10.0.5.11

# Servers
set system static-host-mapping host-name ragnar.zinn.tech inet 10.10.0.2
set system static-host-mapping host-name ragnar.zinn.tech alias atlas.zinn.tech
set system static-host-mapping host-name ares.zinn.tech inet 10.10.0.4
