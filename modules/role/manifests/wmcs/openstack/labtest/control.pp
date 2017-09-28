class role::wmcs::openstack::labtest::control {
    include ::profile::openstack::labtest::observerenv
    include ::profile::openstack::labtest::rabbitmq
    include ::profile::openstack::labtest::keystone::service
    include ::profile::openstack::labtest::glance
    include ::profile::openstack::labtest::nova::common
    include ::profile::openstack::labtest::nova::conductor::service
    include ::profile::openstack::labtest::nova::scheduler::service
}
