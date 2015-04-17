name             "kafka"
maintainer       "ehauser@exacttarget.com"
maintainer_email "Eric Hauser"
license          "Apache 2.0"
description      "Installs/Configures kafka"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.2"

depends "java"

recipe "kafka::install", "Install Apache Kafka"
recipe "kafka::config", "Configure Apache Kafka"
recipe "kafka::iptables", "Configure Apache Kafka firewall rules"

%w{ ubuntu debian }.each do |os|
  supports os
end

attribute "kafka/version",
  :display_name => "Kafka version",
  :description => "version of Kafka to install",
  :default => "0.7.2-incubating"

attribute "kafka/mirror",
  :display_name => "Kafka miror",
  :description => "where to get kafka from",
  :default => "http://archive.apache.org/dist/kafka/old_releases/kafka-{version}/kafka-{version}-src.tgz"

attribute "kafka/md5sum",
  :display_name => "Kafka archive checksum",
  :description => "checksum of Kafka archive",
  :default => "CB2F39BB463AF372A494AFED043A70E2"

attribute "kafka/home",
  :display_name => "Kafka home",
  :description => "home of Kafka",
  :default => "/usr/local/kafka"

attribute "kafka/data_dir",
  :display_name => "Kafka data directory",
  :description => "directory of Kafka to install",
  :default => "/var/log/kafka"

attribute "kafka/logrotate_freq",
  :display_name => "Kafka logrotate frequency",
  :description => "frequency torotate Kafka logs",
  :default => "daily"

attribute "kafka/logrotate_rotate",
  :display_name => "Kafka number of rotated logs",
  :description => "number of logs to rotate",
  :default => "14"

attribute "kafka/zk_servers",
  :display_name => "zookeeper server list",
  :description => "zookeeper server list",
  :default => "localhost:2181"

attribute "kafka/broker_id",
  :display_name => "Kafka broker id",
  :description => "Kafka broker id",
  :default => "0"

attribute "kafka/hostname",
  :display_name => "kafka hostname",
  :description => "kafka hostname",
  :default => nil

