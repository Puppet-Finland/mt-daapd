#
# == Class mt-daapd::service
#
# Enable mt-daapd service
#
class mt-daapd::service {

    service { 'service-mt-daapd':
        name => 'mt-daapd',
        enable => true,
        require => Class['mt-daapd::config'],
    }
}
