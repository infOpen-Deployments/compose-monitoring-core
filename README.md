# Monitoring core

## Description

This service manage all core components of the monitoring stack:
* Prometheus master
* Grafana
* Alertmanager
* Pushgateway
* Chronograf
* InfluxDB
* Blackbox exporter


## Deployment and usage

* [Ansible role](https://gitlab.com/infopen/infrastructure/ansible-roles/ansible-role-monitoring-core)

Expected networks:
* `monitoring_core`: for core components trafic
* `prometheus_servers`: for Prometehus federation
* `services` : used for services to link with Nginx reverse proxy service


## Configuration files to manage

Some configuration files contains customer specific informations and must be managed by Ansible during deployments.

* Alertmanager (targets and sender configuration)
* Prometheus (scrapers & alerting rules)
* `.env`: for push to ftp
* `config/grafana/ldap/ldap.toml`: to add user.ldap password for ldap bind

## Grafana dashboards

* [Docker - Server and containers overview](https://grafana.com/dashboards/395) (395)
* [Docker - Server and containers overview 2](https://grafana.com/dashboards/893) (893)
* [Docker - Server summary](https://grafana.com/dashboards/193) (193)
* [Blackbox - HTTP dashboard](https://grafana.com/dashboards/4859) (4859)
* [Blackbox - HTTP timelines](https://grafana.com/dashboards/4865) (4865)
* [Blackbox - HTTP overview](https://grafana.com/dashboards/5345) (5345)
* [ElasticSearch](https://grafana.com/dashboards/2347) (2747)
* [InfluxDB - Stats 1](https://grafana.com/dashboards/5448) (5448)
* [InfluxDB - Stats 2](https://grafana.com/dashboards/5265) (5265)
* [ElasticSearch](https://grafana.com/dashboards/2347) (2347)
* [Logstash](https://grafana.com/dashboards/2525) (2525)
* [Grafana Internals](https://grafana.com/dashboards/3590) (3590)
* [Mysql - Basic](https://grafana.com/dashboards/6239) (6239)
* [Netdata full dashboard](https://grafana.com/dashboards/3870) (3870)
* [Nginx - VTS stats](https://grafana.com/dashboards/2984) (2984)
* [Node exporter full dashboard](https://grafana.com/dashboards/1860) (1860)
* [PHP-FPM - Basic](https://grafana.com/dashboards/3901) (3901)
* [PHP-FPM - Kubernetes](https://grafana.com/dashboards/4912) (4912)
* [PHP-FPM - Multiple pools](https://grafana.com/dashboards/5714) (5714)
* [PHP-FPM - Simple pool](https://grafana.com/dashboards/5579) (5579)
* [Postgresql](https://grafana.com/dashboards/3742) (3742)
* [Processes](https://grafana.com/dashboards/249) (249)
* [Prometheus - Benchmark](https://grafana.com/dashboards/6725) (6725)
* [Prometheus - Overview](https://grafana.com/dashboards/3662) (3662)
* [Redis - Overview](https://grafana.com/dashboards/2751) (2751)
* [SystemD status](https://grafana.com/dashboards/1617) (1617)
