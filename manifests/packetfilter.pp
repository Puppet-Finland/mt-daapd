#
# == Class mt-daapd::packetfilter
#
# Limits access to mt-daapd admin interface and daap share based on IP-address/range
#
class mt-daapd::packetfilter(
    $admin_allow_ipv4_address,
    $admin_allow_ipv6_address,
    $daap_allow_ipv4_address,
    $daap_allow_ipv6_address
)
{

    # IPv4 rules
    firewall { '013 ipv4 accept mt-daapd admin port':
        provider => 'iptables',
        chain => 'INPUT',
        proto => 'tcp',
        port => 3689,
        source => "$admin_allow_ipv4_address",
        action => 'accept',
    }

    firewall { '013 ipv4 accept daap port':
        provider => 'iptables',
        chain => 'INPUT',
        proto => 'udp',
        port => 3689,
        source => "$daap_allow_ipv4_address",
        action => 'accept',
    }

    # IPv6 rules
    firewall { '013 ipv6 accept mt-daapd admin port':
        provider => 'ip6tables',
        chain => 'INPUT',
        proto => 'tcp',
        port => 3689,
        source => "$admin_allow_ipv6_address",
        action => 'accept',
    }

    firewall { '013 ipv6 accept daap port':
        provider => 'ip6tables',
        chain => 'INPUT',
        proto => 'udp',
        port => 3689,
        source => "$daap_allow_ipv6_address",
        action => 'accept',
    }

}
