#!/bin/vbash

set system host-name 'gateway'
set system domain-name 'zinn.tech'
set system login banner post-login 'Welcome to gateway.zinn.tech'

set system static-host-mapping host-name gateway inet 10.0.0.1

set system ipv6 disable-forwarding

set system login user vyos authentication public-keys scotte2 key 'AAAAC3NzaC1lZDI1NTE5AAAAIN7T92EOEawunpuGClUPZtjl6gLjqz+X2xvLuvmk0UFn'
set system login user vyos authentication public-keys scotte2 type 'ssh-ed25519'

set system name-server '1.1.1.1'

set system sysctl parameter kernel.pty.max value '24000'

set system syslog global facility all level info
set system syslog host 10.11.1.4 facility all level 'info'
set system syslog host 10.11.1.4 format octet-counted
set system syslog host 10.11.1.4 protocol 'tcp'
set system syslog host 10.11.1.4 port '6003'

set system task-scheduler task backup-config crontab-spec '30 2 * * *'
set system task-scheduler task backup-config executable path '/config/scripts/task-config-backup-usb.sh'

set system time-zone 'America/Toronto'
