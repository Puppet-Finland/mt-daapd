#
# == Class mt-daapd::install
#
# Installs mt-daapd package
#
class mt-daapd::install {
    package { 'mt-daapd':
        name => 'mt-daapd',
        ensure => installed,
    }
}
