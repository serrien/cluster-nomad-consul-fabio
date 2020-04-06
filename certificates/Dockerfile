FROM hashicorp/consul-template:alpine

COPY config.hcl /consul-template/config/
COPY external_dns_names.tpl /consul-template/data/
COPY all_kvs.tpl /consul-template/data/

CMD ["-config", "/consul-template/config/config.hcl"]
