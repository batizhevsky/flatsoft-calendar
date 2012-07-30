class CalendarController < ApplicationController
  
  def index
    @show_all = params[:show_all]
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)

    if @show_all == "false"
      @event_strips = Event.event_strips_for_month(@shown_month, conditions: ['user_id = ?', current_user.id])
    else
      @event_strips = Event.event_strips_for_month(@shown_month)
    end
  end

end
