#
# == Class mt-daapd::monit
#
# Setup local monitoring for mt-daapd using monit
#
class mt-daapd::monit {

    monit::fragment { 'mt-daapd-mt-daapd.monit':
        modulename => 'mt-daapd',
    }
}
