source 'https://rubygems.org'


group :development do 
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring',        group: :development
  gem 'quiet_assets', :group => :development
end


Dir.glob(File.join(File.dirname(__FILE__), 'engine', "Gemfile")) do |gemfile|
  eval(IO.read(gemfile), binding)
end
