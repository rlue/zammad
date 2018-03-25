#!/bin/bash

bundle exec rubocop
rake db:create
rake db:migrate
rake db:seed
rake test:units
rake test:controllers
ruby -I test/ test/integration/object_manager_test.rb
ruby -I test/ test/integration/package_test.rb
rake assets:precompile
rake db:drop
rake db:create
rake db:migrate
rake db:seed
ruby -I test/ test/integration/auto_wizard_test.rb
rake db:drop
rake db:create
rake db:migrate
rake db:seed
ruby -I test/ test/integration/geo_location_test.rb
ruby -I test/ test/integration/geo_calendar_test.rb
ruby -I test/ test/integration/user_agent_test.rb
ruby -I test/ test/integration/user_device_controller_test.rb
ruby -I test/ test/integration/sipgate_controller_test.rb
rake db:drop
