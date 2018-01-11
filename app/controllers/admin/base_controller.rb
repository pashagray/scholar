module Admin
  class BaseController < ApplicationController
    layout 'admin'

    before_action -> { raise ActionController::RoutingError.new('Not Found') unless current_user.admin? }
  end
end