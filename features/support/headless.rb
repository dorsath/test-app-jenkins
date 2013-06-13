if ENV['BUILD_NUMBER'].present?
  require 'headless'
  require 'selenium-webdriver'
 
  headless = Headless.new
  headless.start
 
  at_exit do
    headless.destroy
  end

  #Capybara.javascript_driver = :selenium

end
