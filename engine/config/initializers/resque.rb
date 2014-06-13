require 'resque/server'

rails_root = Rails.root || File.dirname(__FILE__) + '/../..'
rails_env = Rails.env || 'development'

# resque_config = YAML.load_file(File.dirname(__FILE__) + '../resque.yml')
Resque.redis = resque_config[rails_env]