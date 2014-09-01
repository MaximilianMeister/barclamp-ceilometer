resource = "ceilometer"
main_role = "central"
role_name = "#{resource}-#{main_role}"

unless node["roles"].include?("#{resource}-cagent")
  barclamp_role role_name do
    service_name node[resource][main_role]["service_name"]
    action :remove
  end

  node.delete(resource) unless node["roles"].include?("#{resource}-agent_remove")

  node.save
end
