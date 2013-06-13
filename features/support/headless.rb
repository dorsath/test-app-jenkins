if ENV['BUILD_NUMBER'].present?
  require 'headless'
 
  headless = Headless.new
  headless.start
 
  at_exit do
    headless.destroy
  end
end
