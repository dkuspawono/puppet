class profile::thumbor(
    $memcached_servers_nutcracker = hiera('thumbor_memcached_servers_nutcracker'),
    $logstash_host = hiera('logstash_host'),
    $logstash_port = hiera('logstash_logback_port'),
    $swift_sharded_containers = hiera_array('swift::proxy::shard_container_list'),
) {

    class { '::thumbor::nutcracker':
        thumbor_memcached_servers => $memcached_servers_nutcracker,
    }

    class { '::thumbor':
        logstash_host => $logstash_host,
        logstash_port => $logstash_port,
    }

    include ::swift::params
    $swift_account_keys = $::swift::params::account_keys

    class { '::thumbor::swift':
        swift_key                => $swift_account_keys['mw_thumbor'],
        swift_sharded_containers => $swift_sharded_containers,
    }

    ferm::service { 'thumbor':
        proto  => 'tcp',
        port   => '8800',
        srange => '$DOMAIN_NETWORKS',
    }

}