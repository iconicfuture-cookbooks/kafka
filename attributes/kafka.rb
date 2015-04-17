default[:kafka][:version] = '0.7.2-incubating'
default[:kafka][:mirror] = 'http://archive.apache.org/dist/kafka/old_releases/kafka-{version}/kafka-{version}-src.tgz'
default[:kafka][:md5sum] = "CB2F39BB463AF372A494AFED043A70E2"
default[:kafka][:home] = "/usr/local/kafka"

# Where to store the commitlogs. NOTE: This should be changed
default[:kafka][:data_dir] = "/var/log/kafka"

default[:kafka][:logrotate_freq] = 'daily'
default[:kafka][:logrotate_rotate] = 14

default[:kafka][:zk_servers] = ['localhost:2181']

default[:kafka][:broker_id] = 0
default[:kafka][:num_partitions] = 1
default[:kafka][:hostname] = nil

#default[:kafka][:zk_root] = "kafka"
