resource = "ceilometer"
main_role = "agent"
role_name = "#{resource}-#{main_role}"

unless node['roles'].include?(role_name)
  barclamp_role role_name do
    service_name node[resource][main_role]["service_name"]
    action :remove
  end

  node.delete(resource)

  node.save
end
