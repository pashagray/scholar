module Teacher
  class BaseController < ApplicationController
    layout 'teacher'

    before_action -> { raise ActionController::RoutingError.new('Not Found') unless current_user.teacher? }
  end
end