require "policy_machine_test_app/version"

module PolicyMachineTestApp
  def self.load_up!
    ENV['RAILS_ENV'] = 'test'
    require_relative './test_app/config/environment.rb'
    Rails.backtrace_cleaner.remove_silencers!
  end

  def self.load_rakes
    require_relative './test_app/config/application'

    Rails.application.load_tasks
  end
end
