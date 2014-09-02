ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_as(team)
    session[:team_id] = teams(team).id
  end

  def logout
    session.delete :team_id
  end

  def setup
    login_as :one if defined? session
  end
end
