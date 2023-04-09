#!/bin/vbash
#
# Description: Updates network-groups 'cloudflare-networks-v4' and 'cloudflare-networks-v6' with the Cloudflare Networks
#
source /opt/vyatta/etc/functions/script-template
if [ "$(id -g -n)" != 'vyattacfg' ] ; then
    exec sg vyattacfg -c "/bin/vbash $(readlink -f $0) $@"
fi

configure

# Delete all related config
delete firewall group network-group cloudflare-networks-ipv4
# delete firewall group ipv6-network-group cloudflare-networks-v6
delete system task-scheduler task $(basename $(realpath "$0") .sh)

# Set network-group for ipv4
set firewall group network-group cloudflare-networks-ipv4 description 'Task Managed: Cloudflare IPv4 Networks'
for network in $(curl -fsSL https://www.cloudflare.com/ips-v4); do
    set firewall group network-group cloudflare-networks-ipv4 network $network
done

# Set network-group for ipv6
# set firewall group ipv6-network-group cloudflare-networks-v6 description 'Task Managed: Cloudflare IPv6 Networks'
# for network in $(curl -fsSL https://www.cloudflare.com/ips-v6); do
#     set firewall group ipv6-network-group cloudflare-networks-v6 network $network
# done

# Set task
set system task-scheduler task $(basename $(realpath "$0") .sh) interval 6h
set system task-scheduler task $(basename $(realpath "$0") .sh) executable path $(realpath "$0")

commit
exit
