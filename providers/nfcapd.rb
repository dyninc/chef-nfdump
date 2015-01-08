action :enable do
  runit_service "nfcapd-#{new_resource.name}" do
    default_logger true
    run_template_name 'generic'
    options name: new_resource.name,
      port: new_resource.port,
      datadir: new_resource.datadir
  end
end

action :disable do
  runit_service "nfcapd-#{new_resource.name}" do
    action :disable
  end
end

action :start do
  runit_service "nfcapd-#{new_resource.name}" do
    action :start
  end
end

action :stop do
  runit_service "nfcapd-#{new_resource.name}" do
    action :stop
  end
end

action :restart do
  runit_service "nfcapd-#{new_resource.name}" do
    action :restart
  end
end
