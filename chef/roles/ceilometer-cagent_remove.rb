name "ceilometer-cagent_remove"
description "Deactivate Ceilometer Central Agent Role"
run_list(
  "recipe[ceilometer::remove_central]"
)
default_attributes()
override_attributes()
