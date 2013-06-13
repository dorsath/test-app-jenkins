if ENV['BUILD_NUMBER'].present?
  require 'headless'
 
  headless = Headless.new(:display => SERVER_PORT)
  headless.start
 
  at_exit do
    headless.destroy
  end
end
