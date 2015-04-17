version = node[:kafka][:version]
kafka_home = node[:kafka][:home]

# Create a kafka upstart config file
template "/etc/init/kafka.conf" do
  source "kafka-upstart.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  variables({ :java_home => "#{node['java']['java_home']}/jre",
              :kafka_dir => "#{kafka_home}/kafka-#{version}-src"
            })
end

template "/etc/init.d/kafka" do
  source "kafka.init.erb"
  owner "root"
  group "root"
  mode "0755"
  variables({ :java_home => "#{node['java']['java_home']}/jre",
              :kafka_dir => "#{kafka_home}/kafka-#{version}-src"
            })
end

# Create a zookeeper upstart config file
template "/etc/init/zookeeper.conf" do
  source "zookeeper-upstart.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  variables({ :java_home => "#{node['java']['java_home']}/jre",
              :kafka_dir => "#{kafka_home}/kafka-#{version}-src"
            })
end

template "/etc/init.d/zookeeper" do
  source "zookeeper.init.erb"
  owner "root"
  group "root"
  mode "0755"
  variables({ :java_home => "#{node['java']['java_home']}/jre",
              :kafka_dir => "#{kafka_home}/kafka-#{version}-src"
            })
end

# Register
service 'zookeeper' do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
end

# Register
service 'kafka' do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
end