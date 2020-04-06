{
  "bind_addr": "BIND_ADDRESS",
  "client_addr": "127.0.0.1",
  "data_dir": "/var/consul",
  "enable_syslog": true,
  "server": false,
  "log_level": "INFO",
  "datacenter": "DATACENTER",
  "retry_join": ["provider=aws tag_key=consul-auto-join tag_value=JOIN_TAG"],
  "rejoin_after_leave": true
}
