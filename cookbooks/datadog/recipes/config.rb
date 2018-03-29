ey_cloud_report "datadog" do
 message "DataDog::Custom Config Start"
end

template '/home/deploy/datadog/.datadog-agent/agent/datadog.conf' do
  source 'datadog.conf.erb'
  owner 'deploy'
  group 'deploy'
  mode '640'
  variables({
    :hostname => node[:hostname],
    :role => node['dna']['instance_role'],
    :env_name => node['dna']['environment']['name'],
    :api_key => node.default[:datadog][:api_key],
  })
end

ey_cloud_report "datadog" do
 message "DataDog::Custom Config End"
end
