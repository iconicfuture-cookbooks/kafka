#
# Cookbook Name:: kafka
# Recipe:: default
#
# Copyright 2013, Iconicfuture GmbH
#
# All rights reserved - Do Not Redistribute
#

kafka_home = node[:kafka][:home]

group "kafka" do
  gid 3320
  action :create
end

user "kafka" do
  uid 3320
  gid 3320
  home node[:kafka][:home]
  shell "/bin/bash"
  action :create
end

directory kafka_home do 
  user "kafka"
  group "kafka"
  action :create
end

version = node[:kafka][:version]
url = node[:kafka][:mirror].gsub("{version}", version)

remote_file "#{kafka_home}/kafka-#{version}-src.tgz" do
  source url
  mode "0644"
  #checksum node[:kafka][:sha256sum]
end

execute "Untar Kafka" do
  command "tar -zxf #{kafka_home}/kafka-#{version}-src.tgz -C #{kafka_home}/"
  user "kafka"
  action :run
  creates "#{kafka_home}/kafka-#{version}"
end

bash "sbt update" do
  code <<EOH
export PATH=$PATH:/usr/lib/jvm/default-java/bin/
/bin/bash sbt update
EOH
  action :run
  user "kafka"
  cwd "#{kafka_home}/kafka-#{version}-src"
  creates "#{kafka_home}/kafka-#{version}-src/lib_managed"
end

bash "sbt package" do
  code <<EOH
export PATH=$PATH:/usr/lib/jvm/default-java/bin/
/bin/bash sbt package
EOH
  action :run
  user "kafka"
  cwd "#{kafka_home}/kafka-#{version}-src"
  creates "#{kafka_home}/kafka-#{version}-src/perf/target"
end

directory "/var/log/kafka" do
  mode "0755"
  action :create
end