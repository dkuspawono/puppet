class profile::openstack::labtest::nova::common(
    $version = hiera('profile::openstack::labtest::version'),
    $nova_controller = hiera('profile::openstack::labtest::nova_controller'),
    $nova_api_host = hiera('profile::openstack::labtest::nova_api_host'),
    $dmz_cidr = hiera('profile::openstack::labtest::nova::dmz_cidr'),
    $dhcp_domain = hiera('profile::openstack::labtest::nova::dhcp_domain'),
    $dhcp_start = hiera('profile::openstack::labtest::nova::dhcp_start'),
    $quota_floating_ips = hiera('profile::openstack::labtest::nova::quota_floating_ips'),
    $network_flat_interface = hiera('profile::openstack::labtest::nova::network_flat_interface'),
    $flat_network_bridge = hiera('profile::openstack::labtest::nova::flat_network_bridge'),
    $fixed_range = hiera('profile::openstack::labtest::nova::fixed_range'),
    $network_public_interface = hiera('profile::openstack::labtest::nova::network_public_interface'),
    $network_public_ip = hiera('profile::openstack::labtest::nova::network_public_ip'),
    $zone = hiera('profile::openstack::labtest::nova::zone'),
    $scheduler_pool = hiera('profile::openstack::labtest::nova::scheduler_pool'),
    $db_pass = hiera('profile::openstack::labtest::nova::db_pass'),
    $db_host = hiera('profile::openstack::labtest::nova::db_host'),
    $ldap_user_pass = hiera('profile::openstack::labtest::ldap_user_pass'),
    $live_migration_uri = hiera('profile::openstack::labtest::nova::live_migration_uri'),
    $rabbit_pass = hiera('profile::openstack::labtest::nova::rabbit_pass'),
    $spice_hostname = hiera('profile::openstack::labtest::spice_hostname'),
    ) {

    require ::profile::openstack::labtest::cloudrepo
    class {'::profile::openstack::base::nova::common':
        version                  => $version,
        nova_controller          => $nova_controller,
        nova_api_host            => $nova_api_host,
        dmz_cidr                 => $dmz_cidr,
        dhcp_domain              => $dhcp_domain,
        quota_floating_ips       => $quota_floating_ips,
        dhcp_start               => $dhcp_start,
        network_flat_interface   => $network_flat_interface,
        flat_network_bridge      => $flat_network_bridge,
        fixed_range              => $fixed_range,
        network_public_interface => $network_public_interface,
        network_public_ip        => $network_public_ip,
        zone                     => $zone,
        scheduler_pool           => $scheduler_pool,
        db_pass                  => $db_pass,
        db_host                  => $db_host,
        ldap_user_pass           => $ldap_user_pass,
        live_migration_uri       => $live_migration_uri,
        rabbit_pass              => $rabbit_pass,
        spice_hostname           => $spice_hostname,
    }
    contain '::profile::openstack::base::nova::common'
}
