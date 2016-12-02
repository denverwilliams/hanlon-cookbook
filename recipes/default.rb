#
# Cookbook Name:: hanlon
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
docker_installation 'default' do
  repo 'test'
  action :create
end

docker_service_manager 'default' do
  action :start
end

docker_image 'iidlx/hanlon' do
  tag 'latest'
  action :pull
  notifies :redeploy, 'docker_container[hanlon]'
end

docker_container 'hanlon' do
  repo 'iidlx/hanlon'
  tag 'latest'
  env 'DOCKER_HOST=192.168.1.185'
  env 'HANLON_SUBNETS=172.17.0.0/16,192.168.1.0/24'
  env 'IPMI_HOST_infra0=192.168.1.200'
  env 'IPMI_HOST_infra1=192.168.1.201'
  env 'IPMI_HOST_infra2=192.168.1.202'
  env 'IPMI_HOSTS=infra0 infra1 infra2'
  env 'IPMI_PASS=P@ssw0rd'
  env 'IPMI_PASS_infra0=P@ssw0rd'
  env 'IPMI_PASS_infra1=P@ssw0rd'
  env 'IPMI_PASS_infra2=P@ssw0rd'
  env 'IPMI_PASSWD=P@ssw0rd'
  env 'IPMI_USER=admin'
  env 'IPMI_USER_infra0=admin'
  env 'IPMI_USER_infra1=admin'
  env 'IPMI_USER_infra2=admin'
  env 'PERSIST_MODE=@json'
  network_mode 'host'
  action :run
end
