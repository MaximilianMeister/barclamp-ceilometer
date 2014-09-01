resource = "ceilometer"
main_role = "server"
role_name = "#{resource}-#{main_role}"

unless node["roles"].include?(role_name)
  ceilometer_server_service = []
  ["api", "collector"].each do |service|
    ceilometer_server_service << node[resource][service]["service_name"]
  end

  barclamp_role role_name do
    service_name ceilometer_server_service
    action :remove
  end

  node.delete(resource) unless node["roles"].include?("#{resource}-cagent_remove") || \
                                 node["roles"].include?("#{resource}-agent_remove")

  node.save
end
