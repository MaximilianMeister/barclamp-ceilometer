name "ceilometer-server_remove"
description "Deactivate Ceilometer Server Role"
run_list(
  "recipe[ceilometer::remove_server]"
)
default_attributes()
override_attributes()
