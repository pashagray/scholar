module My
  class NotificationsController < BaseController
    def index
      if params[:date]
        start_of_day = Time.parse(params[:date])
        end_of_day = start_of_day.end_of_day
        @notifications = current_user.notifications.where(
          created_at: start_of_day..end_of_day
        )
      else
        @notifications = current_user.notifications.unopened_only
      end
    end

    def mark_as_read
      @notification = current_user.notifications.find(params[:id])
      @id = @notification.id
      if @notification.notifiable
        @notification.open!
      else
        @notification.destroy!
      end
      render 'mark_as_read', layout: false
    end
  end
end
