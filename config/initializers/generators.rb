Rails.application.config.generators do |g|
  g.test_framework = :rspec
  g.helper_specs false
  g.view_specs false
  g.controller_specs false
  g.routing_specs false
  g.helper false
  g.stylesheets false
  g.fixture false
end
