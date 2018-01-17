module Multirole
  class WelcomeController < BaseController
    def index
      render text: current_user.roles
    end
  end
end