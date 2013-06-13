ENV['RAILS_ENV'] = 'test'
# require 'simplecov'
# SimpleCov.start 'rails'

require './config/environment'

require 'minitest/spec'
require 'database_cleaner'
require 'rspec'

Rails.logger.level = 4
#Devise.stretches = 1

DatabaseCleaner.strategy = :truncation

DEFERRED_GC_THRESHOLD = (ENV['DEFER_GC'] || 1.0).to_f

@@last_gc_run = Time.now


Spinach.hooks.before_run do
  GC.disable if DEFERRED_GC_THRESHOLD > 0
  DatabaseCleaner.clean_with(:truncation)
end

Spinach.hooks.after_scenario do
  DatabaseCleaner.clean
  @@reserved_ivars = %w(@loaded_fixtures @test_passed @method_name @_assertion_wrapped @_result)

  (instance_variables - @@reserved_ivars).each do |ivar|
    instance_variable_set(ivar, nil)
  end

  if DEFERRED_GC_THRESHOLD > 0 && Time.now - @@last_gc_run >= DEFERRED_GC_THRESHOLD
    GC.enable
    GC.start
    GC.disable

    @@last_gc_run = Time.now
  end
end

