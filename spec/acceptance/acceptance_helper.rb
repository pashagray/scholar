require 'rails_helper'
# Capybara.server = :puma
Capybara.default_driver = :webkit
Capybara.default_max_wait_time = 10
Capybara.server_host = '0.0.0.0'
Capybara.server_port = 313_37

RSpec.configure do |config|
  config.include SignInMacros, type: :feature
  # config.include WaitForAjax, type: :feature

  # config.before(:each, type: :feature) do
  # # Note (Mike Coutermarsh): Make browser huge so that no content is hidden
  # # during tests
  #     window = Capybara.current_session.driver.browser.manage.window
  #      #window.resize_to(1400, 900)
  #     window.maximize
  #   end

  config.after(:each, type: :feature) do
   Capybara.current_session.driver.quit
  end

  config.before(:suite) do
    Faker::Config.locale = 'ru'
  end

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:deletion)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :deletion
  end

  # config.before(:each, js: true) do
  #   DatabaseCleaner.strategy = :truncation
  # end

  config.before(:each) do
    DatabaseCleaner.clean
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
