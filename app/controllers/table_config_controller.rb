class TableConfigController < ApplicationController
  def update
    table_name = params[:table].keys.first
    puts '!!!'
    klass = "TableHandler::#{table_name.camelize}".constantize
    puts klass
    puts '!!!'
  end
end