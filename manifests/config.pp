#
# == Class mt-daapd::config
#
# Configures mt-daapd media server
#
class mt-daapd::config(
    $mp3_dir,
    $admin_pw
)
{

    file { 'mt-daapd-mt-daapd.conf':
        name => '/etc/mt-daapd.conf',
        content => template('mt-daapd/mt-daapd.conf.erb'),
        ensure => present,
        owner => root,
        group => root,
        require => Class['mt-daapd::install'],
        notify => Class['mt-daapd::service'],
    }
}
