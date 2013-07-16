#
# == Class: mt-daapd
#
# This class installs and configures mt-daapd media server
#
# == Parameters
#
# [*mp3_dir*]
#   Directory with the music files to share
# [*admin_pw*]
#   Administration password for the mt-daapd web administration interface
# [*admin_allow_ipv4_address*]
#   IPv4 address/subnet from which to allow connections to the admin interface. Defaults to 127.0.0.1.
# [*admin_allow_ipv6_address*]
#   IPv6 address/subnet from which to allow connections to the admin interface. Defaults to ::1.
# [*daap_allow_ipv4_address*]
#   IPv4 address/subnet from which to allow connections to the daap share. Defaults to 127.0.0.1.
# [*daap_allow_ipv6_address*]
#   IPv6 address/subnet from which to allow connections to the daap share. Defaults to ::1.
#
# == Examples
#
# class {'mt-daapd':
#   mp3_dir => '/data/music',
#   admin_pw => 'mypassword',
#   daap_allow_ipv4_address => '192.168.50.0/24',
# }
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license
# See file LICENSE for details
#
class mt-daapd(
    $mp3_dir,
    $admin_pw,
    $admin_allow_ipv4_address = '127.0.0.1',
    $admin_allow_ipv6_address = '::1',
    $daap_allow_ipv4_address = '127.0.0.1',
    $daap_allow_ipv6_address = '::1'
)
{

    include mt-daapd::install

    class { 'mt-daapd::config':
        mp3_dir => $mp3_dir,
        admin_pw => $admin_pw,
    }    

    include mt-daapd::service
    include mt-daapd::monit

    class { 'mt-daapd::packetfilter':
        admin_allow_ipv4_address => $admin_allow_ipv4_address,
        admin_allow_ipv6_address => $admin_allow_ipv6_address,
        daap_allow_ipv4_address => $daap_allow_ipv4_address,
        daap_allow_ipv6_address => $daap_allow_ipv6_address,
    }

}
