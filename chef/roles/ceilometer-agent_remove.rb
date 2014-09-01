name "ceilometer-agent_remove"
description "Deactivate Ceilometer Agent Role"
run_list(
  "recipe[ceilometer::remove_agent]"
)
default_attributes()
override_attributes()
